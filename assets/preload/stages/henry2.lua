
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
local allowCountdown = false
local seenCutscene = false

function onStartCountdown() 
if not allowCountdown and not seenCutscene and isStoryMode then
 return Function_Stop
end 
if allowCountdown then
return Function_Continue
end 
end

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
end


function onCreatePost()
setProperty('boyfriend.scale.x', 1)
setProperty('boyfriend.scale.y', 1)
if songName == 'Reinforcements' then
Eleccion = false
allowCountdown = true
setProperty('gf.scale.x', 1.3)
setProperty('gf.scale.y', 1.4)
setProperty('gf.visible', false)
end
if songName == 'Armed' then
Eleccion = false
allowCountdown = true
setProperty('dad.scale.x', 1.4)
setProperty('dad.scale.y', 1.5) 
setProperty('dad.x', getProperty('dad.x')+100) 
setProperty('dad.y', getProperty('dad.y')+75) 
setProperty('gf.x', getProperty('gf.x')-600)
end
if isStoryMode then
setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
makeLuaSprite('finalframe', 'Stages/Henry/finalframe', 0, 0)
setObjectCamera("finalframe", "camOther")
scaleObject('finalframe', 1, 1)
addLuaSprite('finalframe')

makeAnimatedLuaSprite('Microphone_Option', 'Stages/Henry/Microphone_Option', 350, 175);
addAnimationByPrefix('Microphone_Option', 'idle', 'Microphone', 24, false);  
addAnimationByPrefix('Microphone_Option', 'sel', 'Select Microphone', 24, false);  
objectPlayAnimation('Microphone_Option', 'Microphone_Option', true)
setObjectCamera("Microphone_Option", "camOther")
scaleLuaSprite('Microphone_Option', 0.5, 0.5);
addLuaSprite('Microphone_Option', false);
objectPlayAnimation('Microphone_Option', 'idle');

makeAnimatedLuaSprite('Sock_Puppet_Option', 'Stages/Henry/Sock_Puppet_Option', 700, 125);
addAnimationByPrefix('Sock_Puppet_Option', 'idle', 'Sock Puppet', 24, false);  
addAnimationByPrefix('Sock_Puppet_Option', 'sel', 'Select Sock Puppet', 24, false);  
objectPlayAnimation('Sock_Puppet_Option', 'Sock_Puppet_Option', true)
setObjectCamera("Sock_Puppet_Option", "camOther")
scaleLuaSprite('Sock_Puppet_Option', 0.5, 0.5);
addLuaSprite('Sock_Puppet_Option', false);
objectPlayAnimation('Sock_Puppet_Option', 'idle');

makeAnimatedLuaSprite('Stare_Down_Option', 'Stages/Henry/Stare_Down_Option', 550, 400);
addAnimationByPrefix('Stare_Down_Option', 'idle', 'Stare Down', 24, false);  
addAnimationByPrefix('Stare_Down_Option', 'sel', 'Select Stare Down', 24, false);  
objectPlayAnimation('Stare_Down_Option', 'Stare_Down_Option', true)
setObjectCamera("Stare_Down_Option", "camOther")
scaleLuaSprite('Stare_Down_Option', 0.5, 0.5);
addLuaSprite('Stare_Down_Option', false);
objectPlayAnimation('Stare_Down_Option', 'idle');


makeLuaSprite('hguiofuhjpsod', 'Stages/Henry/hguiofuhjpsod', 0, 0)
setObjectCamera("hguiofuhjpsod", "camOther")
scaleObject('hguiofuhjpsod', 1, 1)
addLuaSprite('hguiofuhjpsod', true)
end
end

function onUpdatePost(elasped)
if getMouseX('camOther') > getProperty('Microphone_Option.x') and getMouseY('camOther') > getProperty('Microphone_Option.y') and getMouseX('camOther') < getProperty('Microphone_Option.x') + getProperty('Microphone_Option.width') and getMouseY('camOther') < getProperty('Microphone_Option.y') + getProperty('Microphone_Option.height') and mouseReleased() then
startVideo('henrymic');
allowCountdown = true;
Remove()
end
if getMouseX('camOther') > getProperty('Sock_Puppet_Option.x') and getMouseY('camOther') > getProperty('Sock_Puppet_Option.y') and getMouseX('camOther') < getProperty('Sock_Puppet_Option.x') + getProperty('Sock_Puppet_Option.width') and getMouseY('camOther') < getProperty('Sock_Puppet_Option.y') + getProperty('Sock_Puppet_Option.height') and mouseReleased() then
startVideo('henrysock');
end
if getMouseX('camOther') > getProperty('Stare_Down_Option.x') and getMouseY('camOther') > getProperty('Stare_Down_Option.y') and getMouseX('camOther') < getProperty('Stare_Down_Option.x') + getProperty('Stare_Down_Option.width') and getMouseY('camOther') < getProperty('Stare_Down_Option.y') + getProperty('Stare_Down_Option.height') and mouseReleased() then
startVideo('henrystare');
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
end

function Remove()
setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
removeLuaSprite('finalframe')
removeLuaSprite('Microphone_Option')
removeLuaSprite('Sock_Puppet_Option')
removeLuaSprite('Stare_Down_Option')
removeLuaSprite('hguiofuhjpsod')
end

function onEndSong()
if isStoryMode then
loadSong('Greatest Plan', 'Greatest Plan', true);
end
end