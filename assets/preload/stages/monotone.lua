
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 950;
local yy = 300;
local xx2 = 950;
local yy2 = 300;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;


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

makeAnimatedLuaSprite('dialogue', 'Stages/skeld/dialogue', -1145, -905);
scaleObject('dialogue', 1, 1);
addAnimationByPrefix('dialogue', 'dialogue', 'dialogue', 24, false);  
setScrollFactor('dialogue', 1, 1);
setProperty('dialogue.antialiasing', true);
setObjectCamera('dialogue','camOther')
screenCenter('dialogue', 'x')
screenCenter('dialogue', 'y')
addLuaSprite('dialogue',false)
setProperty('dialogue.alpha', 0)

    setScrollFactor('gfGroup', 0.95, 0.95);
    setProperty('gfGroup.antialiasing', true);
    setObjectOrder('gfGroup', 0);

    makeAnimatedLuaSprite('defeat', 'Stages/Black/Defeat/defeat', -1145, -905);
    scaleObject('defeat', 6, 6);
    addAnimationByPrefix('defeat', 'defeat', 'defeat', 24, false);  
    setScrollFactor('defeat', 1, 1);
    setProperty('defeat.antialiasing', true);
    setObjectOrder('defeat', 1);

    makeLuaSprite('evilejected', 'Stages/skeld/evilejected', -1000, -425);
    scaleObject('evilejected', 2, 2);
    setScrollFactor('evilejected', 1, 1);
    setProperty('evilejected.antialiasing', true);
    setObjectOrder('evilejected', 2);

    makeLuaSprite('RedBG', 'Stages/skeld/RedBG', -1025, -920);
    scaleObject('RedBG', 2, 2);
    setScrollFactor('RedBG', 1, 1);
    setProperty('RedBG.antialiasing', true);
    setObjectOrder('RedBG', 3);

    makeLuaSprite('BlueBG', 'Stages/skeld/BlueBG', -995, -928);
    scaleObject('BlueBG', 2, 2);
    setScrollFactor('BlueBG', 1, 1);
    setProperty('BlueBG.antialiasing', true);
    setObjectOrder('BlueBG', 7);

    setScrollFactor('dadGroup', 1, 1);
    setProperty('dadGroup.antialiasing', true);
    setObjectOrder('dadGroup', 9);

    setScrollFactor('boyfriendGroup', 1, 1);
    setProperty('boyfriendGroup.antialiasing', true);
    setObjectOrder('boyfriendGroup', 10);

    makeLuaSprite('overlay2', 'Stages/skeld/overlay2', -845, -365);
    scaleObject('overlay2', 3.4, 3.4);
    setScrollFactor('overlay2', 1, 1);
    setProperty('overlay2.antialiasing', true);
    setObjectOrder('overlay2', 11);

    makeLuaSprite('overlay', 'Stages/skeld/overlay', -1035, -930);
    scaleObject('overlay', 4.1, 4.1);
    setScrollFactor('overlay', 1, 1);
    setProperty('overlay.antialiasing', true);
    setObjectOrder('overlay', 12);

setProperty('camHUD.alpha', 0);
end

function onEvent(name,value1,value2)
if name == 'Asbel' then 
if value1 == 'joderamolospenes' then 
removeLuaSprite('dialogue')
end
end
if name == 'Identity Crisis line' then
setProperty('dialogue.alpha', 1)
objectPlayAnimation('dialogue', 'dialogue');
end
if name == 'HUD Fade' then
if value1 == '1' then
setProperty('camHUD.alpha', 0);
setProperty('camGame.alpha', 0);
elseif value1 == '0' then
setProperty('camHUD.alpha', 1);
setProperty('camGame.alpha', 1);
end
end
if name == 'Change Character' then
cameraFlash('camGame', 'FFFFFF', 1)
if value2 == 'monotone' then
setProperty('BlueBG.visible', true);
setProperty('dad.scale.x', 1.4)
setProperty('dad.scale.y', 1.6) 
elseif value2 == 'impostor' then
setProperty('RedBG.visible', true);
setProperty('BlueBG.visible', false);
setProperty('dad.scale.x', 1.25)
setProperty('dad.scale.y', 1.25)
elseif value2 == 'parasite' then
setProperty('evilejected.visible', true);
setProperty('BlueBG.visible', false);
setProperty('RedBG.visible', false);
setProperty('dad.scale.x', 2 * 1.65)
setProperty('dad.scale.y', 2 * 1.65) 
elseif value2 == 'blackdk' then
setProperty('evilejected.visible', false);
setProperty('BlueBG.visible', false);
setProperty('RedBG.visible', false);
setProperty('dad.scale.x', 2.25)
setProperty('dad.scale.y', 2.25) 
end 
end
end


