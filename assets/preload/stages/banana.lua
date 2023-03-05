function onCreate()
	makeLuaSprite('sky', 'Stages/banana/sky', -359, -304);
	scaleObject('sky', 2, 2);
	setScrollFactor('sky', 0.7, 0.7);
	setProperty('sky.antialiasing', true);
	setObjectOrder('sky', 0);

	makeLuaSprite('mountains', 'Stages/banana/mountains', -420, 205);
	scaleObject('mountains', 1, 1);
	setScrollFactor('mountains', 0.8, 0.8);
	setProperty('mountains.antialiasing', true);
	setObjectOrder('mountains', 1);

	makeLuaSprite('bananaG', 'Stages/banana/bananaG', -535, 425);
	scaleObject('bananaG', 1, 1);
	setScrollFactor('bananaG', 1, 1);
	setProperty('bananaG.antialiasing', true);
	setObjectOrder('bananaG', 2);

	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 3);

	makeAnimatedLuaSprite('tomato', 'Stages/banana/tomato', 201, 481);
	scaleObject('tomato', 1, 1);
	addAnimationByPrefix('tomato', 'tom', 'tom', 24, false);
	setScrollFactor('tomato', 1, 1);
	setProperty('tomato.antialiasing', true);
	setObjectOrder('tomato', 4);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 6);

	makeAnimatedLuaSprite('tone', 'Stages/banana/tone', -137, 370);
	scaleObject('tone', 1, 1);
	addAnimationByPrefix('tone', '', '', 24, true);
	setScrollFactor('tone', 1, 1);
	setProperty('tone.antialiasing', true);
	setObjectOrder('tone', 5);

	makeAnimatedLuaSprite('bananabgboppers', 'Stages/banana/bananabgboppers', 1115, 250);
	scaleObject('bananabgboppers', 1, 1);
	addAnimationByPrefix('bananabgboppers', '', '', 24, true);
	setScrollFactor('bananabgboppers', 1, 1);
	setProperty('bananabgboppers.antialiasing', true);
	setObjectOrder('bananabgboppers', 7);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 8);

	makeLuaSprite('bananas', 'Stages/banana/bananas', 10, 780);
	scaleObject('bananas', 1.1, 1.1);
	setScrollFactor('bananas', 1.05, 1.05);
	setProperty('bananas.antialiasing', true);
	setObjectOrder('bananas', 9);

	makeLuaSprite('cockblockers', 'Stages/banana/cockblockers', 795, 810);
	scaleObject('cockblockers', 1, 1);
	setScrollFactor('cockblockers', 1.05, 1.05);
	setProperty('cockblockers.antialiasing', true);
	setObjectOrder('cockblockers', 10);

	makeLuaSprite('leaves', 'Stages/banana/leaves', -575, -530);
	scaleObject('leaves', 2, 2);
	setScrollFactor('leaves', 1.1, 1.1);
	setProperty('leaves.antialiasing', true);
	setObjectOrder('leaves', 11);

	makeLuaSprite('bananabunches', 'Stages/banana/bananabunches', -678, -360);
	scaleObject('bananabunches', 2, 2);
	setScrollFactor('bananabunches', 1.15, 1.15);
	setProperty('bananabunches.antialiasing', true);
	setObjectOrder('bananabunches', 13);

    makeLuaSprite('LIGHTSOURCE', 'Stages/banana/LIGHTSOURCE', -450, -304);
    setScrollFactor('LIGHTSOURCE', 1, 1);
    scaleLuaSprite('LIGHTSOURCE', 2, 2);
    addLuaSprite('LIGHTSOURCE', true);
setBlendMode('LIGHTSOURCE', 'add')
setProperty('LIGHTSOURCE.alpha', 0.5);
end

function onBeatHit()
if curBeat % 2 == 0 then
objectPlayAnimation('tomato', 'tom');
end
end 