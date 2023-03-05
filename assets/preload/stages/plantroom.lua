
u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx =  500;
local yy =  200;
local xx2 = 880;
local yy2 = 200;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
local ExtraZoom = 0
local Twist = false
local angleshit = 0.2;
local anglevar = 0.1;
local AlphaVig = 0

function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end
function math.lerp(from,to,i)return from+(to-from)*i end


function onCreate()
    makeLuaSprite('bg sky', 'Stages/MiraGrn/Pink/bg sky', -1045, -906.67);
    scaleObject('bg sky', 2.3, 2.2);
    setScrollFactor('bg sky', 1, 1);
    setProperty('bg sky.antialiasing', true);
    addLuaSprite('bg sky', false);

    makeLuaSprite('cloud front', 'Stages/MiraGrn/Pink/cloud front', -925, -70);
    scaleObject('cloud front', 2.2, 2.2);
    setScrollFactor('cloud front', 1, 1);
    addLuaSprite('cloud front', false);
    setProperty('cloud front.antialiasing', true);

    makeLuaSprite('glasses', 'Stages/MiraGrn/Pink/glasses', -930, -850);
    scaleObject('glasses', 2.2, 2.2);
    setScrollFactor('glasses', 1, 1);
    setProperty('glasses.antialiasing', true);
    addLuaSprite('glasses', false);

    makeAnimatedLuaSprite('crew2', 'Stages/MiraGrn/Pink/crew2', 1150, -45);
    scaleObject('crew2', 1, 1);
    addAnimationByPrefix('crew2', 'idle', 'tomatomongus', 24, false);
    setScrollFactor('crew2', 1, 1);
    setProperty('crew2.antialiasing', true);
    addLuaSprite('crew2', false);

if songName == 'Pinkwave' then
makeAnimatedLuaSprite('black_pretender', 'Stages/MiraGrn/Pink/black_pretender', 400, -150);
scaleObject('black_pretender', 2.2, 2.2);
addAnimationByPrefix('black_pretender', 'idle', 'black', 24, false);
setScrollFactor('black_pretender', 1, 1);
setProperty('black_pretender.antialiasing', true);
addLuaSprite('black_pretender', false);

makeAnimatedLuaSprite('grey_pretender', 'Stages/MiraGrn/Pink/grey_pretender', -100, -80);
scaleObject('grey_pretender', 1, 1);
addAnimationByPrefix('grey_pretender', 'idle', 'gray anim', 24, false);
setScrollFactor('grey_pretender', 1, 1);
setProperty('grey_pretender.antialiasing', true);
addLuaSprite('grey_pretender', false);

makeAnimatedLuaSprite('longus_leave', 'Stages/MiraGrn/Pink/longus_leave', 675, -50);
scaleObject('longus_leave', 1, 1);
addAnimationByPrefix('longus_leave', 'idle', 'longus anim', 24, false);
setScrollFactor('longus_leave', 1, 1);
setProperty('longus_leave.antialiasing', true);
addLuaSprite('longus_leave', false);

makeAnimatedLuaSprite('tomato_pretender', 'Stages/MiraGrn/Pink/tomato_pretender', 1160, 130);
scaleObject('tomato_pretender', 1, 1);
addAnimationByPrefix('tomato_pretender', 'idle', 'tomatongus anim', 24, false);
setScrollFactor('tomato_pretender', 1, 1);
setProperty('tomato_pretender.antialiasing', true);
addLuaSprite('tomato_pretender', false);
end

    makeLuaSprite('what is this', 'Stages/MiraGrn/Pink/what is this', 436.67, -590);
    scaleObject('what is this', 1, 1);
    setScrollFactor('what is this', 1, 1);
    setProperty('what is this.antialiasing', true)
    addLuaSprite('what is this', false);


    makeAnimatedLuaSprite('crew1', 'Stages/MiraGrn/Pink/crew1', 170, -90);
    scaleObject('crew1', 1, 1);
    addAnimationByPrefix('crew1', 'idle', 'grey', 24, false);
    setScrollFactor('crew1', 1, 1);
    setProperty('crew1.antialiasing', true);
    addLuaSprite('crew1', false);

    makeLuaSprite('lmao', 'Stages/MiraGrn/Pink/lmao', -370, -20);
    scaleObject('lmao', 1, 1);
    setScrollFactor('lmao', 1, 1);
    setProperty('lmao.antialiasing', true);
    addLuaSprite('lmao', false);

    makeAnimatedLuaSprite('vines1', 'Stages/MiraGrn/Pink/vines', -525, -1147);
    scaleObject('vines1', 2.5, 2.5);
    addAnimationByPrefix('vines1', 'idle', 'idle', 24, true);
    setScrollFactor('vines1', 1, 1);
    setProperty('vines1.antialiasing', true);
    addLuaSprite('vines1', false);

    makeAnimatedLuaSprite('crew4', 'Stages/MiraGrn/Pink/crew4', -760, -20);
    scaleObject('crew4', 1, 1);
    addAnimationByPrefix('crew4', 'idle', 'blue', 24, false);
    setScrollFactor('crew4', 1, 1);
    setProperty('crew4.antialiasing', true);
    addLuaSprite('crew4', true);

    makeLuaSprite('front pot', 'Stages/MiraGrn/Pink/front pot', -1163, 540);
    scaleObject('front pot', 2, 2);
    setScrollFactor('front pot', 1, 1);
    setProperty('front pot.antialiasing', true);
    addLuaSprite('front pot', true);

    makeAnimatedLuaSprite('crew3', 'Stages/MiraGrn/Pink/crew 3', 1470, 190);
    scaleObject('crew3', 1, 1);
    addAnimationByPrefix('crew3', 'idle', 'RHM', 24, false);
    setScrollFactor('crew3', 1, 1);
    setProperty('crew3.antialiasing', true);
    addLuaSprite('crew3', true);

