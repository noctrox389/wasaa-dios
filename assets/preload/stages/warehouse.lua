
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0
local xx = 640;
local yy = 350;
local xx2 = 640;
local yy2 = 350;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
makeLuaSprite('torture_wall', 'Stages/Pip/tORTUrea/torture_wall', -675, -325);
setScrollFactor('torture_wall', 1, 1);
scaleLuaSprite('torture_wall', 2, 1);
addLuaSprite('torture_wall', false);

makeLuaSprite('tort_floor', 'Stages/Pip/tORTUrea/tort_floor', -675, 515);
setScrollFactor('tort_floor', 1, 1);
scaleLuaSprite('tort_floor', 2, 1);
addLuaSprite('tort_floor', false);

makeLuaSprite('torture_glow', 'Stages/Pip/tORTUrea/torture_glow', -675, -150);
setScrollFactor('torture_glow', 1, 1);
scaleLuaSprite('torture_glow', 2, 1);
addLuaSprite('torture_glow', true);

makeLuaSprite('torture_glow2', 'Stages/Pip/tORTUrea/torture_glow2', -675, -150);
setScrollFactor('torture_glow2', 1, 1);
scaleLuaSprite('torture_glow2', 2, 1);
addLuaSprite('torture_glow2', true);

setProperty('torture_glow.alpha', 0.25);
setProperty('torture_glow2.alpha', 0.25);

setBlendMode('torture_glow2','add')
setBlendMode('torture_glow','multiply')

makeAnimatedLuaSprite('blades', 'Stages/Pip/tORTUrea/blades', 220, -775);
addAnimationByPrefix('blades', 'blades', 'blades', 24, true);  
objectPlayAnimation('blades', 'blades', true)
addLuaSprite('blades', false);

makeAnimatedLuaSprite('blades2', 'Stages/Pip/tORTUrea/blades', 810, -775);
addAnimationByPrefix('blades2', 'blades', 'blades', 24, true);  
setProperty('blades2.flipX', true);
objectPlayAnimation('blades2', 'blades', true)
addLuaSprite('blades2', false);

makeAnimatedLuaSprite('monty', 'Stages/Pip/tORTUrea/monty', -10, 440);
addAnimationByPrefix('monty', 'monty', 'monty', 24, true);
objectPlayAnimation('monty', 'monty', true)
addLuaSprite('monty', true);
setScrollFactor('monty', 1.5, 1.5);

makeAnimatedLuaSprite('monty', 'Stages/Pip/tORTUrea/monty', -10, 440);
addAnimationByPrefix('monty', 'monty', 'monty', 24, true);
objectPlayAnimation('monty', 'monty', true)
addLuaSprite('monty', true);

makeAnimatedLuaSprite('torture_roze', 'Stages/Pip/tORTUrea/torture_roze', -300, -200);
addAnimationByPrefix('torture_roze', 'RozeCamio', 'RozeCamio', 24, false);  
setScrollFactor('torture_roze', 1.5, 1.5);
addLuaSprite('torture_roze', false);

setScrollFactor('blades', 1.5, 1.5);
setScrollFactor('blades2', 1.5, 1.5);

setScrollFactor('gfGroup', 1.5, 1.5);
setScrollFactor('dadGroup', 1.5, 1.5);

makeAnimatedLuaSprite('torture_startZiffy', 'Stages/Pip/tORTUrea/torture_startZiffy', 0, 150);
addAnimationByPrefix('torture_startZiffy', 'Opening', 'Opening', 24, false);  
setObjectCamera('torture_startZiffy', 'camOther')
addLuaSprite('torture_startZiffy', false);
screenCenter('torture_startZiffy', 'x')

setProperty('camHUD.alpha', 0);
setProperty('camGame.alpha', 0);
setProperty('camOther.alpha', 0);

setObjectOrder('blades', getObjectOrder('boyfriendGroup')+1)
setObjectOrder('blades2', getObjectOrder('boyfriendGroup')+2)
setObjectOrder('gfGroup', getObjectOrder('boyfriendGroup')+3)
setObjectOrder('dadGroup', getObjectOrder('boyfriendGroup')+4)
end

function onEvent(name,value1,value2)
if name == 'Asbel' then
if value1 == 'yo' then
setProperty('camOther.alpha', 1);
objectPlayAnimation('torture_startZiffy', 'Opening', true)
elseif value1 == 'tu' then
removeLuaSprite('torture_startZiffy')
elseif value1 == 'rum' then
if downscroll then
noteTweenY("Twen1", 4, 565, 2, "bounceOut")
noteTweenY("Twen2", 5, 565, 2.1, "bounceOut")
noteTweenY("Twen3", 6, 565, 2.2, "bounceOut")
noteTweenY("Twen4", 7, 565, 2.3, "bounceOut")
else
noteTweenY("Twen1", 4, 50, 2, "bounceOut")
noteTweenY("Twen2", 5, 50, 2.1, "bounceOut")
noteTweenY("Twen3", 6, 50, 2.2, "bounceOut")
noteTweenY("Twen4", 7, 50, 2.3, "bounceOut")
end
playSound('ziffSaw', 1);

