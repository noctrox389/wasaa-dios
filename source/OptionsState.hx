package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import flixel.addons.display.FlxBackdrop;
import Controls;

using StringTools;

// TO DO: Redo the menu creation system for not being as dumb
class OptionsState extends MusicBeatState
{
	var options:Array<String> = ['Notes', 'Controls', 'Preferences'];
	private var grpOptions:FlxTypedGroup<Alphabet>;

	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;

	var starsBG:FlxBackdrop;
	var starsFG:FlxBackdrop;

	override function create()
	{
		super.create();

		#if desktop
		DiscordClient.changePresence("Options Menu", null);
		#end

		starsBG = new FlxBackdrop(Paths.image('freeplay/starBG', 'impostor'), 1, 1, true, true);
		starsBG.setPosition(111.3, 67.95);
		starsBG.antialiasing = !ClientPrefs.lowQuality;
		starsBG.updateHitbox();
		starsBG.scrollFactor.set();
		add(starsBG);

		starsFG = new FlxBackdrop(Paths.image('freeplay/starFG', 'impostor'), 1, 1, true, true);
		starsFG.setPosition(54.3, 59.45);
		starsFG.updateHitbox();
		starsFG.antialiasing = !ClientPrefs.lowQuality;
		starsFG.scrollFactor.set();
		add(starsFG);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...options.length)
		{
			var optionText:Alphabet = new Alphabet(0, 0, options[i], true, false);
			optionText.screenCenter();
			optionText.y += (100 * (i - (options.length / 2))) + 50;
			grpOptions.add(optionText);
		}

		changeSelection();

		#if mobile
		addVirtualPad(UP_DOWN, A_B);
		#end
	}

	override function closeSubState()
	{
		super.closeSubState();
		ClientPrefs.saveSettings();
		changeSelection();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.UI_UP_P)
		{
			changeSelection(-1);
		}
		if (controls.UI_DOWN_P)
		{
			changeSelection(1);
		}

		if (controls.BACK)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}

		if (controls.ACCEPT)
		{
			for (item in grpOptions.members)
			{
				item.alpha = 0;
			}

			#if mobile
			removeVirtualPad();
			#end

			switch (options[curSelected])
			{
				case 'Notes':
					openSubState(new NotesSubstate());

				case 'Controls':
					openSubState(new ControlsSubState());

				case 'Preferences':
					openSubState(new PreferencesSubstate());
			}
		}
	}

	function changeSelection(change:Int = 0)
	{
		curSelected += change;
		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0)
			{
				item.alpha = 1;
			}
		}
	}
}

class NotesSubstate extends MusicBeatSubstate
{
	private static var curSelected:Int = 0;
	private static var typeSelected:Int = 0;

	private var grpNumbers:FlxTypedGroup<Alphabet>;
	private var grpNotes:FlxTypedGroup<FlxSprite>;
	private var shaderArray:Array<ColorSwap> = [];
	var curValue:Float = 0;
	var holdTime:Float = 0;
	var hsvText:Alphabet;
	var nextAccept:Int = 5;

	var posX = 250;

	public function new()
	{
		super();

		grpNotes = new FlxTypedGroup<FlxSprite>();
		add(grpNotes);
		grpNumbers = new FlxTypedGroup<Alphabet>();
		add(grpNumbers);

		for (i in 0...ClientPrefs.arrowHSV.length)
		{
			var yPos:Float = (165 * i) + 35;
			for (j in 0...3)
			{
				var optionText:Alphabet = new Alphabet(0, yPos + 30, Std.string(ClientPrefs.arrowHSV[i][j]), true);
				optionText.x = posX + (225 * j) + 100 - ((optionText.lettersArray.length * 90) / 2);
				grpNumbers.add(optionText);
			}

			var note:FlxSprite = new FlxSprite(posX - 70, yPos);
			note.frames = Paths.getSparrowAtlas('NOTE_assets');
			switch (i)
			{
				case 0:
					note.animation.addByPrefix('idle', 'purple0');
				case 1:
					note.animation.addByPrefix('idle', 'blue0');
				case 2:
					note.animation.addByPrefix('idle', 'green0');
				case 3:
					note.animation.addByPrefix('idle', 'red0');
			}
			note.animation.play('idle');
			note.antialiasing = ClientPrefs.globalAntialiasing;
			grpNotes.add(note);

			var newShader:ColorSwap = new ColorSwap();
			note.shader = newShader.shader;
			newShader.hue = ClientPrefs.arrowHSV[i][0] / 360;
			newShader.saturation = ClientPrefs.arrowHSV[i][1] / 100;
			newShader.brightness = ClientPrefs.arrowHSV[i][2] / 100;
			shaderArray.push(newShader);
		}
		hsvText = new Alphabet(0, 0, "Hue    Saturation  Brightness", true, false, 0, 0.65);
		add(hsvText);
		changeSelection();

		#if mobile
		addVirtualPad(LEFT_FULL, A_B_C);
		#end
	}

