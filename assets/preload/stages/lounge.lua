local xx = 700
local yy = 700
local xx2 = 1000

function onCreate()
makeLuaSprite('lounge', 'Stages/Airship/WJ/lounge', -250, -100);
scaleObject('lounge', 1, 1);
setScrollFactor('lounge', 1, 1);
setProperty('lounge.antialiasing', true);
addLuaSprite('lounge', false)

if songName == 'O2' then
makeLuaSprite('Efecto', '', 0, 0)
makeGraphic('Efecto', screenWidth, screenHeight,'000000')
setObjectCamera('Efecto', 'camHUD')
setProperty('Efecto.alpha', 0)
addLuaSprite('Efecto', false)

makeLuaSprite('O2lighting', 'Stages/Airship/WJ/O2lighting', 0, 0);
setObjectCamera('O2lighting', 'camHUD')
setProperty('O2lighting.alpha', 0)
addLuaSprite('O2lighting', false)

makeAnimatedLuaSprite('wtf', 'Stages/Airship/WJ/wtf', 0, 0);
addAnimationByPrefix('wtf', 'what', 'what', 24, false);  
addAnimationByPrefix('wtf', 'the', 'the', 24, false);  
addAnimationByPrefix('wtf', 'the', 'fuck', 24, false);  
setObjectCamera('wtf', 'camHUD')
addLuaSprite('wtf', false);
screenCenter('wtf', 'x')
screenCenter('wtf', 'y')
setProperty('wtf.alpha', 0)
end
end

function onUpdate()
	if mustHitSection == false then
		triggerEvent('Camera Follow Pos',xx,yy)
	else
		triggerEvent('Camera Follow Pos',xx2,yy)
	end
if songName == 'O2' then
	if curBeat == 120 then
		xx = 840
		xx2 = 1500
	end
	if curStep == 541 then

doTweenAlpha('scoreTxt', 'scoreTxt', 1, 1, 'linear')
noteTweenAlpha("A1", 0, 1, 1, "linear")
noteTweenAlpha("A2", 1, 1, 1, "linear")
noteTweenAlpha("A3", 2, 1, 1, "linear")
noteTweenAlpha("A4", 3, 1, 1, "linear")
noteTweenAlpha("A5", 4, 1, 1, "linear")
noteTweenAlpha("A6", 5, 1, 1, "linear")
noteTweenAlpha("A7", 6, 1, 1, "linear")
noteTweenAlpha("A8", 7, 1, 1, "linear")
	end
end
end

function onEvent(n,v1,v2)
if n == 'Lights Down O2' then
doTweenAlpha('Efecto', 'Efecto', 1, 1, 'linear')
end
if n == 'WTF O2' then
setProperty('wtf.alpha', 1)
objectPlayAnimation('wtf', v1, true)
setProperty('O2lighting.alpha', 1)
if v1 == 'die' then
setProperty('wtf.visible', false)
HudNo()
end
if v1 == 'appear' then
removeLuaSprite('Efecto')
end
if n == "Reactor Beep" then
cameraFlash('camOther', 'FF0000', 0.2)
end
end
end

function onCountdownStarted()
setProperty('dad.scale.y', 1.3) 
end

function HudNo()
doTweenAlpha('healthBarBG', 'healthBarBG', 0, 0.01, "linear")
doTweenAlpha('healthBar', 'healthBar', 0, 0.01, "linear")
doTweenAlpha('scoreTxt', 'scoreTxt', 0, 0.01, "linear")
doTweenAlpha('iconP1', 'iconP1', 0, 0.01, "linear")
doTweenAlpha('iconP2', 'iconP2', 0, 0.01, "linear")
noteTweenAlpha("A1", 0, 0, 0.01, "linear")
noteTweenAlpha("A2", 1, 0, 0.01, "linear")
noteTweenAlpha("A3", 2, 0, 0.01, "linear")
noteTweenAlpha("A4", 3, 0, 0.01, "linear")
noteTweenAlpha("A5", 4, 0, 0.01, "linear")
noteTweenAlpha("A6", 5, 0, 0.01, "linear")
noteTweenAlpha("A7", 6, 0, 0.01, "linear")
noteTweenAlpha("A8", 7, 0, 0.01, "linear")
end