
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 500;
local yy = 600;
local xx2 = 700;
local yy2 = 700;
local ofs = 50;
local followchars = true;
local del = 0;
local del2 = 0;
local AAA = 350
curFrame = 0;
curHealth = 0;

function onCreate()

makeLuaSprite('hbFinaleBlue', 'healthBarFinaleBlue', 0, (downscroll and -80 or 500)); --making the healthbar, which is two images that overlap each other
screenCenter('hbFinaleBlue', 'x');
setObjectCamera('hbFinaleBlue', 'hud');
addLuaSprite('hbFinaleBlue');

makeLuaSprite('hbFinaleRed', 'healthBarFinaleRed', 0, (downscroll and -80 or 500));
screenCenter('hbFinaleRed', 'x');
setObjectCamera('hbFinaleRed', 'hud');
addLuaSprite('hbFinaleRed');

    makeLuaSprite('bg', 'Stages/Black/Finale/bg', -785-AAA, -605);
    scaleObject('bg', 1, 1);
    setScrollFactor('bg', 1, 1);
    setProperty('bg.visible', false);
    setObjectOrder('bg', 0);

    setObjectOrder('gfGroup', 1);

    setScrollFactor('boyfriendGroup', 1, 1);
    setObjectOrder('boyfriendGroup', 2);

    setScrollFactor('dadGroup', 1, 1);
    setObjectOrder('dadGroup', 3);

    makeLuaSprite('fore', 'Stages/Black/Finale/fore', -695-AAA, -65+100);
    scaleObject('fore', 1, 1);
    setScrollFactor('fore', 1.1, 1.1);
    setProperty('fore.visible', false);
    setObjectOrder('fore', 4);

    makeLuaSprite('lamp', 'Stages/Black/Finale/lamp', 1100-AAA, -610);
    scaleObject('lamp', 1, 1);
    setScrollFactor('lamp', 1, 1);
    setProperty('lamp.visible', false);
    setObjectOrder('lamp', 5);

    makeLuaSprite('dark', 'Stages/Black/Finale/dark', -855-AAA, -630);
    scaleObject('dark', 2.3, 2.2);
    setScrollFactor('dark', 1, 1);
    setProperty('dark.visible', false);
    setObjectOrder('dark', 6);

    makeAnimatedLuaSprite('light', 'Stages/Black/Finale/light', -550-AAA, -1350);
    scaleObject('light', 2.75*2, 2.2*2);
    addAnimationByPrefix('light', 'light', 'light', 24, false);
    setScrollFactor('light', 1, 1);
    setProperty('light.visible', false);
    setObjectOrder('light', 7);

    makeAnimatedLuaSprite('finaleFlashback', 'Stages/Black/Finale/Flashback', 0, 0);
    scaleObject('finaleFlashback', 1.6, 1.6);
    addAnimationByPrefix('finaleFlashback', 'moog', 'finaleFlashback moog', 20, false);
    addAnimationByPrefix('finaleFlashback', 'toog', 'finaleFlashback toog', 20, false);
    addAnimationByPrefix('finaleFlashback', 'doog', 'finaleFlashback doog', 20, false);
    setScrollFactor('finaleFlashback', 1, 1);
    setProperty('finaleFlashback.visible', false);
    setProperty('finaleFlashback.alpha', 0.5); 
    setGraphicSize('finaleFlashback', screenWidth, screenHeight)
    setObjectOrder('finaleFlashback', 8);
    setObjectCamera('finaleFlashback','camOther')

    makeLuaSprite('iluminaoomaga', 'Stages/Black/Defeat/iluminaoomaga', -500, 100);
    scaleObject('iluminaoomaga', 2.2, 2.2);
    setScrollFactor('iluminaoomaga', 1, 1);
    setProperty('iluminaoomaga.visible', true);
    setObjectOrder('iluminaoomaga', 9);	

    setBlendMode('light','add')
    setBlendMode('dark','multiply')

makeLuaSprite('FlashOAlgo', '', 0, 0)
makeGraphic('FlashOAlgo', screenWidth, screenHeight,'FFFFFF')
setObjectCamera('FlashOAlgo', 'other')
setProperty('FlashOAlgo.alpha', 0)
addLuaSprite('FlashOAlgo', true)

scaleLuaSprite('dead', 1.1, 1.1)
scaleLuaSprite('bg', 1.2*2, 1.1)
scaleLuaSprite('lamp', 1.1, 1.1*2)
scaleLuaSprite('fore', 1.1*2, 1.1)

makeAnimatedLuaSprite('iconBlack', 'icons/icon-blackFinale');
addAnimationByPrefix('iconBlack', 'calm', 'black icon calm', 24, true);
addAnimationByPrefix('iconBlack', 'mad', 'black icon mad', 24, true);
objectPlayAnimation('iconBlack', 'calm', true);
setObjectCamera('iconBlack', 'hud');
addLuaSprite('iconBlack');
scaleLuaSprite('iconBlack', 0.9, 0.9)
setObjectOrder('iconP1', getObjectOrder('hbFinaleRed') + 1);
setObjectOrder('iconBlack', getObjectOrder('hbFinaleRed') + 1);
end