function onBeatHit()
if curBeat % 2 == 0 then
objectPlayAnimation('defeat', 'defeat');
end
    if curBeat == 6 then
        doTweenZoom('defeated', 'camGame', 0.4, 20, 'linear')
    end
    if curBeat == 32 then
        setProperty('defaultCamZoom',0.4)
        followchars = true
        xx = 950
        yy = 700-400
        xx2 = 950
        yy2 = 700-400
    end
    if curBeat == 81 then
        setProperty('defaultCamZoom',0.45)
        followchars = true
        xx = 850
        yy = 750-400
        xx2 = 1050
        yy2 = 750-400
    end
    if curBeat == 88 then
        setProperty('defaultCamZoom',0.8)
        followchars = true
        xx = 700
        yy = 800-400
        xx2 = 700
        yy2 = 800-400
    end
    if curBeat == 95 then
        setProperty('defaultCamZoom',0.5)
        followchars = true
        xx = 850
        yy = 750-400
        xx2 = 1050
        yy2 = 750-400
    end
    if curBeat == 112 then
        setProperty('defaultCamZoom',0.5)
        followchars = true
        xx = 950
        yy = 700-400
        xx2 = 950
        yy2 = 700-400
    end
    if curBeat == 128 then
        setProperty('defaultCamZoom',0.6)
        followchars = true
        xx = 850
        yy = 750-400
        xx2 = 1050
        yy2 = 750-400
    end
    if curBeat == 192 then
        setProperty('defaultCamZoom',0.5)
        followchars = true
        xx = 950
        yy = 700-400
        xx2 = 950
        yy2 = 700-400
    end
    if curBeat == 208 then
        setProperty('defaultCamZoom',0.6)
        followchars = true
        xx = 850
        yy = 750-400
        xx2 = 1050
        yy2 = 750-400
    end
    if curBeat == 224 then
        setProperty('defaultCamZoom',0.5)
        followchars = true
        xx = 950
        yy = 700-400
        xx2 = 950
        yy2 = 700-400
    end
    if curBeat == 254 then
        setProperty('defaultCamZoom',0.6)
        followchars = true
        xx = 1300
        yy = 800-400
        xx2 = 1300
        yy2 = 800-400
    end
    if curBeat == 262 then
        setProperty('defaultCamZoom',0.7)
        followchars = true
        xx = 1400
        yy = 800-400
        xx2 = 1400
        yy2 = 800-400
    end
    if curBeat == 270 then
        setProperty('defaultCamZoom',0.8)
        followchars = true
        xx = 1450
        yy = 800-400
        xx2 = 1450
        yy2 = 800-400
    end
    if curBeat == 278 then
        setProperty('defaultCamZoom',0.9)
        followchars = true
        xx = 1500
        yy = 800-400
        xx2 = 1500
        yy2 = 800-400
    end
    if curBeat == 294 then
        setProperty('defaultCamZoom',0.4)
        followchars = true
        xx = 850
        yy = 700-400
        xx2 = 850
        yy2 = 700-400
    end
    if curBeat == 312 then
        setProperty('defaultCamZoom',0.45)
        followchars = true
        xx = 850
        yy = 750-400
        xx2 = 1050
        yy2 = 750-400
    end
    if curBeat == 328 then
        setProperty('defaultCamZoom',0.55)
        followchars = true
        xx = 650
        yy = 750-400
        xx2 = 650
        yy2 = 750-400
    end
    if curBeat == 334 then
        setProperty('defaultCamZoom',0.45)
        followchars = true
        xx = 650
        yy = 750-400
        xx2 = 650
        yy2 = 750-400
    end
    if curBeat == 344 then
        setProperty('defaultCamZoom',0.7)
        followchars = true
        xx = 1400
        yy = 800-400
        xx2 = 1300
        yy2 = 800-400
    end
    if curBeat == 360 then
        setProperty('defaultCamZoom',0.5)
        followchars = true
        xx = 950
        yy = 700-400
        xx2 = 950
        yy2 = 700-400
    end
    if curBeat == 456 then
        setProperty('defaultCamZoom',0.6)
        followchars = true
        xx = 850
        yy = 750-400
        xx2 = 1050
        yy2 = 750-400
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