	var changingNote:Bool = false;
	var hsvTextOffsets:Array<Float> = [240, 90];

	override function update(elapsed:Float)
	{
		if (changingNote)
		{
			if (holdTime < 0.5)
			{
				if (controls.UI_LEFT_P)
				{
					updateValue(-1);
					FlxG.sound.play(Paths.sound('scrollMenu'));
				}
				else if (controls.UI_RIGHT_P)
				{
					updateValue(1);
					FlxG.sound.play(Paths.sound('scrollMenu'));
				}
				else if (controls.RESET #if mobile || virtualPad.buttonC.justPressed #end)
				{
					resetValue(curSelected, typeSelected);
					FlxG.sound.play(Paths.sound('scrollMenu'));
				}
				if (controls.UI_LEFT_R || controls.UI_RIGHT_R)
				{
					holdTime = 0;
				}
				else if (controls.UI_LEFT || controls.UI_RIGHT)
				{
					holdTime += elapsed;
				}
			}
			else
			{
				var add:Float = 90;
				switch (typeSelected)
				{
					case 1 | 2:
						add = 50;
				}
				if (controls.UI_LEFT)
				{
					updateValue(elapsed * -add);
				}
				else if (controls.UI_RIGHT)
				{
					updateValue(elapsed * add);
				}
				if (controls.UI_LEFT_R || controls.UI_RIGHT_R)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'));
					holdTime = 0;
				}
			}
		}
		else
		{
			if (controls.UI_UP_P)
			{
				changeSelection(-1);
				FlxG.sound.play(Paths.sound('scrollMenu'));
			}
			if (controls.UI_DOWN_P)
			{
				changeSelection(1);
				FlxG.sound.play(Paths.sound('scrollMenu'));
			}
			if (controls.UI_LEFT_P)
			{
				changeType(-1);
				FlxG.sound.play(Paths.sound('scrollMenu'));
			}
			if (controls.UI_RIGHT_P)
			{
				changeType(1);
				FlxG.sound.play(Paths.sound('scrollMenu'));
			}
			if (controls.RESET #if mobile || virtualPad.buttonC.justPressed #end)
			{
				for (i in 0...3)
				{
					resetValue(curSelected, i);
				}
				FlxG.sound.play(Paths.sound('scrollMenu'));
			}
			if (controls.ACCEPT && nextAccept <= 0)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changingNote = true;
				holdTime = 0;
				for (i in 0...grpNumbers.length)
				{
					var item = grpNumbers.members[i];
					item.alpha = 0;
					if ((curSelected * 3) + typeSelected == i)
					{
						item.alpha = 1;
					}
				}
				for (i in 0...grpNotes.length)
				{
					var item = grpNotes.members[i];
					item.alpha = 0;
					if (curSelected == i)
					{
						item.alpha = 1;
					}
				}
				super.update(elapsed);
				return;
			}
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 9.6, 0, 1);
		for (i in 0...grpNotes.length)
		{
			var item = grpNotes.members[i];
			var intendedPos:Float = posX - 70;
			if (curSelected == i)
			{
				item.x = FlxMath.lerp(item.x, intendedPos + 100, lerpVal);
			}
			else
			{
				item.x = FlxMath.lerp(item.x, intendedPos, lerpVal);
			}
			for (j in 0...3)
			{
				var item2 = grpNumbers.members[(i * 3) + j];
				item2.x = item.x + 265 + (225 * (j % 3)) - (30 * item2.lettersArray.length) / 2;
				if (ClientPrefs.arrowHSV[i][j] < 0)
				{
					item2.x -= 20;
				}
			}

			if (curSelected == i)
			{
				hsvText.setPosition(item.x + hsvTextOffsets[0], item.y - hsvTextOffsets[1]);
			}
		}

		if (controls.BACK || (changingNote && controls.ACCEPT))
		{
			changeSelection();
			if (!changingNote)
			{
				grpNumbers.forEachAlive(function(spr:Alphabet)
				{
					spr.alpha = 0;
				});
				grpNotes.forEachAlive(function(spr:FlxSprite)
				{
					spr.alpha = 0;
				});
				#if mobile
				flixel.addons.transition.FlxTransitionableState.skipNextTransOut = true;
				FlxG.resetState();
				#else
				close();
				#end
			}
			changingNote = false;
			FlxG.sound.play(Paths.sound('cancelMenu'));
		}

		if (nextAccept > 0)
		{
			nextAccept -= 1;
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		curSelected += change;
		if (curSelected < 0)
			curSelected = ClientPrefs.arrowHSV.length - 1;
		if (curSelected >= ClientPrefs.arrowHSV.length)
			curSelected = 0;

		curValue = ClientPrefs.arrowHSV[curSelected][typeSelected];
		updateValue();

		for (i in 0...grpNumbers.length)
		{
			var item = grpNumbers.members[i];
			item.alpha = 0.6;
			if ((curSelected * 3) + typeSelected == i)
			{
				item.alpha = 1;
			}
		}
		for (i in 0...grpNotes.length)
		{
			var item = grpNotes.members[i];
			item.alpha = 0.6;
			item.scale.set(1, 1);
			if (curSelected == i)
			{
				item.alpha = 1;
				item.scale.set(1.2, 1.2);
				hsvText.setPosition(item.x + hsvTextOffsets[0], item.y - hsvTextOffsets[1]);
			}
		}
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}

	function changeType(change:Int = 0)
	{
		typeSelected += change;
		if (typeSelected < 0)
			typeSelected = 2;
		if (typeSelected > 2)
			typeSelected = 0;

		curValue = ClientPrefs.arrowHSV[curSelected][typeSelected];
		updateValue();

		for (i in 0...grpNumbers.length)
		{
			var item = grpNumbers.members[i];
			item.alpha = 0.6;
			if ((curSelected * 3) + typeSelected == i)
			{
				item.alpha = 1;
			}
		}
	}

	function resetValue(selected:Int, type:Int)
	{
		curValue = 0;
		ClientPrefs.arrowHSV[selected][type] = 0;
		switch (type)
		{
			case 0:
				shaderArray[selected].hue = 0;
			case 1:
				shaderArray[selected].saturation = 0;
			case 2:
				shaderArray[selected].brightness = 0;
		}
		grpNumbers.members[(selected * 3) + type].changeText('0');
	}

	function updateValue(change:Float = 0)
	{
		curValue += change;
		var roundedValue:Int = Math.round(curValue);
		var max:Float = 180;
		switch (typeSelected)
		{
			case 1 | 2:
				max = 100;
		}

		if (roundedValue < -max)
		{
			curValue = -max;
		}
		else if (roundedValue > max)
		{
			curValue = max;
		}
		roundedValue = Math.round(curValue);
		ClientPrefs.arrowHSV[curSelected][typeSelected] = roundedValue;

		switch (typeSelected)
		{
			case 0:
				shaderArray[curSelected].hue = roundedValue / 360;
			case 1:
				shaderArray[curSelected].saturation = roundedValue / 100;
			case 2:
				shaderArray[curSelected].brightness = roundedValue / 100;
		}
		grpNumbers.members[(curSelected * 3) + typeSelected].changeText(Std.string(roundedValue));
	}
}

class ControlsSubState extends MusicBeatSubstate
{
	private static var curSelected:Int = -1;
	private static var curAlt:Bool = false;

