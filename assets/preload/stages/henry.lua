
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 700;
local yy = 550;
local xx2 = 1000;
local yy2 = 550;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
local allowCountdown = true

function onCreate()

makeLuaSprite('stagehenry', 'Stages/Henry/stagehenry', -1000, -300);
scaleObject('stagehenry', 1, 1);
setScrollFactor('stagehenry', 1, 1);
setProperty('stagehenry.antialiasing', true);
setObjectOrder('stagehenry', 1);
setProperty('stagehenry.alpha', 1)

makeAnimatedLuaSprite('GF_assets', 'characters/GF_assets', 500, 200);
addAnimationByPrefix('GF_assets', 'idle', 'GF Dancing Beat', 24, true);  
objectPlayAnimation('GF_assets', 'GF_assets', true)
scaleLuaSprite('GF_assets', 1, 1);
addLuaSprite('GF_assets', false);
objectPlayAnimation('GF_assets', 'idle');

setObjectOrder('GF_assets', getObjectOrder('dadGroup')-1)
setObjectOrder('gfGroup', getObjectOrder('boyfriendGroup'))

if songName == 'Armed' then
allowCountdown = false
end
end

function onEndSong()
if isStoryMode then
if songName == 'Reinforcements' then
loadSong('Armed', 'Armed', true);
end
end
end

function onCreatePost()
setProperty('boyfriend.scale.x', 1)
setProperty('boyfriend.scale.y', 1)
if songName == 'Reinforcements' then
allowCountdown = true
setProperty('gf.scale.x', 1.3)
setProperty('gf.scale.y', 1.4)
setProperty('gf.visible', false)

makeAnimatedLuaSprite('i_schee_u_enry', 'Stages/Henry/i_schee_u_enry', -1000, -350);
addAnimationByPrefix('i_schee_u_enry', 'idle', 'rhm intro shadow', 1, false);  
addAnimationByPrefix('i_schee_u_enry', 'intro', 'rhm intro shadow', 24, false);  
objectPlayAnimation('i_schee_u_enry', 'i_schee_u_enry', true)
scaleLuaSprite('i_schee_u_enry', 1, 1);
addLuaSprite('i_schee_u_enry', false);
objectPlayAnimation('i_schee_u_enry', 'idle');
setProperty('i_schee_u_enry.visible', false);
end
if songName == 'Armed' then
setProperty('dad.scale.x', 1.4)
setProperty('dad.scale.y', 1.5) 
setProperty('dad.x', getProperty('dad.x')+100) 
setProperty('dad.y', getProperty('dad.y')+75) 
setProperty('gf.x', getProperty('gf.x')-600)
setProperty('gf.y', getProperty('gf.y')-75) 

if isStoryMode then
makeAnimatedLuaSprite('Dust_Cloud', 'Stages/Henry/Dust_Cloud', getProperty('dad.x'), getProperty('dad.y')-50);
addAnimationByPrefix('Dust_Cloud', 'idle', 'rhm intro shadow', 1, false);  
addAnimationByPrefix('Dust_Cloud', 'intro', 'dust clouds', 24, false);  
objectPlayAnimation('Dust_Cloud', 'Dust_Cloud', true)
scaleLuaSprite('Dust_Cloud', 2, 2);
addLuaSprite('Dust_Cloud', false);
objectPlayAnimation('Dust_Cloud', 'intro');

setProperty('boyfriend.alpha', 0);
setProperty('gf.alpha', 0);
setProperty('stagehenry.alpha', 0);
setProperty('GF_assets.alpha', 0);
setProperty('camHUD.alpha', 0);

triggerEvent('Play Animation', 'intro', 'dad')
end
end
end

function onStartCountdown() 
if not allowCountdown and isStoryMode then
 return Function_Stop
end 
if allowCountdown then
return Function_Continue
end 
end

local IGCut = false

function onUpdate()
if getProperty('dad.animation.curAnim.name') == 'intro' and (getProperty('dad.animation.curAnim.curFrame') == 87) then
doTweenAlpha('boyfriend', 'boyfriend', 1, 1, 'linear')
doTweenAlpha('gf', 'gf', 1, 1, 'linear')
doTweenAlpha('stagehenry', 'stagehenry', 1, 1, 'linear')
doTweenAlpha('GF_assets', 'GF_assets', 1, 1, 'linear')
doTweenAlpha('camHUD', 'camHUD', 1, 1, 'linear')
end
if getProperty('dad.animation.curAnim.name') == 'intro' and (getProperty('dad.animation.curAnim.curFrame') == 97) then
allowCountdown = true
removeLuaSprite('Dust_Cloud')
startCountdown()
end
if IGCut then
setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition')-15) 
setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
end
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.7)
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' or getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' or getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' or getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' or getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
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

singAnimations = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
function opponentNoteHit(id, noteData, noteType, isSustainNote)
if noteType == 'GF Sing' then
followchars = true
end
if noteType == 'No Animation' then
triggerEvent('Play Animation', singAnimations[noteData+1], 'gf')
triggerEvent('Play Animation', singAnimations[noteData+1], 'dad')
    end
end

function onEvent(name,value1,value2)
if name == 'Ellie Drop' then
setProperty('gf.visible', true);
triggerEvent('Play Animation', 'enter', 'gf')
followchars = false
setProperty('defaultCamZoom',0.75)
end 
if name == 'Asbel' then
if value1 == 'ic' and isStoryMode then
doTweenAlpha('camHUD', 'camHUD', 0, 1, 'linear')
IGCut = true
playSound('rhm_crash', 1);
triggerEvent('Play Animation', 'armed', 'dad')
triggerEvent('Play Animation', 'armed', 'gf')
runTimer('tem', 1.1)
runTimer('anim', 2.6)
runTimer('end', 2.8)
end
end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'tem' then
cameraShake('camGame', '0.004', '5')
end
if tag == 'anim' then
setProperty('i_schee_u_enry.visible', true);
objectPlayAnimation('i_schee_u_enry', 'intro');
end
if tag == 'end' then

doTweenAlpha('camGame', 'camGame', 0, 0.01, 'linear')
cameraFlash('camOther', 'FFFFFF', 80)
IGCut = false
end
end