doTweenY("blades", "blades", getProperty('blades.y')+400, 1, "linear") 
doTweenY("blades2", "blades2", getProperty('blades.y')+400, 1, "linear") 
end
end
if name == 'Play Animation' then
if value1 == 'ROZEBUD' then
objectPlayAnimation('torture_roze', 'RozeCamio', true)
end
end
if name == 'HUD Fade' then
if value1 == '1' then
doTweenAlpha('camHUD', 'camHUD', 0, 2, 'linear')
elseif value1 == '0' then
doTweenAlpha('camHUD', 'camHUD', 1, 2, 'linear')
end
end 
end

function onCreatePost()

setProperty('dad.scale.x', 2)
setProperty('dad.scale.y', 2) 

setProperty('gf.scale.x', 2)
setProperty('gf.scale.y', 2) 

setProperty('dad.x', getProperty('dad.x')+200)
setProperty('dad.y', getProperty('dad.y')+200)

setProperty('gf.x', getProperty('gf.x')-400)
setProperty('gf.y', getProperty('gf.y')+200)

setProperty('boyfriend.scale.x', 2.2)
setProperty('boyfriend.scale.y', 1.1) 

setProperty('boyfriend.x', getProperty('boyfriend.x')+70)
setProperty('boyfriend.y', getProperty('boyfriend.y')+50)
end

function onCountdownStarted()
noteTweenX('op0', 0, -1000, 0.01, 'quartInOut')
noteTweenX('op1', 1, -1000, 0.01, 'quartInOut')
noteTweenX('op2', 2, -1000, 0.01, 'quartInOut')
noteTweenX('op3', 3, -1000, 0.01, 'quartInOut')
noteTweenX('py0', 4, 415, 0.01, 'quartInOut')
noteTweenX('py1', 5, 525, 0.01, 'quartInOut')
noteTweenX('py2', 6, 635, 0.01, 'quartInOut')
noteTweenX('py3', 7, 745, 0.01, 'quartInOut')
noteTweenY("Twen1", 4, -150, 1, "bounceOut")
noteTweenY("Twen2", 5, -150, 1.1, "bounceOut")
noteTweenY("Twen3", 6, -150, 1.2, "bounceOut")
noteTweenY("Twen4", 7, -150, 1.3, "bounceOut")
end

function onUpdate()
setProperty('blades.x', 320 - math.floor(getProperty('health')*50))
setProperty('blades2.x', 710 + math.floor(getProperty('health')*50))
if curBeat == 272 then
if getProperty('health')*50 > 1 then
setProperty('health', 0.1)
end
end
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
	if curBeat < 256 or curBeat > 272 then
		setProperty('torture_roze.alpha', 0);
		if followchars == true then
			if mustHitSection == false then
				setProperty('defaultCamZoom',0.9)
				if getProperty('dad.animation.curAnim.name') == 'idle' then
					triggerEvent('Camera Follow Pos',xx,yy)
				end
				if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
					triggerEvent('Camera Follow Pos',xx-ofs-50,yy)
				end
				if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
					triggerEvent('Camera Follow Pos',xx+ofs-50,yy)
				end
				if getProperty('gf.animation.curAnim.name') == 'singUP' then
					triggerEvent('Camera Follow Pos',xx-50,yy-ofs)
				end
				if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
					triggerEvent('Camera Follow Pos',xx-50,yy+ofs)
				end
				if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
					triggerEvent('Camera Follow Pos',xx-ofs+50,yy)
				end
				if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
					triggerEvent('Camera Follow Pos',xx+ofs+50,yy)
				end
				if getProperty('dad.animation.curAnim.name') == 'singUP' then
					triggerEvent('Camera Follow Pos',xx+50,yy-ofs)
				end
				if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
					triggerEvent('Camera Follow Pos',xx+50,yy+ofs)
				end
			else

				setProperty('defaultCamZoom',1.2)
				if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
					triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
					triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
					triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
					triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
					triggerEvent('Camera Follow Pos',xx2,yy2)
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
					triggerEvent('Camera Follow Pos',xx2,yy2)
			end
			end
		else
			triggerEvent('Camera Follow Pos','','')
		end
	else
		triggerEvent('Camera Follow Pos',xx,yy - 50)
		setProperty('defaultCamZoom', 0.75)
		setProperty('torture_roze.alpha', 1);
	end
    
end