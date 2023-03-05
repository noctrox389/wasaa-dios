
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local AAAAA = 400
local xx =  1000;
local yy =  1050-AAAAA;
local xx2 = 1400;
local yy2 = 1050-AAAAA;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
local Def = {1599, 260}
local I = {-21, 57}
local L = {-45, 65}
local D = {-16, 165}
local U = {-24, 24}
local R = {2, 15}
local F = {50, 16}

function onCreate()
    makeLuaSprite('monotoneback', 'stages/attack/monotoneback', 137, -265);
    scaleObject('monotoneback', 1, 1);
    setScrollFactor('monotoneback', 1, 1);
    setProperty('monotoneback.antialiasing', true);
    setObjectOrder('monotoneback', 0);

    makeLuaSprite('fg', 'stages/attack/fg', 10, -407);
    scaleObject('fg', 1, 1);
    setScrollFactor('fg', 1, 1);
    setProperty('fg.antialiasing', true);
    setObjectOrder('fg', 1);

    makeLuaSprite('backlights', 'stages/attack/backlights', 607, -53);
    scaleObject('backlights', 1, 1);
    setScrollFactor('backlights', 1, 1);
    setProperty('backlights.antialiasing', true);
    setObjectOrder('backlights', 2);
    setBlendMode('backlights','multiply')

    makeAnimatedLuaSprite('nickt', 'stages/attack/nick t', 610, 333);
    scaleObject('nickt', 1, 1);
    addAnimationByPrefix('nickt', 'idle', 'nick t idle', 24, false);
    addAnimationByPrefix('nickt', 'an', 'nick t animation', 24, false);
    setScrollFactor('nickt', 1, 1);
    setProperty('nickt.antialiasing', true);
    setObjectOrder('nickt', 3);

    makeAnimatedLuaSprite('orbyy', 'stages/attack/orbyy', 807, 280);
    scaleObject('orbyy', 1, 1);
    addAnimationByPrefix('orbyy', 'idle', 'orbyy', 24, false);
    addAnimationByPrefix('orbyy', 'st', 'shutup', 24, false);
    setProperty('orbyy.antialiasing', true);
    setObjectOrder('orbyy', 4);

    makeAnimatedLuaSprite('cooper', 'stages/attack/cooper', 1877, 387);
    scaleObject('cooper', 1, 1);
    addAnimationByPrefix('cooper', 'idle', 'bg seat 1 instance ', 24, false);
    setScrollFactor('cooper', 1, 1);
    setProperty('cooper.antialiasing', true);
    setObjectOrder('cooper', 5);

    setScrollFactor('gfGroup', 0.95, 0.95);
    setProperty('gfGroup.antialiasing', true);
    setObjectOrder('gfGroup', 6);

    setScrollFactor('dadGroup', 1, 1);
    setProperty('dadGroup.antialiasing', true);
    setObjectOrder('dadGroup', 7);

    makeAnimatedLuaSprite('offbi', 'stages/attack/offbi', 1360, 206);
    scaleObject('offbi', 1, 1);
    addAnimationByPrefix('offbi', 'idle', 'offbi', 24, false);
    setScrollFactor('offbi', 1, 1);
    setProperty('offbi.antialiasing', true);
    setObjectOrder('offbi', 8);

    makeAnimatedLuaSprite('biddle', 'characters/biddle', 1599, 260);
    scaleObject('biddle', 1, 1);
    addAnimationByPrefix('biddle', 'idle', 'biddle idle', 24, false);
    addAnimationByPrefix('biddle', 'singLEFT', 'biddle left', 24, false);
    addAnimationByPrefix('biddle', 'singUP', 'biddle up', 24, false);
    addAnimationByPrefix('biddle', 'singRIGHT', 'biddle right', 24, false);
    addAnimationByPrefix('biddle', 'singDOWN', 'biddle down', 24, false);
    setScrollFactor('biddle', 1, 1);
    setProperty('biddle.antialiasing', true);
    setObjectOrder('biddle', 9);

    makeAnimatedLuaSprite('loggoattack', 'stages/attack/loggoattack', 1020, 377);
    scaleObject('loggoattack', 1, 1);
    addAnimationByPrefix('loggoattack', 'idle', 'loggfriend', 24, true);
    setScrollFactor('loggoattack', 1, 1);
    setProperty('loggoattack.antialiasing', true);
    setObjectOrder('loggoattack', 10);

    setScrollFactor('boyfriendGroup', 1, 1);
    setProperty('boyfriendGroup.antialiasing', true);
    setObjectOrder('boyfriendGroup', 11);

    makeLuaSprite('lamps', 'stages/attack/lamps', 573, -287);
    scaleObject('lamps', 1, 1);
    setScrollFactor('lamps', 1, 1);
    setProperty('lamps.antialiasing', true);
    setObjectOrder('lamps', 12);

