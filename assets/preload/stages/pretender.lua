
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx =  500;
local yy =  200;
local xx2 = 880;
local yy2 = 200;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
    makeLuaSprite('skypretend', 'Stages/MiraGrn/Pink/Pretender/skypretend', -910, -995);
    scaleObject('skypretend', 2, 2);
    setScrollFactor('skypretend', 1, 1);
    setProperty('skypretend.antialiasing', true);
    setObjectOrder('skypretend', 0);

    makeLuaSprite('pretend front', 'Stages/MiraGrn/Pink/Pretender/pretend front', -820, 215);
    scaleObject('pretend front', 1, 1);
    setScrollFactor('pretend front', 1, 1);
    setProperty('pretend front.antialiasing', true);
    setObjectOrder('pretend front', 1);

    makeLuaSprite('ground', 'Stages/MiraGrn/Pink/Pretender/ground', -795, -642.5);
    scaleObject('ground', 2, 2);
    setScrollFactor('ground', 1, 1);
    setProperty('ground.antialiasing', true);
    setObjectOrder('ground', 2);

    makeLuaSprite('knocked over plant', 'Stages/MiraGrn/Pink/Pretender/knocked over plant', 1217, 400);
    scaleObject('knocked over plant', 0.8, 0.8);
    setScrollFactor('knocked over plant', 1, 1);
    setProperty('knocked over plant.antialiasing', true);
    setObjectOrder('knocked over plant', 3);

    makeLuaSprite('front plant', 'Stages/MiraGrn/Pink/Pretender/front plant', 325, -502);
    scaleObject('front plant', 1, 1);
    setScrollFactor('front plant', 1, 1);
    setProperty('front plant.antialiasing', true);
    setObjectOrder('front plant', 4);

    setScrollFactor('gfGroup', 0.95, 0.95);
    setProperty('gfGroup.antialiasing', true);
    setObjectOrder('gfGroup', 5);

    makeAnimatedLuaSprite('gf_dead_p', 'Stages/MiraGrn/Pink/Pretender/gf_dead_p', 385, 235);
    scaleObject('gf_dead_p', 1.1, 1.1);
    addAnimationByPrefix('gf_dead_p', 'idle', 'GF Dancing Beat', 24, false);
    setScrollFactor('gf_dead_p', 1, 1);
    setProperty('gf_dead_p.antialiasing', true);
    setObjectOrder('gf_dead_p', 6);

    makeLuaSprite('knocked over plant 2', 'Stages/MiraGrn/Pink/Pretender/knocked over plant 2', -274, 370);
    scaleObject('knocked over plant 2', 1, 1);
    setScrollFactor('knocked over plant 2', 1, 1);
    setProperty('knocked over plant 2.antialiasing', true);
    setObjectOrder('knocked over plant 2', 7);

    setScrollFactor('dadGroup', 1, 1);
    setProperty('dadGroup.antialiasing', true);
    setObjectOrder('dadGroup', 8);

    makeLuaSprite('ripbozo', 'Stages/MiraGrn/Pink/Pretender/ripbozo', 1373, 613);
    scaleObject('ripbozo', 1.25, 1.25);
    setScrollFactor('ripbozo', 1, 1);
    setProperty('ripbozo.antialiasing', true);
    setObjectOrder('ripbozo', 9);

    makeAnimatedLuaSprite('blued', 'Stages/MiraGrn/Pink/Pretender/blued', -477, 407);
    scaleObject('blued', 1, 1);
    addAnimationByPrefix('blued', 'idle', 'bob bop', 24, false);
    setScrollFactor('blued', 1.1, 1);
    setProperty('blued.antialiasing', true);
    setObjectOrder('blued', 10);

    setScrollFactor('boyfriendGroup', 1, 1);
    setProperty('boyfriendGroup.antialiasing', true);
    setObjectOrder('boyfriendGroup', 11);


    makeLuaSprite('rhm dead', 'Stages/MiraGrn/Pink/Pretender/rhm dead', 1723, 715);
    scaleObject('rhm dead', 1.25, 1.25);
    setScrollFactor('rhm dead', 1, 1);
    setProperty('rhm dead.antialiasing', true);
    setObjectOrder('rhm dead', 13);

    makeLuaSprite('pretend pot', 'Stages/MiraGrn/Pink/Pretender/pretend pot', -897, 630);
    scaleObject('pretend pot', 1, 1);
    setScrollFactor('pretend pot', 1, 1);
    setProperty('pretend pot.antialiasing', true);
    setObjectOrder('pretend pot', 14);

    makeLuaSprite('green', 'Stages/MiraGrn/Pink/Pretender/green', -720, -440);
    scaleObject('green', 2, 2);
    setScrollFactor('green', 1.25, 1.25);
    setProperty('green.antialiasing', true);
    setObjectOrder('green', 15);

    makeLuaSprite('lightingpretender', 'Stages/MiraGrn/Pink/Pretender/lightingpretender', -763, -560);
    scaleObject('lightingpretender', 3.3, 3.3);
    setScrollFactor('lightingpretender', 1, 1);
    setProperty('lightingpretender.antialiasing', true);
    setObjectOrder('lightingpretender', 16);

end

function onBeatHit()
if curBeat % 2 == 0 then
objectPlayAnimation('gf_dead_p', 'idle');
objectPlayAnimation('blued', 'idle');
end
end 


function onCreatePost()
setProperty('dad.scale.x',  0.9*1.5)
setProperty('dad.scale.y',  0.9*1.5) 
setProperty('boyfriend.scale.x', 0.9*1.1)
setProperty('boyfriend.scale.y', 0.9*1.3) 
setProperty('boyfriend.y', getProperty('boyfriend.y')+60)

setProperty('dad.y', getProperty('dad.y')+60)
setProperty('dad.x', getProperty('dad.x')-30)
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
            setProperty('defaultCamZoom',0.5)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            setProperty('defaultCamZoom',0.5)
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
    
end

function onEndSong()
    followchars = false;
    triggerEvent('Camera Follow Pos','400','150')
end
