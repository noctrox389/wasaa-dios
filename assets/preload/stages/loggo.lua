
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 420.95;
local yy = 1700;
local xx2 = 652.9;
local yy2 = 1700;
local ofs = 50;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
makeLuaSprite('normalOne', 'Stages/Loggo/normalOne', -700, 750);
scaleObject('normalOne', 3, 3);
setScrollFactor('normalOne', 1, 1);
setProperty('normalOne.antialiasing', false);
setObjectOrder('normalOne', 0);

makeAnimatedLuaSprite('stockingFire', 'Stages/Loggo/stockingFire', -700, 750);
scaleObject('stockingFire', 3, 3);
addAnimationByPrefix('stockingFire', 'stockingFire', 'stocking fire', 24, true);  
objectPlayAnimation('stockingFire', 'stockingFire', true)
setProperty('stockingFire.antialiasing', false);
addLuaSprite('stockingFire', false);

makeAnimatedLuaSprite('people', 'Stages/Loggo/people', -700, 750);
scaleObject('people', 3, 3);
addAnimationByPrefix('people', 'people', 'the guys', 24, true);  
objectPlayAnimation('people', 'people', true)
setProperty('people.antialiasing', false);
addLuaSprite('people', false);
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
            setProperty('defaultCamZoom',0.9)
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

            setProperty('defaultCamZoom',0.9)
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
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end

