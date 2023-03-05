
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 300;
local yy = 500;
local xx2 = 700;
local yy2 = 500;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
makeLuaSprite('fartingSky', 'Stages/Airship/Yellow/Sky', -1100, -800);
setScrollFactor('fartingSky', 0.6, 0.6);
scaleLuaSprite('fartingSky', 1.5, 1.5);
addLuaSprite('fartingSky', false);

makeLuaSprite('cloudYellow', 'Stages/Airship/Yellow/cloudYellow', -1600, 250);
setScrollFactor('cloudYellow', 0.7, 0.7);
scaleLuaSprite('cloudYellow', 2, 2);
addLuaSprite('cloudYellow', false);

makeLuaSprite('window', 'Stages/Airship/Yellow/window', -1200, -700);
setScrollFactor('window', 1, 1);
scaleLuaSprite('window', 2, 2);
addLuaSprite('window', false);

makeLuaSprite('backDlowFloor', 'Stages/Airship/Yellow/BDlowFloor', -380, 400);
setScrollFactor('backDlowFloor', 1, 1);
scaleLuaSprite('backDlowFloor', 1, 1.1);
addLuaSprite('backDlowFloor', false);

makeLuaSprite('DlowFloor', 'Stages/Airship/Yellow/DlowFloor', -1100, 320);
setScrollFactor('DlowFloor', 1, 1);
scaleLuaSprite('DlowFloor', 1, 1.1);
addLuaSprite('DlowFloor', false);

if songName == 'Mando' then
makeLuaSprite('Teleporter', 'Stages/Airship/Yellow/Teleporter', 975, 650);
setScrollFactor('Teleporter', 1, 1);
scaleLuaSprite('Teleporter', 1, 1);
addLuaSprite('Teleporter', false);
setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
end
end

function onCreatePost()
setProperty('dad.scale.x', 1.3)
setProperty('dad.scale.y', 1.3) 
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
            setProperty('defaultCamZoom',0.6)
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

            setProperty('defaultCamZoom',0.6)
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

local Twist = false

function onEvent(name)
if name == 'Camera Twist' then
twist = true
end
end


local angleshit = 0.2;
local anglevar = 0.1;

function onBeatHit()
if twist then
    if curBeat < 388 then

        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
    else
    end  
end
end

function onStepHit()
if twist then
    if curBeat < 388 then
        if curStep % 4 == 0 then
            doTweenY('rrr', 'camHUD', -10, stepCrochet*0.002, 'circOut')
            doTweenY('rtr', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
        end
        if curStep % 4 == 2 then
            doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
            doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
        end
    end
end
end