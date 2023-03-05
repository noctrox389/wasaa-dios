function onCreate()
makeLuaSprite('Jump', 'Stages/deadpostorjumpscare', 0, 0);
setObjectCamera('Jump', 'camOther')
addLuaSprite('Jump', false);
setProperty('Jump.alpha', 0)
setProperty('introSoundsSuffix', 'muted')
end

function onCountdownTick(swagCounter)
if swagCounter == 1 then
setProperty('countdownReady.visible', false)
end
if swagCounter == 2 then
setProperty('countdownSet.visible', false)
end
if swagCounter == 3 then
setProperty('countdownGo.visible', false)
end
end

function onCountdownStarted()
setProperty('camHUD.alpha', 0)

setProperty('dad.scale.x', 2)
setProperty('dad.scale.y', 1.3)

setProperty('dad.visible', false)
noteTweenX('dad1', 0, 2000, 0.01, 'linear');
noteTweenX('dad2', 1, 2000, 0.01, 'linear');
noteTweenX('dad3', 2, 2000, 0.01, 'linear');
noteTweenX('dad4', 3, 2000, 0.01, 'linear');

setProperty('healthBarBG.visible', false)
setProperty('healthBar.visible', false)
setProperty('scoreTxt.visible', false)
setProperty('iconP1.visible', false)
setProperty('iconP2.visible', false)
end

function onStepHit()
if curStep == 1 then
setProperty('dad.visible', true)
triggerEvent('Play Animation', 'fi', 'dad')
elseif curStep == 128 then
setProperty('camHUD.alpha', 1)
elseif curStep == 1568 then
triggerEvent('Play Animation', 'fo', 'dad')
end
end

function onEvent(n, v1, v2)
if n == "Reactor Beep" then
setProperty('Jump.alpha', 1)
doTweenAlpha('Jump', 'Jump', 0, stepCrochet / 1000 * 16, 'linear')
cameraShake('camOther', '0.010', stepCrochet / 1000 * 16)
end
end

function onUpdate()
if getProperty('dad.animation.curAnim.name') == 'fo' and (getProperty('dad.animation.curAnim.curFrame') == 18) then
setProperty('dad.visible', false)
end
end