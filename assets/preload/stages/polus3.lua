
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 1760;
local yy = 380;
local xx2 = 1900;
local yy2 = 435;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
makeLuaSprite('wallBP', 'Stages/Polus/NewUnTrans/wallBP', 580, -280);
setScrollFactor('wallBP', 1, 1);
scaleLuaSprite('wallBP', 1, 1.05);
addLuaSprite('wallBP', false);

makeLuaSprite('overlay', 'Stages/Polus/NewUnTrans/overlay', 600, -280);
setScrollFactor('overlay', 1, 1);
scaleLuaSprite('overlay', 1, 1);
addLuaSprite('overlay', false);
setGraphicSize('overlay', getProperty('wallBP.width'), getProperty('wallBP.height'))
setProperty('overlay.alpha',  0.4) 
setBlendMode('overlay', 'OVERLAY')

makeAnimatedLuaSprite('bubbles', 'Stages/Polus/NewUnTrans/bubbles', 800, 850);
addAnimationByPrefix('bubbles', 'bubbles', 'Lava Bubbles', 24, true);  
objectPlayAnimation('bubbles', 'bubbles', true)
scaleLuaSprite('bubbles', 1.1, 1.1);
addLuaSprite('bubbles', false);

makeLuaSprite('platform', 'Stages/Polus/NewUnTrans/platform', 800, 650);
setScrollFactor('platform', 1, 1);
scaleLuaSprite('platform', 1.25, 1.15);
addLuaSprite('platform', false);

makeLuaSprite('overlaythjing', 'Stages/Polus/NewUnTrans/overlaythjing', 600, -280);
setScrollFactor('overlaythjing', 1, 1);
addLuaSprite('overlaythjing', true);
setGraphicSize('overlaythjing', getProperty('wallBP.width'), getProperty('wallBP.height'))
setProperty('overlaythjing.alpha',  1) 
setBlendMode('overlaythjing', 'OVERLAY')
end


function onCreatePost()
setProperty('dad.scale.x',  2.5)
setProperty('dad.scale.y',  2.5) 
spawnParticles();
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

            setProperty('defaultCamZoom',0.7)
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