function onCreatePost()
setProperty('dad.scale.x', 1.8)
setProperty('dad.scale.y', 1.8) 
setProperty('dad.y', getProperty('dad.y')+250) 
setProperty('dad.x', getProperty('dad.x')+300) 
setProperty('camHUD.alpha', 0);
setProperty('healthBar.alpha', 0.0001); 
setProperty('iconP2.alpha', 0.0001);

setProperty('iconP1.visible', false);
setProperty('iconBlack.visible', false);
setProperty('hbFinaleRed.visible', false);
setProperty('hbFinaleBlue.visible', false);

if downscroll then
setProperty('hbFinaleBlue.flipY', true);
setProperty('hbFinaleRed.flipY', true);
setProperty('iconBlack.x', getProperty('iconBlack.x')+100) 
end
end

function onCountdownStarted()

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
end

function onEvent(name,value1,value2)
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
setProperty('health', 0.1)
setProperty('iconP1.visible', true);
setProperty('iconBlack.visible', true);
setProperty('hbFinaleRed.visible', true);
setProperty('hbFinaleBlue.visible', true);
setProperty('dad.scale.x', 2*1.6)
setProperty('dad.scale.y', 2*1.6) 
setProperty('dad.y', getProperty('dad.y')-250)
setProperty('dad.x', getProperty('dad.x')-300) 
setProperty('boyfriend.y', getProperty('boyfriend.y')-200)
removeLuaSprite('iluminaoomaga')
removeLuaSprite('finaleFlashback')
setProperty('dark.visible', true);
setProperty('fore.visible', true);
setProperty('lamp.visible', true);
setProperty('light.visible', true);
setProperty('bg.visible', true);
end
if name == 'Finale End' then
cameraFlash('camOther', 'FF1269', 3)
setProperty('camHUD.alpha', 0);
setProperty('camGame.alpha', 0);
end
if name == 'Finale Flashback Change' then
if value1 == 'flash' then
doTweenAlpha('FlashOAlgo', 'FlashOAlgo', 1, 1, 'linear')
runTimer('FlashOAlgo', 1.5, 1);
setProperty('finaleFlashback.visible', false);
else
setProperty('finaleFlashback.visible', true);
objectPlayAnimation('finaleFlashback', value1,true)
end
end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'FlashOAlgo' then
removeLuaSprite('FlashOAlgo')
end
end

function onBeatHit()
if (curBeat % 4 == 0) then
objectPlayAnimation('light','light',true)
     end
end

function onUpdate()
    if curBeat == 32 then
        setProperty('defaultCamZoom',0.8)
    end

    if curBeat < 32 then --start
        triggerEvent('Camera Follow Pos', 750, 800)
    end

    if curBeat >= 32 and curBeat < 48 then --first to black
        triggerEvent('Camera Follow Pos', 450, 1000)
    end
    if curBeat >= 48 and curBeat < 64 then --to bf
        triggerEvent('Camera Follow Pos', 1250, 1000)
    end
    if curBeat >= 64 and curBeat < 68 then --bf zoom in
        triggerEvent('Camera Follow Pos', 1400, 1050)
        setProperty('defaultCamZoom',1.2)
    end
    if curBeat == 67 then
        setProperty('defaultCamZoom',2.4)
    end
    if followchars == true and curBeat >= 68 then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.4)
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

            setProperty('defaultCamZoom',0.5)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    if curBeat == 492 then
        doTweenZoom('defeated', 'camGame', 2.4, 1.2, 'circIn')
    end
end

function onUpdatePost(e)
    if getProperty('healthBar.percent') > 80 then --playing an animation based on the health
        objectPlayAnimation('iconBlack', 'losing', true);
    end
    if  getProperty('healthBar.percent') < 80 then
        objectPlayAnimation('iconBlack', 'default', true);
    end
    
    curFrame = curFrame + e*24;
    if curFrame > 9 then
        curFrame = 0;
    end

    curHealth = getProperty('health')/2;
    setProperty('hbFinaleRed._frame.frame.width', 58 + (math.lerp(1089, 0, curHealth))); --masking parts of the opponent healthbar based on some offset + health
    scaleObject('iconP1', 1.15, 1.15, false); --scaling and having the fourth var not update the sprites hitbox
    if not downscroll then
    setProperty('iconBlack.x', getProperty('hbFinaleRed.x') - 155);
else
setProperty('iconBlack.x', getProperty('hbFinaleRed.x') - 55);
end
    setProperty('iconBlack.y', getProperty('hbFinaleRed.y') - (downscroll and 36 or 130)); --setting y based on if its downscroll or not
    
    setProperty('iconP1.x', getProperty('hbFinaleRed.x') + getProperty('hbFinaleRed.width') - 210);
    setProperty('iconP1.y', getProperty('hbFinaleRed.y') + (downscroll and 115 or 65));
end

function math.lerp(a, b, t)
    return a + t * (b - a);
end