	private static var defaultKey:String = 'Reset to Default Keys';

	private var bindLength:Int = 0;

	var optionShit:Array<Dynamic> = [
		['NOTES'], ['Left', 'note_left'], ['Down', 'note_down'], ['Up', 'note_up'], ['Right', 'note_right'], [''], ['UI'], ['Left', 'ui_left'],
		['Down', 'ui_down'], ['Up', 'ui_up'], ['Right', 'ui_right'], [''], ['Reset', 'reset'], ['Accept', 'accept'], ['Back', 'back'], ['Pause', 'pause'],
		[''], ['VOLUME'], ['Mute', 'volume_mute'], ['Up', 'volume_up'], ['Down', 'volume_down'], [''], ['DEBUG'], ['Key 1', 'debug_1'], ['Key 2', 'debug_2']];

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var grpInputs:Array<AttachedText> = [];
	private var grpInputsAlt:Array<AttachedText> = [];
	var rebindingKey:Bool = false;
	var nextAccept:Int = 5;

	public function new()
	{
		super();

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.color = 0xFFea71fd;
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		optionShit.push(['']);
		optionShit.push([defaultKey]);

		for (i in 0...optionShit.length)
		{
			var isCentered:Bool = false;
			var isDefaultKey:Bool = (optionShit[i][0] == defaultKey);
			if (unselectableCheck(i, true))
			{
				isCentered = true;
			}

			var optionText:Alphabet = new Alphabet(0, (10 * i), optionShit[i][0], (!isCentered || isDefaultKey), false);
			optionText.isMenuItem = true;
			if (isCentered)
			{
				optionText.screenCenter(X);
				optionText.forceX = optionText.x;
				optionText.yAdd = -55;
			}
			else
			{
				optionText.forceX = 200;
			}
			optionText.yMult = 60;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if (!isCentered)
			{
				addBindTexts(optionText, i);
				bindLength++;
				if (curSelected < 0)
					curSelected = i;
			}
		}

		changeSelection();

		#if mobile
		addVirtualPad(UP_DOWN, A_B);
		#end
	}

