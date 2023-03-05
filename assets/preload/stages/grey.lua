
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0
local xx = 1300;
local yy = 700;
local xx2 = 1800;
local yy2 = 700;
local ofs = 10;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
makeLuaSprite('graybg', 'Stages/Airship/Gray/graybg', 0, 150);
setScrollFactor('graybg', 1, 1);
setGraphicSize('graybg', 3180, 1020)
addLuaSprite('graybg', false);

makeLuaSprite('grayfg', 'Stages/Airship/Gray/grayfg', 1000, 950);
setScrollFactor('grayfg', 1, 1);
scaleLuaSprite('grayfg', 1, 1);
addLuaSprite('grayfg', true);

makeLuaSprite('grayoverlay', 'Stages/Airship/Gray/grayoverlay', 0, 150);
setScrollFactor('grayoverlay', 1, 1);
setGraphicSize('grayoverlay', 3180, 1020)
addLuaSprite('grayoverlay', true);
setBlendMode('grayoverlay', 'OVERLAY')
setProperty('grayoverlay.alpha',  0.15) 

makeLuaSprite('graymultiply', 'Stages/Airship/Gray/graymultiply', 0, 150);
setScrollFactor('graymultiply', 1, 1);
setGraphicSize('graymultiply', 3180, 1020)
addLuaSprite('graymultiply', true);
setBlendMode('graymultiply', 'MULTIPLY')
setProperty('graymultiply.alpha',  1) 

makeAnimatedLuaSprite('grayblack', 'Stages/Airship/Gray/grayblack', 200, 350);
addAnimationByPrefix('grayblack', 'grayblack', 'whoisthismf', 24, false);  
objectPlayAnimation('grayblack', 'grayblack', true)
scaleLuaSprite('grayblack', 1, 1.5);
addLuaSprite('grayblack', false);

makeAnimatedLuaSprite('grayglowy', 'Stages/Airship/Gray/grayglowy', 1950, 400);
addAnimationByPrefix('grayglowy', 'grayglowy', 'jar??', 24, true);  
objectPlayAnimation('grayglowy', 'grayglowy', true)
scaleLuaSprite('grayglowy', 1, 1);
addLuaSprite('grayglowy', false);

 setProperty('defaultCamZoom', 1)
end

function onBeatHit()
if curBeat % 2 == 0 then
objectPlayAnimation('grayblack', 'grayblack');
end
end 

function onCreatePost()
setProperty('dad.scale.x',  0.9*1.5)
setProperty('dad.scale.y',  0.9*1.5) 
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
    
end

