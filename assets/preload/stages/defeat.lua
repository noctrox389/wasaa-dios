
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
local allowCountdown = false

function onStartCountdown() 
if not allowCountdown then
 return Function_Stop
end if allowCountdown then
 return Function_Continue
end 
end

function onCreate()
--
doTweenAlpha('camHUD', 'camHUD', 0, 0.002, 'linear')
doTweenAlpha('camGame', 'camGame', 0, 0.002, 'linear')

makeLuaText('CBreaks', 'COMBO BREAKS', 1000, 150, 87.5)
setTextSize("CBreaks", 100)
setTextAlignment("CBreaks", "center")
setObjectCamera("CBreaks", "camOther")
addLuaText("CBreaks")
setTextColor('CBreaks', 'FF0000')
screenCenter("CBreaks", "x")
setTextFont("CBreaks", "vceerre.ttf");

makeLuaSprite('missAmountArrow', 'UI/Defeat/missAmountArrow', 200, 400)
setObjectCamera("missAmountArrow", "camOther")
scaleObject('missAmountArrow', 1, 1)
addLuaSprite('missAmountArrow')

makeLuaSprite('dummy1', 'UI/Defeat/dummy1', 200, 440)
setObjectCamera("dummy1", "camOther")
scaleObject('dummy1', 1, 1)
addLuaSprite('dummy1')

makeLuaSprite('dummy2', 'UI/Defeat/dummy1', 200, 440)
setObjectCamera("dummy2", "camOther")
scaleObject('dummy2', 1, 1)
addLuaSprite('dummy2')
setProperty('dummy2.x', getProperty('dummy1.x') + 150)

makeLuaSprite('dummy3', 'UI/Defeat/dummy2', 200, 480)
setObjectCamera("dummy3", "camOther")
scaleObject('dummy3', 1, 1)
addLuaSprite('dummy3')
setProperty('dummy3.x', getProperty('dummy1.x') + 300)

makeLuaSprite('dummy4', 'UI/Defeat/dummy2', 200, 480)
setObjectCamera("dummy4", "camOther")
scaleObject('dummy4', 1, 1)
addLuaSprite('dummy4')
setProperty('dummy4.x', getProperty('dummy1.x') + 450)

makeLuaSprite('dummy5', 'UI/Defeat/dummy3', 200, 490)
setObjectCamera("dummy5", "camOther")
scaleObject('dummy5', 1, 1)
addLuaSprite('dummy5')
setProperty('dummy5.x', getProperty('dummy1.x') + 600)

makeLuaSprite('dummy6', 'UI/Defeat/dummy3', 200, 490)
setObjectCamera("dummy6", "camOther")
scaleObject('dummy6', 1, 1)
addLuaSprite('dummy6')
setProperty('dummy6.x', getProperty('dummy1.x') + 750)

--

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

setProperty('lolthing.alpha', 0);  
setProperty('deadBG.alpha', 0);  
setProperty('deadFG.alpha', 0);  

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
setProperty('healthBar.visible', false)
end

function onCreatePost()
setProperty('dad.scale.x', 1.8)
setProperty('dad.scale.y', 1.8) 

makeLuaText('Start', 'START', 300, 150, 600)
setTextSize("Start", 75)
setTextAlignment("Start", "center")
setObjectCamera("Start", "camOther")
addLuaText("Start")
setTextColor('Start', '00FFFF')
screenCenter("Start", "x")
setTextFont("Start", "vceerre.ttf");

makeLuaSprite('Flecha', 'UI/Defeat/Flecha', 220, 600)
setObjectCamera("Flecha", "camOther")
scaleObject('Flecha', 1, 1)
addLuaSprite('Flecha')

makeLuaSprite('FlechaD', 'UI/Defeat/Flecha', 1000, 600)
setObjectCamera("FlechaD", "camOther")
scaleObject('FlechaD', 1, 1)
addLuaSprite('FlechaD')
setProperty('FlechaD.flipX', true);
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

