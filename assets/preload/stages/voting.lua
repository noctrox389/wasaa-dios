local Def = {1350, 550}
local I = {-21, 57}
local L = {-140, 55}
local D = {-75, 80}
local U = {-115, 40}
local R = {-70, 50}
local F = {50, 16}

function onCreate()
makeLuaSprite('bartop', '' ,0, 650)
makeGraphic('bartop', 1280, 200,'000000')
addLuaSprite('bartop',false)
setObjectCamera('bartop','hud')
setScrollFactor('bartop',0,0)

makeLuaSprite('barbot', '', 0, -100)
makeGraphic('barbot', 1280, 200,'000000')
addLuaSprite('barbot',false)
setScrollFactor('barbot',0,0)
setObjectCamera('barbot','hud')

makeLuaSprite('main_bg_meeting', 'Stages/Airship/WJ/main_bg_meeting', -375, 50);
setScrollFactor('main_bg_meeting', 1, 1);
scaleLuaSprite('main_bg_meeting', 1, 1);
addLuaSprite('main_bg_meeting', false);

makeLuaSprite('CHAIRS!!!!!!!!!!!!!!!', 'Stages/Airship/WJ/CHAIRS!!!!!!!!!!!!!!!', 0, 700);
setScrollFactor('CHAIRS!!!!!!!!!!!!!!!', 1, 1);
scaleLuaSprite('CHAIRS!!!!!!!!!!!!!!!', 1, 1);
addLuaSprite('CHAIRS!!!!!!!!!!!!!!!', false);

makeLuaSprite('table_voting', 'Stages/Airship/WJ/table_voting', 175, 700);
setScrollFactor('table_voting', 1, 1);
scaleLuaSprite('table_voting', 1, 1);
addLuaSprite('table_voting', true);

makeAnimatedLuaSprite('REAL_FUCKMUNGUS', 'Stages/Airship/WJ/REAL_FUCKMUNGUS', 0, 0);
addAnimationByPrefix('REAL_FUCKMUNGUS', 'idle', 'idle', 24, false); 
addAnimationByPrefix('REAL_FUCKMUNGUS', 'idle2', 'DANCERIGHT', 24, false);  
addAnimationByPrefix('REAL_FUCKMUNGUS', 'Fuck', 'FUUUUCK', 24, false);  
addAnimationByPrefix('REAL_FUCKMUNGUS', 'singLEFT', 'left', 24, false);  
addAnimationByPrefix('REAL_FUCKMUNGUS', 'singDOWN', 'down', 24, false);  
addAnimationByPrefix('REAL_FUCKMUNGUS', 'singUP', 'up', 24, false);  
addAnimationByPrefix('REAL_FUCKMUNGUS', 'singRIGHT', 'right', 24, false);  
setProperty('REAL_FUCKMUNGUS.x', Def[1]+I[1]) 
setProperty('REAL_FUCKMUNGUS.y', Def[2]+I[2])
scaleLuaSprite('REAL_FUCKMUNGUS', 1.3, 1);
addLuaSprite('REAL_FUCKMUNGUS', false);

setProperty('cameraSpeed', 30)

end

function onCountdownStarted()    
for i = 0, getProperty('unspawnNotes.length')-1 do
if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'No Animation' then
setPropertyFromGroup('unspawnNotes', i, 'texture', 'Stages/Airship/WJ/Papus');
setPropertyFromGroup('unspawnNotes', i, 'mustPress', false)
setPropertyFromGroup("unspawnNotes", i, "offsetX", getPropertyFromGroup('unspawnNotes', i, 'offsetX') +650)
end
end
for i = 0, getProperty('unspawnNotes.length')-1 do
if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Gf Sing' then
setPropertyFromGroup('unspawnNotes', i, 'texture', 'Stages/Airship/WJ/Papus');
setPropertyFromGroup('unspawnNotes', i, 'mustPress', false)
end
end
end