	var leaving:Bool = false;
	var bindingTime:Float = 0;

	override function update(elapsed:Float)
	{
		if (!rebindingKey)
		{
			if (controls.UI_UP_P)
			{
				changeSelection(-1);
			}
			if (controls.UI_DOWN_P)
			{
				changeSelection(1);
			}
			if (controls.UI_LEFT_P || controls.UI_RIGHT_P)
			{
				changeAlt();
			}

			if (controls.BACK)
			{
				ClientPrefs.reloadControls();
				#if mobile
				flixel.addons.transition.FlxTransitionableState.skipNextTransOut = true;
				FlxG.resetState();
				#else
				close();
				#end
				FlxG.sound.play(Paths.sound('cancelMenu'));
			}

			if (controls.ACCEPT && nextAccept <= 0)
			{
				if (optionShit[curSelected][0] == defaultKey)
				{
					ClientPrefs.keyBinds = ClientPrefs.defaultKeys.copy();
					reloadKeys();
					changeSelection();
					FlxG.sound.play(Paths.sound('confirmMenu'));
				}
				else if (!unselectableCheck(curSelected))
				{
					bindingTime = 0;
					rebindingKey = true;
					if (curAlt)
					{
						grpInputsAlt[getInputTextNum()].alpha = 0;
					}
					else
					{
						grpInputs[getInputTextNum()].alpha = 0;
					}
					FlxG.sound.play(Paths.sound('scrollMenu'));
				}
			}
		}
		else
		{
			var keyPressed:Int = FlxG.keys.firstJustPressed();
			if (keyPressed > -1)
			{
				var keysArray:Array<FlxKey> = ClientPrefs.keyBinds.get(optionShit[curSelected][1]);
				keysArray[curAlt ? 1 : 0] = keyPressed;

				var opposite:Int = (curAlt ? 0 : 1);
				if (keysArray[opposite] == keysArray[1 - opposite])
				{
					keysArray[opposite] = NONE;
				}
				ClientPrefs.keyBinds.set(optionShit[curSelected][1], keysArray);

				reloadKeys();
				FlxG.sound.play(Paths.sound('confirmMenu'));
				rebindingKey = false;
			}

			bindingTime += elapsed;
			if (bindingTime > 5)
			{
				if (curAlt)
				{
					grpInputsAlt[curSelected].alpha = 1;
				}
				else
				{
					grpInputs[curSelected].alpha = 1;
				}
				FlxG.sound.play(Paths.sound('scrollMenu'));
				rebindingKey = false;
				bindingTime = 0;
			}
		}

		if (nextAccept > 0)
		{
			nextAccept -= 1;
		}
		super.update(elapsed);
	}

	function getInputTextNum()
	{
		var num:Int = 0;
		for (i in 0...curSelected)
		{
			if (optionShit[i].length > 1)
			{
				num++;
			}
		}
		return num;
	}