makeLuaSprite('frontlight', 'stages/attack/frontlight', 417, -3);
scaleObject('frontlight', 1, 1);
setScrollFactor('frontlight', 1, 1);
setProperty('frontlight.antialiasing', true);
setObjectOrder('frontlight', 13);
setBlendMode('frontlight', 'add')

end

function onCreatePost()
setProperty('dad.y', getProperty('dad.y')-AAAAA) 
setProperty('boyfriend.y', getProperty('boyfriend.y')-AAAAA) 
setProperty('gf.y', getProperty('gf.y')-AAAAA) 

for i = 0, getProperty('unspawnNotes.length')-1 do
if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'GF Sing' then
setPropertyFromGroup('unspawnNotes', i, 'texture', 'Stages/Airship/WJ/Papus');
setPropertyFromGroup('unspawnNotes', i, 'mustPress', false)
end
end
end

function onCountdownStarted()    

for i = 0, getProperty('unspawnNotes.length')-1 do
if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'No Animation' then
setPropertyFromGroup('unspawnNotes', i, 'texture', 'Stages/Airship/WJ/Papus');
setPropertyFromGroup('unspawnNotes', i, 'mustPress', false)
setPropertyFromGroup("unspawnNotes", i, "offsetX", getPropertyFromGroup('unspawnNotes', i, 'offsetX') +650)
end
end
end

local AnimCr = false

function onEvent(name,value1,value2)
if name == 'Orbyy' then
AnimCr = true
objectPlayAnimation('orbyy', 'st', true)
setProperty('orbyy.x', getProperty('orbyy.x')-140) 
elseif name == 'Orbyy2' then
AnimCr = false
objectPlayAnimation('orbyy', 'idle');
setProperty('orbyy.x', getProperty('orbyy.x')+140) 
end 
if name == 'Forehead' then
AnimCr = true
objectPlayAnimation('nickt', 'an', true)
doTweenAlpha('biddle', 'biddle', 0.25, 0.25, 'linear')
doTweenAlpha('offbi', 'offbi', 0.25, 0.25, 'linear')
doTweenAlpha('cooper', 'cooper', 0.25, 0.25, 'linear')
doTweenAlpha('loggoattack', 'loggoattack', 0.25, 0.25, 'linear')
doTweenAlpha('orbyy', 'orbyy', 0.25, 0.25, 'linear')
doTweenAlpha('dad', 'dad', 0.25, 0.25, 'linear')
doTweenAlpha('gf', 'gf', 0.25, 0.25, 'linear')
doTweenAlpha('boyfriend', 'boyfriend', 0.25, 0.25, 'linear')

elseif name == 'Forehead2' then
AnimCr = false
doTweenAlpha('biddle', 'biddle', 1, 0.25, 'linear')
doTweenAlpha('offbi', 'offbi', 1, 0.25, 'linear')
doTweenAlpha('cooper', 'cooper', 1, 0.25, 'linear')
doTweenAlpha('loggoattack', 'loggoattack', 1, 0.25, 'linear')
doTweenAlpha('orbyy', 'orbyy', 1, 0.25, 'linear')
doTweenAlpha('dad', 'dad', 1, 0.25, 'linear')
doTweenAlpha('gf', 'gf', 1, 0.25, 'linear')
doTweenAlpha('boyfriend', 'boyfriend', 1, 0.25, 'linear')
end
end


