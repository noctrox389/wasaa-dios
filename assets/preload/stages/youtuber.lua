
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0
local xx = 640;
local yy = 360;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
makeLuaSprite('ui', 'Stages/ui', 0, 10);
setScrollFactor('ui', 1, 1);
scaleLuaSprite('ui', 1, 1);
addLuaSprite('ui', false);
setObjectCamera('ui', 'other');

makeLuaSprite('base', 'UI/TB/color', 20, 665)
addLuaSprite('base', false)
setObjectCamera('base', 'other')
scaleObject('base', 3.7, 0.0210)
setScrollFactor('base', 0, 0);
setProperty('base.alpha', 0.5) 

makeLuaSprite('color', 'UI/TB/color', 20, 665)
addLuaSprite('color', false)
setObjectCamera('color', 'other')
scaleObject('color', 1.165, 0.0011/25)
setScrollFactor('color', 0, 0);
setProperty('color.alpha', 0.0001) 
end

function onCreatePost()
setProperty('dad.scale.x', 2.2)
setProperty('dad.scale.y', 1.2) 
doTweenColor('color', 'color', 'FF0000', 0.01, 'linear')
end

function onUpdate()
scaleObject('color', 3.7 * getProperty("songPercent"), .022)
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        setProperty('defaultCamZoom',1.0)
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
        triggerEvent('Camera Follow Pos','','')
    end
    
end