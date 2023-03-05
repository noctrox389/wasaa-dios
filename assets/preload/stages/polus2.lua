
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx =  1600;
local yy =  1300;
local xx2 = 1800;
local yy2 = 1300;
local ofs = 10;
local followchars = true;
local del = 0;
local del2 = 0;


function onCreate()
makeLuaSprite('bg', 'Stages/Polus/NewUnTrans/bg', 150, 150);
setScrollFactor('bg', 1, 1);
scaleLuaSprite('bg', 0.9, 0.9);
addLuaSprite('bg', false);


makeAnimatedLuaSprite('snowback', 'Stages/Polus/NewUnTrans/snowback', 250, 300);
addAnimationByPrefix('snowback', 'snowback', 'Snow group instance ', 24, true);  
objectPlayAnimation('snowback', 'snowback', true)
scaleLuaSprite('snowback', 1.3*2.5, 1.2*2.5);
setProperty('snowback.alpha', 0.4) 
addLuaSprite('snowback', true);
setBlendMode('snowback', 'OVERLAY')

makeAnimatedLuaSprite('snowfront', 'Stages/Polus/NewUnTrans/snowfront', 450, 300);
addAnimationByPrefix('snowfront', 'snowfront', 'snow fall front instance ', 24, true);  
objectPlayAnimation('snowfront', 'snowfront', true)
scaleLuaSprite('snowfront', 1.2*2.5, 1.2*2.5);
setProperty('snowfront.alpha', 0.4) 
addLuaSprite('snowfront', true);
setBlendMode('snowfront', 'OVERLAY')

makeLuaSprite('newoverlay', 'Stages/Polus/NewUnTrans/newoverlay', 400, 500);
setScrollFactor('newoverlay', 1, 1);
scaleLuaSprite('newoverlay', 1.5, 1.5);
addLuaSprite('newoverlay', true);
setProperty('newoverlay.alpha',  0.4) 
setBlendMode('snowfront', 'OVERLAY')

makeLuaSprite('newlava', 'Stages/Polus/NewUnTrans/newlava', 750, 1000);
setScrollFactor('newlava', 1, 1);
scaleLuaSprite('newlava', 1, 1);
addLuaSprite('newlava', true);
setProperty('newlava.alpha',  0.4) 
setBlendMode('snowfront', 'OVERLAY')
end

function onCreatePost()
setProperty('dad.scale.x',  1.5)
setProperty('dad.scale.y',  1.5) 

if getDataFromSave('Skins', 'Sobrescribir') == false or isStoryMode then
setProperty('gf.scale.x', 1.5)
setProperty('gf.scale.y', 1.5) 
end

setProperty('dad.y', getProperty('dad.y')+25) 
setProperty('boyfriend.y', getProperty('boyfriend.y')+25) 
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
            setProperty('defaultCamZoom',0.55)
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

            setProperty('defaultCamZoom',0.55)
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