	function changeSelection(change:Int = 0)
	{
		do
		{
			curSelected += change;
			if (curSelected < 0)
				curSelected = optionShit.length - 1;
			if (curSelected >= optionShit.length)
				curSelected = 0;
		}
		while (unselectableCheck(curSelected));

		var bullShit:Int = 0;

		for (i in 0...grpInputs.length)
		{
			grpInputs[i].alpha = 0.6;
		}
		for (i in 0...grpInputsAlt.length)
		{
			grpInputsAlt[i].alpha = 0.6;
		}

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if (!unselectableCheck(bullShit - 1))
			{
				item.alpha = 0.6;
				if (item.targetY == 0)
				{
					item.alpha = 1;
					if (curAlt)
					{
						for (i in 0...grpInputsAlt.length)
						{
							if (grpInputsAlt[i].sprTracker == item)
							{
								grpInputsAlt[i].alpha = 1;
								break;
							}
						}
					}
					else
					{
						for (i in 0...grpInputs.length)
						{
							if (grpInputs[i].sprTracker == item)
							{
								grpInputs[i].alpha = 1;
								break;
							}
						}
					}
				}
			}
		}
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}

	function changeAlt()
	{
		curAlt = !curAlt;
		for (i in 0...grpInputs.length)
		{
			if (grpInputs[i].sprTracker == grpOptions.members[curSelected])
			{
				grpInputs[i].alpha = 0.6;
				if (!curAlt)
				{
					grpInputs[i].alpha = 1;
				}
				break;
			}
		}
		for (i in 0...grpInputsAlt.length)
		{
			if (grpInputsAlt[i].sprTracker == grpOptions.members[curSelected])
			{
				grpInputsAlt[i].alpha = 0.6;
				if (curAlt)
				{
					grpInputsAlt[i].alpha = 1;
				}
				break;
			}
		}
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}

	private function unselectableCheck(num:Int, ?checkDefaultKey:Bool = false):Bool
	{
		if (optionShit[num][0] == defaultKey)
		{
			return checkDefaultKey;
		}
		return optionShit[num].length < 2 && optionShit[num][0] != defaultKey;
	}

	private function addBindTexts(optionText:Alphabet, num:Int)
	{
		var keys:Array<Dynamic> = ClientPrefs.keyBinds.get(optionShit[num][1]);
		var text1 = new AttachedText(InputFormatter.getKeyName(keys[0]), 400, -55);
		text1.setPosition(optionText.x + 400, optionText.y - 55);
		text1.sprTracker = optionText;
		grpInputs.push(text1);
		add(text1);

		var text2 = new AttachedText(InputFormatter.getKeyName(keys[1]), 650, -55);
		text2.setPosition(optionText.x + 650, optionText.y - 55);
		text2.sprTracker = optionText;
		grpInputsAlt.push(text2);
		add(text2);
	}

	function reloadKeys()
	{
		while (grpInputs.length > 0)
		{
			var item:AttachedText = grpInputs[0];
			item.kill();
			grpInputs.remove(item);
			item.destroy();
		}
		while (grpInputsAlt.length > 0)
		{
			var item:AttachedText = grpInputsAlt[0];
			item.kill();
			grpInputsAlt.remove(item);
			item.destroy();
		}

		trace('Reloaded keys: ' + ClientPrefs.keyBinds);

		for (i in 0...grpOptions.length)
		{
			if (!unselectableCheck(i, true))
			{
				addBindTexts(grpOptions.members[i], i);
			}
		}

		var bullShit:Int = 0;
		for (i in 0...grpInputs.length)
		{
			grpInputs[i].alpha = 0.6;
		}
		for (i in 0...grpInputsAlt.length)
		{
			grpInputsAlt[i].alpha = 0.6;
		}

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if (!unselectableCheck(bullShit - 1))
			{
				item.alpha = 0.6;
				if (item.targetY == 0)
				{
					item.alpha = 1;
					if (curAlt)
					{
						for (i in 0...grpInputsAlt.length)
						{
							if (grpInputsAlt[i].sprTracker == item)
							{
								grpInputsAlt[i].alpha = 1;
							}
						}
					}
					else
					{
						for (i in 0...grpInputs.length)
						{
							if (grpInputs[i].sprTracker == item)
							{
								grpInputs[i].alpha = 1;
							}
						}
					}
				}
			}
		}
	}
}