function onUpdatePost()
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
    if curBeat == 64 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 1225
        yy = 1000-AAAAA
        xx2 = 1225
        yy2 = 1000-AAAAA
    end
    if curBeat == 80 then
        setProperty('defaultCamZoom',0.7)
		followchars = true
        xx = 1225
        yy = 1000-AAAAA
        xx2 = 1225
        yy2 = 1000-AAAAA
    end
    if curBeat == 95 then
        setProperty('defaultCamZoom',0.9)
		followchars = true
        xx = 1000
        yy = 900-AAAAA
        xx2 = 1000
        yy2 = 900-AAAAA
    end
    if curBeat == 99 then
        setProperty('defaultCamZoom',0.75)
		followchars = true
        xx = 1000
        yy = 1050-AAAAA
        xx2 = 1400  
        yy2 = 1050-AAAAA
    end
    if curBeat == 196 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 1225
        yy = 1000-AAAAA
        xx2 = 1225
        yy2 = 1000-AAAAA
    end
    if curBeat == 229 then
        setProperty('defaultCamZoom',0.7)
		followchars = true
        xx = 1225
        yy = 1000-AAAAA
        xx2 = 1225
        yy2 = 1000-AAAAA
    end
    if curBeat == 276 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 1225
        yy = 1000-AAAAA
        xx2 = 1225
        yy2 = 1000-AAAAA
    end
    if curBeat == 292 then
        setProperty('defaultCamZoom',0.75)
		followchars = true
        xx = 1000
        yy = 1050-AAAAA
        xx2 = 1400  
        yy2 = 1050-AAAAA
    end
    if curBeat == 324 then
        setProperty('defaultCamZoom',0.7)
		followchars = true
        xx = 1225
        yy = 1000-AAAAA
        xx2 = 1225
        yy2 = 1000-AAAAA
    end
    if curBeat == 355 then
        setProperty('defaultCamZoom',0.9)
		followchars = true
        xx = 1000
        yy = 900-AAAAA
        xx2 = 1000
        yy2 = 900-AAAAA
    end
    if curBeat == 360 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 1225
        yy = 1000-AAAAA
        xx2 = 1225
        yy2 = 1000-AAAAA
    end 
Papu = ''
for i = 0, getProperty('notes.length') do
if getSongPosition() > getPropertyFromGroup('notes', i ,'strumTime') and getPropertyFromGroup('notes',i,'noteType') == 'GF Sing' then
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
triggerEvent('Play Animation', Papu, 'gf')
removeFromGroup('notes', i);
end
end
end


function onUpdate(elapsed)
anim = ''
for i = 0, getProperty('notes.length') do
if getSongPosition() > getPropertyFromGroup('notes', i ,'strumTime') and getPropertyFromGroup('notes', i, 'noteType') == 'No Animation' then 
noteData = getPropertyFromGroup('notes',i,'noteData')
if noteData == 0 then
anim = 'singLEFT'
setProperty('biddle.x', Def[1]+L[1]) 
setProperty('biddle.y', Def[2]+L[2]) 
elseif noteData == 1 then
anim = 'singDOWN'
setProperty('biddle.x', Def[1]+D[1]) 
setProperty('biddle.y', Def[2]+D[2]) 
elseif noteData == 2 then
anim = 'singUP'
setProperty('biddle.x', Def[1]+U[1]) 
setProperty('biddle.y', Def[2]+U[2]) 
elseif noteData == 3 then
anim = 'singRIGHT'
setProperty('biddle.x', Def[1]+R[1]) 
setProperty('biddle.y', Def[2]+R[2]) 
end
objectPlayAnimation('biddle', anim, true)
removeFromGroup('notes', i);
end
end
end

function onBeatHit()
if curBeat % 2 == 0 and not AnimCr then
setProperty('biddle.x', Def[1]) 
setProperty('biddle.y', Def[2])
objectPlayAnimation('biddle', 'idle');
objectPlayAnimation('offbi', 'idle');
objectPlayAnimation('cooper', 'idle');
objectPlayAnimation('loggoattack', 'idle');
objectPlayAnimation('orbyy', 'idle');
objectPlayAnimation('nickt', 'idle');
end
end