setProperty('ScoreAmogus.visible', false); 
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
setProperty('ScoreAmogus.visible', true); 
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
if misses > MaxMiss then
setProperty('health', 0)
end
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
    if curBeat == 16 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 32 then
        setProperty('defaultCamZoom',0.7)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 48 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 68 then
        setProperty('defaultCamZoom',0.5)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 100 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 500
        yy = 500
        xx2 = 900
        yy2 = 500
    end
    if curBeat == 164 then
        setProperty('defaultCamZoom',0.5)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 194 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 196 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 212 then
        setProperty('defaultCamZoom',0.7)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 228 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 244 then
        setProperty('defaultCamZoom',0.85)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 260 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 292 then
        setProperty('defaultCamZoom',0.75)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 360 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 500
        yy = 500
        xx2 = 900
        yy2 = 500
    end
    if curBeat == 424 then
        setProperty('defaultCamZoom',0.7)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 456 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 472 then
        setProperty('defaultCamZoom',0.9)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    if curBeat == 488 then
        setProperty('defaultCamZoom',50)
		followchars = true
        xx = 750
        yy = 500
        xx2 = 750
        yy2 = 500
    end
    
end

local Presionado = false
local SeleccionTer = false

function onUpdatePost(elasped)
setTextString('ScoreAmogus', 'Score: '.. score ..' | Misses: '.. misses ..' / '.. MaxMiss ..' | Accuracy:'..round(rating * 100, 2) .. '%')  
setTextString('CBreaks', MaxMiss..'/5 MISSES')
if not SeleccionTer then

if not Presionado then
if getProperty('missAmountArrow.x') <= 900 then
if keyPressed('right') or getMouseX('camOther') > getProperty('FlechaD.x') and getMouseY('camOther') > getProperty('FlechaD.y') and getMouseX('camOther') < getProperty('FlechaD.x') + getProperty('FlechaD.width') and getMouseY('camOther') < getProperty('FlechaD.y') + getProperty('FlechaD.height') and mouseReleased() then
MaxMiss = MaxMiss - 1
setProperty('missAmountArrow.x', getProperty('missAmountArrow.x') +150)
Presionado = true
runTimer('Prs', 0.2, 1)
end
end

if getProperty('missAmountArrow.x') >= 250 then
if keyPressed('left') or getMouseX('camOther') > getProperty('Flecha.x') and getMouseY('camOther') > getProperty('Flecha.y') and getMouseX('camOther') < getProperty('Flecha.x') + getProperty('Flecha.width') and getMouseY('camOther') < getProperty('Flecha.y') + getProperty('Flecha.height') and mouseReleased() then
MaxMiss = MaxMiss + 1
setProperty('missAmountArrow.x', getProperty('missAmountArrow.x') -150)
Presionado = true
runTimer('Prs', 0.2, 1)
end
end

if keyJustPressed('accept') or getMouseY('camOther') > getProperty('Start.y') and getMouseX('camOther') < getProperty('Start.x') + getProperty('Start.width') and getMouseY('camOther') < getProperty('Start.y') + getProperty('Start.height') and mouseReleased() then
runTimer('Chao', 1, 1)
end
end
end
end

function onTimerCompleted(tag)
if tag == 'Prs' then
Presionado = false
end
if tag == 'Chao' then
allowCountdown = true
SeleccionTer = true
removeLuaSprite('missAmountArrow')
removeLuaSprite('dummy1')
removeLuaSprite('dummy2')
removeLuaSprite('dummy3')
removeLuaSprite('dummy4')
removeLuaSprite('dummy5')
removeLuaSprite('dummy6')
removeLuaSprite('Flecha')
removeLuaSprite('FlechaD')
startCountdown()
doTweenAlpha('Start', 'Start', 0, 0.002, 'linear')
doTweenAlpha('CBreaks', 'CBreaks', 0, 0.002, 'linear')
doTweenAlpha('camHUD', 'camHUD', 1, 0.002, 'linear')
doTweenAlpha('camGame', 'camGame', 1, 0.002, 'linear')
end
end

function round(x, n)
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end