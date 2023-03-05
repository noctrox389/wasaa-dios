
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 1100;
local yy = 1150;
local xx2 = 1100;
local yy2 = 1150;
local ofs = 0;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
makeLuaSprite('deadguy', 'Stages/Polus/deadguy', 100, 475);
scaleObject('deadguy', 1, 1);
setScrollFactor('deadguy', 1, 1);
setProperty('deadguy.antialiasing', true);
setObjectOrder('deadguy', 0);

setProperty('cameraSpeed', 30)

makeAnimatedLuaSprite('meeting', 'Stages/Polus/meeting', 0, 0);
addAnimationByPrefix('meeting', 'yo', 'meeting buzz', 24, false);  
setObjectCamera('meeting', 'camOther')
setGraphicSize('meeting', screenWidth, screenHeight)
addLuaSprite('meeting', false);
screenCenter('meeting', 'x')
screenCenter('meeting', 'y')

makeLuaSprite('KILLYOURSELF', 'Stages/Polus/KILLYOURSELF', 0, -50);
scaleObject('KILLYOURSELF', 0.75, 0.75);
setScrollFactor('KILLYOURSELF', 1, 1);
setObjectCamera('KILLYOURSELF', 'camOther')
screenCenter('KILLYOURSELF', 'x')
screenCenter('KILLYOURSELF', 'y')
addLuaSprite('KILLYOURSELF', false);

makeLuaSprite('starBG', 'Stages/Polus/starBG', 0, 0);
setGraphicSize('starBG', screenWidth, screenHeight)
setScrollFactor('starBG', 1, 1);
setObjectCamera('starBG', 'camOther')
addLuaSprite('starBG', false);

makeLuaSprite('mad', 'Stages/Polus/mad mad dude', 0, 0);
scaleObject('mad', 0.4, 0.4);
setObjectCamera('mad', 'camOther')
screenCenter('mad', 'y')
addLuaSprite('mad', false);

setProperty('meeting.visible', false)
setProperty('KILLYOURSELF.visible', false)
setProperty('starBG.visible', false)
setProperty('mad.visible', false)
end
ejectado = false
function onEvent(name,value1,value2)
if name == 'Who Buzz' then
setProperty('camHUD.alpha', 0)
if value1 == '' then
setProperty('meeting.visible', true)
setProperty('KILLYOURSELF.visible', true)
objectPlayAnimation('meeting', 'yo', true)
else
setProperty('starBG.visible', true)
setProperty('mad.visible', true)
ejectado = true
end
end
if name == 'Asbel' then
if value1 == 'target' then
if value2 == 'bf' then
xx = 1500;
yy = 1300;
xx2 = 1500;
yy2 = 1300;
doTweenZoom('Zoom','camGame', 1.3, 0.01, 'linear')
end
if value2 == 'dad' then
xx = 800;
yy = 1300;
xx2 = 800;
yy2 = 1300;
doTweenZoom('Zoom','camGame', 1.3, 0.01, 'linear')
end
if value2 == 'off' then 
xx = 1100;
yy = 1150;
xx2 = 1100;
yy2 = 1150;
doTweenZoom('Zoom','camGame', 0.7, 0.01, 'linear')
end
end
end
end

function onTweenCompleted(name)
if name == 'Zoom' then
setProperty("defaultCamZoom", getProperty('camGame.zoom')) 
end
end

function onUpdate()
if ejectado then
setProperty('mad.angle', getProperty('mad.angle')+1);
setProperty('mad.x', getProperty('mad.x')+2);
end
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

