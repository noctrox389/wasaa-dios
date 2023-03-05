
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 700;
local yy = 500;
local xx2 = 700;
local yy2 = 500;
local ofs = 0;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
makeAnimatedLuaSprite('GF_assets', 'characters/GF_assets', 500, 200);
addAnimationByPrefix('GF_assets', 'idle', 'GF Dancing Beat', 24, true);  
objectPlayAnimation('GF_assets', 'GF_assets', true)
scaleLuaSprite('GF_assets', 1, 1);
addLuaSprite('GF_assets', false);
objectPlayAnimation('GF_assets', 'idle');

makeLuaSprite('stagehenry', 'Stages/Henry/stagehenry', -450, -300);
scaleObject('stagehenry', 1, 1);
setScrollFactor('stagehenry', 1, 1);
setProperty('stagehenry.antialiasing', true);
setObjectOrder('stagehenry', 1);
setProperty('stagehenry.alpha', 1)

end

function onCountdownStarted()
setProperty('gf.flipX', false)

setProperty('dad.scale.x',  0.8*1.6)
setProperty('dad.scale.y',  0.8*1.5) 

setProperty('boyfriend.scale.x',  1.2)
setProperty('boyfriend.scale.y',  1.5) 

triggerEvent('Play Animation', 'intro', 'boyfriend')
end

function onEndSong()
if isStoryMode then
loadSong('Reinforcements', 'Reinforcements', true);
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
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('mom.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('mom.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('mom.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('mom.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' or getProperty('mom.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' or getProperty('mom.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' or getProperty('mom.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' or getProperty('mom.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
        else
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

    if curStep >= 32 then

        setProperty('defaultCamZoom',1.3)
        xx = 130
        xx2 = 130
        yy = 450;
        yy2 = 450;
    end
    if curStep == 40 then
        triggerEvent('Greatest Plan Icons', 'bf')
        doTweenX("dad", "dad", -400, 1, "linear")
    end
    if curStep == 41 then
        triggerEvent('Greatest Plan Icons', 'charles')
    end
    if curStep == 45 then
        CharlesEnter()
    end
end

function CharlesEnter()

end