makeLuaSprite('vignette2', 'Stages/MiraGrn/Pink/vignette2', 0, 0);
setScrollFactor('vignette2', 1, 1);
scaleLuaSprite('vignette2', 2, 2);
addLuaSprite('vignette2', false);
setBlendMode('vignette2', 'ADD')
setObjectCamera('vignette2', 'other');

makeAnimatedLuaSprite('hearts', 'Stages/MiraGrn/Pink/hearts', 0, 0);
scaleObject('hearts', 2, 1);
addAnimationByPrefix('hearts', 'Symbol', 'Symbol ', 24, true);
setScrollFactor('hearts', 1, 1);
setProperty('hearts.antialiasing', true);
addLuaSprite('hearts', false);
setObjectCamera('hearts', 'other');

makeLuaSprite('vignette', 'Stages/MiraGrn/Pink/vignette', 0, 0);
setScrollFactor('vignette', 1, 1);
scaleLuaSprite('vignette', 2, 2);
addLuaSprite('vignette', false);
setBlendMode('vignette', 'ADD')
setObjectCamera('vignette', 'other');

setProperty('vignette.visible', false) 
setProperty('vignette2.visible', false) 
setProperty('hearts.visible', false) 

setProperty('grey_pretender.visible', false) 
setProperty('black_pretender.visible', false) 
setProperty('longus_leave.visible', false) 
setProperty('tomato_pretender.visible', false) 


end

function onCreatePost()
if getDataFromSave('Skins', 'Sobrescribir') == false or isStoryMode then
setProperty('boyfriend.scale.y', 1.3) 
setProperty('gf.scale.y', 1.2) 
end

setProperty('dad.scale.x', 1.2) 
end


function onBeatHit()
if curBeat % 2 == 0 then
AlphaVig = 1
objectPlayAnimation('crew1', 'idle', true)
objectPlayAnimation('crew2', 'idle', true)
objectPlayAnimation('crew4', 'idle', true)
objectPlayAnimation('crew3', 'idle', true)
end
if twist then
if curBeat < 388 then

        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
    else
    end  
end
end

function onStepHit()
    if curBeat < 388 and twist then
        if curStep % 4 == 0 then
            doTweenY('rrr', 'camHUD', -10, stepCrochet*0.002, 'circOut')
            doTweenY('rtr', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
        end
        if curStep % 4 == 2 and twist then
            doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
            doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
        end
    end
 end

function onUpdate(elapsed)
setProperty('vignette.alpha', AlphaVig) 
AlphaVig = math.lerp(AlphaVig, 0, boundTo(elapsed / 5 * 20, 0, 1))
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.5+ExtraZoom)
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

            setProperty('defaultCamZoom',0.5+ExtraZoom)
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
    end
    
end

function onEvent(n,v1,v2)

if n == 'Camera Twist' then
twist = true
angleshit = 0.2 + v1;
anglevar = 0.1 +v2;
end
if n == 'Extra Cam Zoom' then
ExtraZoom = v1
end
if n == 'pink toggle' then
if v1 == '1' then
setProperty('vignette.visible', true) 
setProperty('vignette2.visible', true) 
setProperty('hearts.visible', true) 
elseif v1 == '2' then
setProperty('vignette.visible', false) 
setProperty('vignette2.visible', false) 
setProperty('hearts.visible', false) 
elseif v1 == '5' then
setProperty('vignette.visible', false) 
setProperty('vignette2.visible', false) 
setProperty('hearts.visible', false) 
end
end
if n == 'Asbel' then
if v1 == 'negro puto' then
followchars = false;
setProperty('grey_pretender.visible', true) 
setProperty('black_pretender.visible', true) 
setProperty('longus_leave.visible', true) 
setProperty('tomato_pretender.visible', true) 
setProperty('crew1.visible', false) 
setProperty('crew4.visible', false) 
setProperty('crew3.visible', false) 
setProperty('crew2.visible', false) 
objectPlayAnimation('black_pretender', 'idle', true)
objectPlayAnimation('grey_pretender', 'idle', true)
objectPlayAnimation('tomato_pretender', 'idle', true)
objectPlayAnimation('longus_leave', 'idle', true)
setProperty('defaultCamZoom', 1)
triggerEvent('Camera Follow Pos', xx2-100, yy2-100)
doTweenAlpha('dad', 'dad', 0.25, 0.25, 'linear')
doTweenAlpha('gf', 'gf', 0.25, 0.25, 'linear')
doTweenAlpha('boyfriend', 'boyfriend', 0.25, 0.25, 'linear')
doTweenAlpha('camHUD', 'camHUD', 0, 0.25, 'linear')
end
if v1 == 'fn' then
doTweenAlpha('camGame', 'camGame', 0, 0.1/4, 'linear')
end
if v1 == 'fnn' then
doTweenAlpha('camGaym', 'camGame', 0, 0.1, 'linear')

cameraFlash('camOther', 'FFFFFF', 0.2)
end
end
end

function onTweenCompleted(tag, loops, loopsLeft)
if tag == 'camGame' then
doTweenAlpha('camGameT', 'camGame', 1, 0.1/4, 'linear')
end
end