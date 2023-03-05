
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0
local xx = 650-375;
local yy = 500;
local xx2 = 1000;
local yy2 = 550-375;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

local BopPos = {676, 883, 1067}

function onCreate()
	makeAnimatedLuaSprite('victorytext', 'Stages/Airship/WJ/Victory/victorytext', 514, -309);
	scaleObject('victorytext', 1, 1);
	addAnimationByPrefix('victorytext', '', '', 24, true);
	setScrollFactor('victorytext', 1, 1);
	setProperty('victorytext.antialiasing', true);
	setObjectOrder('victorytext', 0);

	makeAnimatedLuaSprite('vic_bgchars', 'Stages/Airship/WJ/Victory/vic_bgchars', -53, -77);
	scaleObject('vic_bgchars', 1, 1);
	addAnimationByPrefix('vic_bgchars', 'idle', 'lol thing ', 24, false);
	setScrollFactor('vic_bgchars', 1, 1);
	setProperty('vic_bgchars.antialiasing', true);
	setObjectOrder('vic_bgchars', 1);

	makeLuaSprite('fog_back', 'Stages/Airship/WJ/Victory/fog_back', 523, 217);
	scaleObject('fog_back', 2, 2);
	setScrollFactor('fog_back', 1, 1);
	setProperty('fog_back.antialiasing', true);
	setObjectOrder('fog_back', 2);
	setProperty('fog_back.alpha', 0.25)

	makeAnimatedLuaSprite('vic_jor', 'Stages/Airship/WJ/Victory/vic_jor', 1087, 10);
	scaleObject('vic_jor', 1, 1);
	addAnimationByPrefix('vic_jor', 'idle', 'jorsawseebganim ', 24, false);
	setScrollFactor('vic_jor', 1, 1);
	setProperty('vic_jor.antialiasing', true);
	setObjectOrder('vic_jor', 3);

	makeAnimatedLuaSprite('vic_jelq', 'Stages/Airship/WJ/Victory/vic_jelq', 656, 50);
	scaleObject('vic_jelq', 1, 1);
	addAnimationByPrefix('vic_jelq', 'idle', 'jelqeranim ', 24, false);
	setScrollFactor('vic_jelq', 1, 1);
	setProperty('vic_jelq.antialiasing', true);
	setObjectOrder('vic_jelq', 4);

	makeAnimatedLuaSprite('vic_war', 'Stages/Airship/WJ/Victory/vic_war', 883, 19);
	scaleObject('vic_war', 1, 1);
	addAnimationByPrefix('vic_war', 'idle', 'warchiefbganim ', 24, false);
	setScrollFactor('vic_war', 1, 1);
	setProperty('vic_war.antialiasing', true);
	setObjectOrder('vic_war', 5);

	makeLuaSprite('fog_mid', 'Stages/Airship/WJ/Victory/fog_mid', -120, 266);
	scaleObject('fog_mid', 2, 2);
	setScrollFactor('fog_mid', 1, 1);
	setProperty('fog_mid.antialiasing', true);
	setObjectOrder('fog_mid', 6);
	setProperty('fog_mid.alpha', 0.5)

	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 7);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 8);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 9);

	makeAnimatedLuaSprite('victory_pulse', 'Stages/Airship/WJ/Victory/victory_pulse', -317, -293);
	scaleObject('victory_pulse', 2, 2);
	addAnimationByPrefix('victory_pulse', 'idle', 'animatedlight instance ', 24, false);
	setScrollFactor('victory_pulse', 1, 1);
	setBlendMode('victory_pulse', 'ADD')
	setProperty('victory_pulse.antialiasing', true);
	setObjectOrder('victory_pulse', 10);

	makeLuaSprite('victory_spotlights', 'Stages/Airship/WJ/Victory/victory_spotlights', 137, -380);
	scaleObject('victory_spotlights', 2, 2);
	setScrollFactor('victory_spotlights', 1, 1);
	setProperty('victory_spotlights.antialiasing', true);
	setBlendMode('victory_spotlights', 'ADD')
	setObjectOrder('victory_spotlights', 11);

	makeLuaSprite('fog_front', 'Stages/Airship/WJ/Victory/fog_front', -924, 331);
	scaleObject('fog_front', 2, 2);
	setScrollFactor('fog_front', 1, 1);
	setProperty('fog_front.antialiasing', true);
	setObjectOrder('fog_front', 12);
    setProperty('fog_front.alpha', 0.5)

setProperty('vic_war.visible', false) 
setProperty('vic_jelq.visible', true) 
setProperty('vic_jor.visible', false) 
setProperty('vic_jelq.x', BopPos[2])
end

function onCountdownStarted()
setProperty('healthBarBG.visible', false)
setProperty('healthBar.visible', false)
setProperty('scoreTxt.visible', false)
setProperty('iconP1.visible', false)
setProperty('iconP2.visible', false)
end

function onBeatHit()
if curBeat % 1 == 0 then
objectPlayAnimation('vic_bgchars', 'idle', true)
objectPlayAnimation('vic_jor', 'idle', true)
objectPlayAnimation('vic_jelq', 'idle', true)
objectPlayAnimation('vic_war', 'idle', true)
objectPlayAnimation('victory_pulse', 'idle', true)
end
end

XD = false

function onEvent(n,v1,v2)
if n == 'Change Character' then
if v2 == 'jelqer' and not XD then
setProperty('vic_war.visible', true) 
setProperty('vic_jelq.visible', false) 
setProperty('vic_jor.visible', false) 
setProperty('vic_war.x', BopPos[2])
end
if v2 == 'jelqer' and XD then
setProperty('vic_war.visible', true) 
setProperty('vic_jelq.visible', false) 
setProperty('vic_jor.visible', true) 

setProperty('vic_war.x', BopPos[1])
setProperty('vic_jor.x', BopPos[3])

elseif v2 == 'jorsawghost' then
setProperty('vic_war.visible', true) 
setProperty('vic_jelq.visible', true) 
setProperty('vic_jor.visible', false) 

setProperty('vic_war.x', BopPos[1])
setProperty('vic_jelq.x', BopPos[3])

XD = true
elseif v2 == 'warchief' then
setProperty('vic_war.visible', false) 
setProperty('vic_jelq.visible', true) 
setProperty('vic_jor.visible', true) 

setProperty('vic_jelq.x', BopPos[1])
setProperty('vic_jor.x', BopPos[3])
end
end
if n == 'Victory Darkness' then
if v1 == 'on' then
doTweenAlpha('camGame', 'camGame', 0, 0.01, 'linear')
elseif v1 == 'off' or '' then
doTweenAlpha('camGame', 'camGame', 1, 0.01, 'linear')
end
end
end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.7)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs-30,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs+30,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs-20)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs+30)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        else

            setProperty('defaultCamZoom',0.7)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs-30,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs+30,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs-20)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs+30)
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
    
end