
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 820;
local yy = 700;
local xx2 = 1000;
local yy2 = 720;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
makeLuaSprite('DAVE', 'stages/Polus/DAVE', -50, 0);
scaleObject('DAVE', 1, 1);
setScrollFactor('DAVE', 1, 1);
setProperty('DAVE.antialiasing', true);
setObjectOrder('DAVE', 0);

makeLuaSprite('DAVEdie', 'stages/Polus/DAVEdie', -50, 0);
scaleObject('DAVEdie', 1, 1);
setScrollFactor('DAVEdie', 1, 1);
setProperty('DAVEdie.antialiasing', true);
setObjectOrder('DAVEdie', 1);
setProperty('DAVEdie.visible', false);
end

function onEvent(name,value1,value2)
if name == 'Dave AUGH' then
setProperty('DAVEdie.visible', true);
setProperty('dad.visible', false);
playSound('davewindowsmash', 1);
cameraShake('camHUD', '0.025', '2') 
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
            setProperty('defaultCamZoom',0.8)
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

            setProperty('defaultCamZoom',0.8)
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

    if curBeat >= 516 then
        setProperty('defaultCamZoom',0.8)
    else 
        if curBeat >= 508 then
            xx = 780;
            setProperty('defaultCamZoom',0.9)
        end
    end

end