
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0
local xx = 750;
local yy = 500;
local xx2 = 750;
local yy2 = 500;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
local MaxMiss = 5

function onCreate()
makeLuaSprite('defeatfnf', 'Stages/Black/Defeat/defeatfnf', -300, -300);
setScrollFactor('defeatfnf', 1, 1);
scaleLuaSprite('defeatfnf', 3, 3);
addLuaSprite('defeatfnf', false);

makeAnimatedLuaSprite('defeat', 'Stages/Black/Defeat/defeat', -500, -400);
addAnimationByPrefix('defeat', 'defeat', 'defeat', 24, false);  
objectPlayAnimation('defeat', 'defeat', true)
addLuaSprite('defeat', false);
scaleLuaSprite('defeat', 4, 4);

makeLuaSprite('lolthing', 'Stages/Black/Defeat/lol thing', -600, 150);
setScrollFactor('lolthing', 1, 1);
scaleLuaSprite('lolthing', 2.5, 2);
addLuaSprite('lolthing', false);

makeLuaSprite('deadBG', 'Stages/Black/Defeat/deadBG', -600, 400);
setScrollFactor('deadBG', 1, 1);
setGraphicSize('deadBG', 7119/2.65, 1307/3)
addLuaSprite('deadBG', false);

makeLuaSprite('deadFG', 'Stages/Black/Defeat/deadFG', -650, 700);
setScrollFactor('deadFG', 1.25, 1.25);
setGraphicSize('deadFG', 7161/2.5, 2282/2.5)
addLuaSprite('deadFG', true);

makeLuaSprite('iluminaoomaga', 'Stages/Black/Defeat/iluminaoomaga', -300, -200);
setScrollFactor('iluminaoomaga', 1, 1);
scaleLuaSprite('iluminaoomaga', 2, 2);
addLuaSprite('iluminaoomaga', true);
setBlendMode('iluminaoomaga', 'add')

setObjectOrder('boyfriendGroup', getObjectOrder('gfGroup'))
end

function onCountdownStarted()
noteTweenX('oppo0', 0, -1000, 0.01, 'quartInOut')
noteTweenX('oppo1', 1, -1000, 0.01, 'quartInOut')
noteTweenX('oppo2', 2, -1000, 0.01, 'quartInOut')
noteTweenX('oppo3', 3, -1000, 0.01, 'quartInOut')
noteTweenX('play0', 4, 415, 0.01, 'quartInOut')
noteTweenX('play1', 5, 525, 0.01, 'quartInOut')
noteTweenX('play2', 6, 635, 0.01, 'quartInOut')
noteTweenX('play3', 7, 745, 0.01, 'quartInOut')
setProperty('healthBarBG.visible', false)
setProperty('iconP2.visible', false)
setProperty('iconP1.visible', false)
setProperty('healthBar.visible', false)
end

function onCreatePost()

setProperty('dad.scale.x', 1.8)
setProperty('dad.scale.y', 1.8) 
end

function onBeatHit()
if curBeat % 2 == 0 then
objectPlayAnimation('defeat', 'defeat');
end
end 

function onEvent(name,value1,value2)
if name == 'Change Character' then
if value2 == 'blackold' then
cameraFlash('camGame', 'FFFFFF', 0.2)

setProperty('scoreTxt.visible', false); 
setProperty('iconP1.visible', false); 
setProperty('iconP2.visible', false); 
setProperty('lolthing.alpha', 0);  
setProperty('deadBG.alpha', 0);  
setProperty('deadFG.alpha', 0);  
setProperty('iluminaoomaga.alpha', 0); 
setProperty('defeat.alpha', 0); 

setProperty('dad.scale.x', 1.4)
setProperty('dad.scale.y', 1.2) 
end
if value2 == 'bf-defeat-scared' then
cameraFlash('camGame', 'FFFFFF', 0.2)
doTweenAlpha('lolthing', 'lolthing', 1, 1, 'linear')
doTweenAlpha('deadBG', 'deadBG', 1, 1, 'linear')
doTweenAlpha('deadFG', 'deadFG', 1, 1, 'linear') 
doTweenAlpha('iluminaoomaga', 'iluminaoomaga', 1, 1, 'linear') 
end 
end
if name == 'Asbel' then
if value1 == 'def' then
setProperty('scoreTxt.visible', true); 
setProperty('iconP1.visible', true); 
setProperty('iconP2.visible', true);  

setProperty('lolthing.alpha', 1);  
setProperty('deadBG.alpha', 1);  
setProperty('deadFG.alpha', 1);  
setProperty('iluminaoomaga.alpha', 1); 
setProperty('defeat.alpha', 1); 

triggerEvent('Change Character', 'bf', 'bf-defeat-scared');
triggerEvent('Change Character', 'dad', 'black');

setProperty('dad.scale.x', 1.8)
setProperty('dad.scale.y', 1.8) 
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