class PreferencesSubstate extends MusicBeatSubstate
{
	private static var curSelected:Int = 0;
	static var unselectableOptions:Array<String> = ['GRAPHICS', 'GAMEPLAY'];
	static var noCheckbox:Array<String> = ['Framerate', 'Note Delay'];

	static var options:Array<String> = [
		'GRAPHICS',
		'Low Quality',
		'GL Render',
		#if !html5
		'Framerate', // Apparently 120FPS isn't correctly supported on Browser? Probably it has some V-Sync shit enabled by default, idk
		#end
		'GAMEPLAY',
		#if mobile
		'Hitbox Input',
		#end
		'Downscroll',
		'Middlescroll',
		'Ghost Tapping',
		'Note Delay',
		'Note Splashes',
		'Hide HUD',
		'Hide Song Length',
		'Flashing Lights',
		'Camera Zooms',
		'Overlay Display'
	];

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var checkboxArray:Array<CheckboxThingie> = [];
	private var checkboxNumber:Array<Int> = [];
	private var grpTexts:FlxTypedGroup<AttachedText>;
	private var textNumber:Array<Int> = [];

	private var showCharacter:Character = null;
	private var descText:FlxText;

	public function new()
	{
		super();
		// avoids lagspikes while scrolling through menus!
		showCharacter = new Character(840, 170, 'bf', true);
		showCharacter.setGraphicSize(Std.int(showCharacter.width * 0.8));
		showCharacter.updateHitbox();
		showCharacter.dance();
		add(showCharacter);
		showCharacter.visible = false;

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		grpTexts = new FlxTypedGroup<AttachedText>();
		add(grpTexts);

		for (i in 0...options.length)
		{
			var isCentered:Bool = unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, options[i], true, false);
			optionText.isMenuItem = true;
			if (isCentered)
			{
				optionText.screenCenter(X);
				optionText.forceX = optionText.x;
			}
			else
			{
				optionText.x += 300;
				optionText.forceX = 300;
			}
			optionText.yMult = 90;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if (!isCentered)
			{
				var useCheckbox:Bool = true;
				for (j in 0...noCheckbox.length)
				{
					if (options[i] == noCheckbox[j])
					{
						useCheckbox = false;
						break;
					}
				}

				if (useCheckbox)
				{
					var checkbox:CheckboxThingie = new CheckboxThingie(optionText.x - 105, optionText.y, false);
					checkbox.sprTracker = optionText;
					checkboxArray.push(checkbox);
					checkboxNumber.push(i);
					add(checkbox);
				}
				else
				{
					var valueText:AttachedText = new AttachedText('0', optionText.width + 80, 0, true);
					valueText.sprTracker = optionText;
					grpTexts.add(valueText);
					textNumber.push(i);
				}
			}
		}

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);

		for (i in 0...options.length)
		{
			if (!unselectableCheck(i))
			{
				curSelected = i;
				break;
			}
		}

		changeSelection();
		reloadValues();

		#if mobile
		addVirtualPad(LEFT_FULL, A_B);
		#end
	}

	var nextAccept:Int = 5;
	var holdTime:Float = 0;

	override function update(elapsed:Float)
	{
		if (controls.UI_UP_P)
		{
			changeSelection(-1);
		}
		if (controls.UI_DOWN_P)
		{
			changeSelection(1);
		}

		if (controls.BACK)
		{
			grpOptions.forEachAlive(function(spr:Alphabet)
			{
				spr.alpha = 0;
			});
			grpTexts.forEachAlive(function(spr:AttachedText)
			{
				spr.alpha = 0;
			});
			for (i in 0...checkboxArray.length)
			{
				var spr:CheckboxThingie = checkboxArray[i];
				if (spr != null)
				{
					spr.alpha = 0;
				}
			}
			if (showCharacter != null)
			{
				showCharacter.alpha = 0;
			}
			descText.alpha = 0;
			#if mobile
			flixel.addons.transition.FlxTransitionableState.skipNextTransOut = true;
			FlxG.resetState();
			#else
			close();
			#end
			FlxG.sound.play(Paths.sound('cancelMenu'));
		}

		var usesCheckbox = true;
		for (i in 0...noCheckbox.length)
		{
			if (options[curSelected] == noCheckbox[i])
			{
				usesCheckbox = false;
				break;
			}
		}

		if (usesCheckbox)
		{
			if (controls.ACCEPT && nextAccept <= 0)
			{
				switch (options[curSelected])
				{
					case 'Overlay Display':
						ClientPrefs.showFPS = !ClientPrefs.showFPS;
						if (Main.fpsCounter != null)
							Main.fpsCounter.visible = ClientPrefs.showFPS;

					case 'Low Quality':
						ClientPrefs.lowQuality = !ClientPrefs.lowQuality;

					case 'GL Render':
						ClientPrefs.useGL = !ClientPrefs.useGL;

					case 'Note Splashes':
						ClientPrefs.noteSplashes = !ClientPrefs.noteSplashes;

					case 'Flashing Lights':
						ClientPrefs.flashing = !ClientPrefs.flashing;

					case 'Violence':
						ClientPrefs.violence = !ClientPrefs.violence;

					case 'Hitbox Input':
						ClientPrefs.hitboxInput = !ClientPrefs.hitboxInput;

					case 'Swearing':
						ClientPrefs.cursing = !ClientPrefs.cursing;

					case 'Downscroll':
						ClientPrefs.downScroll = !ClientPrefs.downScroll;

					case 'Middlescroll':
						ClientPrefs.middleScroll = !ClientPrefs.middleScroll;

					case 'Ghost Tapping':
						ClientPrefs.ghostTapping = !ClientPrefs.ghostTapping;

					case 'Camera Zooms':
						ClientPrefs.camZooms = !ClientPrefs.camZooms;

					case 'Hide HUD':
						ClientPrefs.hideHud = !ClientPrefs.hideHud;

					case 'Hide Song Length':
						ClientPrefs.hideTime = !ClientPrefs.hideTime;
				}
				FlxG.sound.play(Paths.sound('scrollMenu'));
				reloadValues();
			}
		}
		else
		{
			if (controls.UI_LEFT || controls.UI_RIGHT)
			{
				var add:Int = controls.UI_LEFT ? -1 : 1;
				if (holdTime > 0.5 || controls.UI_LEFT_P || controls.UI_RIGHT_P)
					switch (options[curSelected])
					{
						case 'Framerate':
							ClientPrefs.framerate += add;
							if (ClientPrefs.framerate < 60)
								ClientPrefs.framerate = 60;
							else if (ClientPrefs.framerate > 240)
								ClientPrefs.framerate = 240;

							if (ClientPrefs.framerate > FlxG.drawFramerate)
							{
								FlxG.updateFramerate = ClientPrefs.framerate;
								FlxG.drawFramerate = ClientPrefs.framerate;
							}
							else
							{
								FlxG.drawFramerate = ClientPrefs.framerate;
								FlxG.updateFramerate = ClientPrefs.framerate;
							}
						case 'Note Delay':
							var mult:Int = 1;
							if (holdTime > 1.5)
							{ // Double speed after 1.5 seconds holding
								mult = 2;
							}
							ClientPrefs.noteOffset += add * mult;
							if (ClientPrefs.noteOffset < 0)
								ClientPrefs.noteOffset = 0;
							else if (ClientPrefs.noteOffset > 500)
								ClientPrefs.noteOffset = 500;
					}
				reloadValues();

				if (holdTime <= 0)
					FlxG.sound.play(Paths.sound('scrollMenu'));
				holdTime += elapsed;
			}
			else
			{
				holdTime = 0;
			}
		}

		if (showCharacter != null && showCharacter.animation.curAnim.finished)
		{
			showCharacter.dance();
		}

		if (nextAccept > 0)
		{
			nextAccept -= 1;
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		do
		{
			curSelected += change;
			if (curSelected < 0)
				curSelected = options.length - 1;
			if (curSelected >= options.length)
				curSelected = 0;
		}
		while (unselectableCheck(curSelected));

		var daText:String = '';
		switch (options[curSelected])
		{
			case 'Framerate':
				daText = "Pretty self explanatory, isn't it?\nDefault value is 60.";
			case 'Note Delay':
				daText = "Changes how late a note is spawned.\nUseful for preventing audio lag from wireless earphones.";
			case 'Overlay Display':
				daText = "If unchecked, hides Overlay Display.";
			case 'Low Quality':
				daText = "If checked, disables some background details,\ndecreases loading times and improves performance.";
			case 'GL Render':
				daText = "If checked some images will be rendered with gl.";
			case 'Anti-Aliasing':
				daText = "If unchecked, disables anti-aliasing, increases performance\nat the cost of the graphics not looking as smooth.";
			case 'Downscroll':
				daText = "If checked, notes go Down instead of Up, simple enough.";
			case 'Middlescroll':
				daText = "If checked, hides Opponent's notes and your notes get centered.";
			case 'Ghost Tapping':
				daText = "If checked, you won't get misses from pressing keys\nwhile there are no notes able to be hit.";
			case 'Swearing':
				daText = "If unchecked, your mom won't be angry at you.";
			case 'Violence':
				daText = "If unchecked, you won't get disgusted as frequently.";
			case 'Hitbox Input':
				daText = "If unchecked, you can only play with keyboard";
			case 'Note Splashes':
				daText = "If unchecked, hitting \"Sick!\" notes won't show particles.";
			case 'Flashing Lights':
				daText = "Uncheck this if you're sensitive to flashing lights!";
			case 'Camera Zooms':
				daText = "If unchecked, the camera won't zoom in on a beat hit.";
			case 'Hide HUD':
				daText = "If checked, hides most HUD elements.";
			case 'Hide Song Length':
				daText = "If checked, the bar showing how much time is left\nwill be hidden.";
		}
		descText.text = daText;

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if (!unselectableCheck(bullShit - 1))
			{
				item.alpha = 0.6;
				if (item.targetY == 0)
				{
					item.alpha = 1;
				}

				for (j in 0...checkboxArray.length)
				{
					var tracker:FlxSprite = checkboxArray[j].sprTracker;
					if (tracker == item)
					{
						checkboxArray[j].alpha = item.alpha;
						break;
					}
				}
			}
		}
		for (i in 0...grpTexts.members.length)
		{
			var text:AttachedText = grpTexts.members[i];
			if (text != null)
			{
				text.alpha = 0.6;
				if (textNumber[i] == curSelected)
				{
					text.alpha = 1;
				}
			}
		}

		showCharacter.visible = (options[curSelected] == 'Anti-Aliasing');
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}

	function reloadValues()
	{
		for (i in 0...checkboxArray.length)
		{
			var checkbox:CheckboxThingie = checkboxArray[i];
			if (checkbox != null)
			{
				var daValue:Bool = false;
				switch (options[checkboxNumber[i]])
				{
					case 'Overlay Display':
						daValue = ClientPrefs.showFPS;
					case 'Low Quality':
						daValue = ClientPrefs.lowQuality;
					case 'GL Render':
						daValue = ClientPrefs.useGL;
					case 'Anti-Aliasing':
						daValue = ClientPrefs.globalAntialiasing;
					case 'Note Splashes':
						daValue = ClientPrefs.noteSplashes;
					case 'Flashing Lights':
						daValue = ClientPrefs.flashing;
					case 'Downscroll':
						daValue = ClientPrefs.downScroll;
					case 'Middlescroll':
						daValue = ClientPrefs.middleScroll;
					case 'Ghost Tapping':
						daValue = ClientPrefs.ghostTapping;
					case 'Swearing':
						daValue = ClientPrefs.cursing;
					case 'Violence':
						daValue = ClientPrefs.violence;
					case 'Hitbox Input':
						daValue = ClientPrefs.hitboxInput;
					case 'Camera Zooms':
						daValue = ClientPrefs.camZooms;
					case 'Hide HUD':
						daValue = ClientPrefs.hideHud;
					case 'Hide Song Length':
						daValue = ClientPrefs.hideTime;
				}
				checkbox.daValue = daValue;
			}
		}
		for (i in 0...grpTexts.members.length)
		{
			var text:AttachedText = grpTexts.members[i];
			if (text != null)
			{
				var daText:String = '';
				switch (options[textNumber[i]])
				{
					case 'Framerate':
						daText = '' + ClientPrefs.framerate;
					case 'Note Delay':
						daText = ClientPrefs.noteOffset + 'ms';
				}
				var lastTracker:FlxSprite = text.sprTracker;
				text.sprTracker = null;
				text.changeText(daText);
				text.sprTracker = lastTracker;
			}
		}
	}

	private function unselectableCheck(num:Int):Bool
	{
		for (i in 0...unselectableOptions.length)
		{
			if (options[num] == unselectableOptions[i])
			{
				return true;
			}
		}
		return options[num] == '';
	}
}
