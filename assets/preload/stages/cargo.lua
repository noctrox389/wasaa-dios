
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 2000;
local yy = 1050;
local xx2 = 2300;
local yy2 = 1050;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;



function onCreate()
    addCharacterToList('bf-defeat-normal', 'boyfriend') 

    makeLuaSprite('cargo', 'Stages/Airship/cargo/cargo', 1050, 200);
    setScrollFactor('cargo', 1, 1);
    scaleLuaSprite('cargo', 1, 1);
    addLuaSprite('cargo', false);

    makeLuaSprite('airshipFlashback', 'Stages/Airship/cargo/airshipFlashback', 1900, 800);
    setScrollFactor('airshipFlashback', 1, 1);
    scaleLuaSprite('airshipFlashback', 1, 1.1);
    addLuaSprite('airshipFlashback', false);
    setProperty('airshipFlashback.alpha', 0)

    makeLuaSprite('overlay', 'Stages/Airship/cargo/overlay ass dk', 1025, 70);
    setScrollFactor('overlay', 1, 1);
    scaleLuaSprite('overlay', 2, 1);
    addLuaSprite('overlay', true);
    setBlendMode('overlay', 'OVERLAY')
    setProperty('overlay.alpha', 0.25) 

    setProperty('defaultCamZoom',0.7)
end

function onCreatePost()
setProperty('dad.scale.x', 1.1*2)
setProperty('dad.scale.y', 1.1*1.25) 

setProperty('gf.scale.x', 2.25)
setProperty('gf.scale.y', 2.25) 

doTweenAlpha('camHUD', 'camHUD', 0, 0.01, 'linear')
end

Black = false
ForzarBF = false

function onEvent(name,value1,value2)
if name == 'flash' then
doTweenAlpha('camHUD', 'camHUD', 1, 0.01, 'linear')
end
if name == 'Asbel' then
if value1 == 'bw' then
Black = true 
elseif value1 == 'bwn' then
Black = false  
elseif value1 == 'fbt' then
ForzarBF = true  
elseif value1 == 'fb' then
ForzarBF = false  
end 
end
if name == 'Double Kill Events' then
if value1 == 'darken' then
cameraFlash('camGame', '000000', 1)
doTweenAlpha('overlay', 'overlay', 0, 5, 'linear')
doTweenAlpha('dad', 'dad', 0, 5, 'linear')
doTweenAlpha('gf', 'gf', 0, 5, 'linear') 
doTweenAlpha('cargo', 'cargo', 0, 5, 'linear') 
elseif value1 == 'airship' then
doTweenAlpha('airshipFlashback', 'airshipFlashback', 0.25, 14, 'linear') 
elseif value1 == 'brighten' then
removeLuaSprite('airshipFlashback')
doTweenAlpha('overlay', 'overlay', 0.25, 0.01, 'linear')
doTweenAlpha('dad', 'dad', 1, 0.01, 'linear')
doTweenAlpha('gf', 'gf', 1, 0.01, 'linear') 
doTweenAlpha('cargo', 'cargo', 1, 0.01, 'linear') 
elseif value1 == 'gonnakill' then
doTweenAlpha('camGame', 'camGame', 0, 1, 'linear')
doTweenColor('overlay', 'overlay', 'FF0000', 1, 'linear');
elseif value1 == 'readykill' then
triggerEvent('Change Character', 'boyfriend', 'bf-defeat-normal');
doTweenAlpha('camGame', 'camGame', 1, 1, 'linear')
doTweenAlpha('overlay', 'overlay', 0.8, 1, 'linear')
setProperty('dad.alpha', 0) 
removeLuaSprite('cargo')
scaleLuaSprite('overlay', 1.5, 1);

setProperty('healthBarBG.visible', false)
setProperty('healthBar.visible', false)
setProperty('iconP1.visible', false)
setProperty('iconP2.visible', false)
elseif value1 == 'kill' then
doTweenAlpha('camGame', 'camGame', 0, 0.01, 'linear')
doTweenAlpha('camHUD', 'camHUD', 0, 0.01, 'linear')
cameraFlash('camOther', 'FF0000', 1)
end
end 
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}

function opponentNoteHit(id, direction, noteType, isSustainNote)
if Black then
triggerEvent('Play Animation', singAnims[direction + 1], 'gf')
end
end

SeguirBF = false


function onUpdate()
if mustHitSection == false then
SeguirBF = false
else
SeguirBF = true
end
if ForzarBF then
SeguirBF = true
end
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if SeguirBF then
            setProperty('defaultCamZoom',0.8)
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
        else
            setProperty('defaultCamZoom',0.8)
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
        end 
    else
        triggerEvent('Camera Follow Pos','','')
    end
    if curStep == 1 then
    doTweenZoom('camGame','camGame', 1, 1,'sineInOut')
    end
    if curBeat >= 356 and curBeat < 420 then
		setProperty('defaultCamZoom',1.1)
        xx2 = 2750;
        yy2 = 1150;  
	end
    if curBeat == 420 then
		setProperty('defaultCamZoom',0.8)
        xx2 = 2300;
        yy2 = 1050;  
	end
    if curBeat >= 552 and curBeat < 556 then
		setProperty('defaultCamZoom',1.2)
        xx = 1650;
        yy = 1180;  
	end
    if curBeat == 556 then
        xx = 2000;
        yy = 1050;  
	end
    if curBeat == 916 then
        doTweenZoom('defeated', 'camGame', 0.4, 20, 'linear')
    end

end