function onUpdatePost(elapsed)
elapsedd = 0.016/elapsed
for i=0, getProperty('notes.length') do
if getSongPosition() > getPropertyFromGroup('notes',i,'strumTime') and getPropertyFromGroup('notes',i,'noteType') == 'No Animation' then 
noteData = getPropertyFromGroup('notes',i,'noteData')
anim = ''
if noteData == 0 then
anim = 'singLEFT'
setProperty('REAL_FUCKMUNGUS.x', Def[1]+L[1]) 
setProperty('REAL_FUCKMUNGUS.y', Def[2]+L[2]) 
elseif noteData == 1 then
anim = 'singDOWN'
setProperty('REAL_FUCKMUNGUS.x', Def[1]+D[1]) 
setProperty('REAL_FUCKMUNGUS.y', Def[2]+D[2]) 
elseif noteData == 2 then
anim = 'singUP'
setProperty('REAL_FUCKMUNGUS.x', Def[1]+U[1]) 
setProperty('REAL_FUCKMUNGUS.y', Def[2]+U[2]) 
elseif noteData == 3 then
anim = 'singRIGHT'
setProperty('REAL_FUCKMUNGUS.x', Def[1]+R[1]) 
setProperty('REAL_FUCKMUNGUS.y', Def[2]+R[2]) 
end
objectPlayAnimation('REAL_FUCKMUNGUS', anim, true)
runTimer('gotoidle', 1)
removeFromGroup('notes', i);
end
end
end
 sex = true

function onBeatHit()
if sex then
if curBeat % 1 == 0 then
setProperty('REAL_FUCKMUNGUS.x', Def[1]+I[1]) 
setProperty('REAL_FUCKMUNGUS.y', Def[2]+I[2])
objectPlayAnimation('REAL_FUCKMUNGUS', 'idle');
end
if curBeat % 2 == 0 then
objectPlayAnimation('REAL_FUCKMUNGUS', 'idle2');
setProperty('REAL_FUCKMUNGUS.x', Def[1]+I[1]) 
setProperty('REAL_FUCKMUNGUS.y', Def[2]+I[2])
end
end
end 


function onEvent(name,value1,value2)
if name == 'Asbel' then
if value1 == '1' then
triggerEvent('Camera Follow Pos', getProperty('dad.x')+500, getProperty('dad.y')+200)
setProperty('defaultCamZoom', 1.3) 
elseif value1 == '2' then
triggerEvent('Camera Follow Pos', getProperty('boyfriend.x')-150, getProperty('boyfriend.y')+100)
setProperty('defaultCamZoom', 1.3) 
elseif value1 == '3' then
triggerEvent('Camera Follow Pos', getProperty('boyfriend.x')-175, getProperty('boyfriend.y')+75)
setProperty('defaultCamZoom', 1.3) 
elseif value1 == '4' then
triggerEvent('Camera Follow Pos', getProperty('dad.x')+525, getProperty('dad.y')+175)
setProperty('defaultCamZoom', 1.3) 
elseif value1 == '5' then
triggerEvent('Camera Follow Pos', getProperty('dad.x')+1100, getProperty('dad.y')+100)
setProperty('defaultCamZoom', 0.7) 

elseif value1 == 'a' then
sex = false
objectPlayAnimation('REAL_FUCKMUNGUS', 'Fuck', true)
end 
end 
end

function onUpdate(elapsed)
setProperty('gf.specialAnim',true)
for i=0, getProperty('notes.length') do
if getSongPosition() > getPropertyFromGroup('notes',i,'strumTime') and getPropertyFromGroup('notes',i,'noteType') == 'GF Sing' then
noteData = getPropertyFromGroup('notes',i,'noteData')
if noteData == 0 then
Papu = 'singLEFT'
elseif noteData == 1 then
Papu = 'singDOWN'
elseif noteData == 2 then
Papu = 'singUP'
elseif noteData == 3 then
Papu = 'singRIGHT'
end
characterPlayAnim('gf', Papu, true);
removeFromGroup('notes', i);
end
end
end