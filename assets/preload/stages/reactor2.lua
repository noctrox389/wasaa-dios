
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 1725;
local yy = 1100;
local xx2 = 1725;
local yy2 = 1100;
local ofs = 10;
local followchars = true;
local del = 0;
local del2 = 0;

local OffSetX = 100
local OffSetY = 100

function onCreate()
makeLuaSprite('wallbgthing', 'Stages/MiraGrn/Reactor/wallbgthing', 0, 0);
setScrollFactor('wallbgthing', 0.8, 0.8);
scaleLuaSprite('wallbgthing', 4, 3);
addLuaSprite('wallbgthing', false);

makeAnimatedLuaSprite('ball lol', 'Stages/MiraGrn/Reactor/ball lol', 1100 + OffSetX, 0 + OffSetY);
addAnimationByPrefix('ball lol', 'ball lol', 'core instance 1', 24, true);  
objectPlayAnimation('ball lol', 'ball lol', true)
addLuaSprite('ball lol', false);
scaleLuaSprite('ball lol', 2.5, 2.5);

makeLuaSprite('floornew', 'Stages/MiraGrn/Reactor/floornew', 70, 800);
setScrollFactor('floornew', 1, 1);
scaleLuaSprite('floornew', 1.25, 1.25);
addLuaSprite('floornew', false);

makeAnimatedLuaSprite('yellowcoti', 'Stages/MiraGrn/Reactor/yellowcoti', 800 + OffSetX, 850 + OffSetY);
addAnimationByPrefix('yellowcoti', 'yellowcoti', 'Pillars with crewmates instance 1', 24, true);  
objectPlayAnimation('yellowcoti', 'yellowcoti', true)
addLuaSprite('yellowcoti', false);
scaleLuaSprite('yellowcoti', 1, 1);

makeLuaSprite('backbars', 'Stages/MiraGrn/Reactor/backbars', 400 + OffSetX, 575 + OffSetY);
setScrollFactor('backbars', 1, 1);
scaleLuaSprite('backbars', 1.25, 1.25);
addLuaSprite('backbars', false);

makeLuaSprite('backbars2', 'Stages/MiraGrn/Reactor/backbars', 900*2.5 + OffSetX, 575 + OffSetY);
setScrollFactor('backbars2', 1, 1);
scaleLuaSprite('backbars2', 1.25, 1.25);
addLuaSprite('backbars2', false);
setProperty('backbars2.flipX', true) 

makeAnimatedLuaSprite('browngeoff', 'Stages/MiraGrn/Reactor/browngeoff', 450 + OffSetX, 950 + OffSetY);
addAnimationByPrefix('browngeoff', 'browngeoff', 'Pillars with crewmates instance 1', 24, true);  
objectPlayAnimation('browngeoff', 'browngeoff', true)
addLuaSprite('browngeoff', false);
scaleLuaSprite('browngeoff', 1, 1);

makeAnimatedLuaSprite('yeahman', 'Stages/MiraGrn/Reactor/yeahman', 700, 200);
addAnimationByPrefix('yeahman', 'yeahman', 'Reactor Overlay Top instance ', 24, true);  
objectPlayAnimation('yeahman', 'yeahman', true)
addLuaSprite('yeahman', true);
scaleLuaSprite('yeahman', 2, 2);
end

function onCreatePost()
setProperty('dad.scale.x', 1.2)
setProperty('dad.scale.y', 1.2) 
updateHitbox('dad')
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
    if curBeat == 64 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 1450
        yy = 1150
        xx2 = 1950
        yy2 = 1150
    end
    if curBeat == 128 then
        setProperty('defaultCamZoom',0.7)
		followchars = true
        xx = 1725
        yy = 1100
        xx2 = 1725
        yy2 = 1100
    end
    if curBeat == 192 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 1450
        yy = 1150
        xx2 = 1950
        yy2 = 1150
    end
    if curBeat == 224 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 1725
        yy = 1100
        xx2 = 1725
        yy2 = 1100
    end
    if curBeat == 256 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 1450
        yy = 1150
        xx2 = 1950
        yy2 = 1150
    end
    if curBeat == 320 then
        setProperty('defaultCamZoom',0.7)
		followchars = true
        xx = 1725
        yy = 1100
        xx2 = 1725
        yy2 = 1100
    end
    if curBeat == 384 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 1450
        yy = 1150
        xx2 = 1950
        yy2 = 1150
    end
    if curBeat == 479 then
        setProperty('defaultCamZoom',0.9)
		followchars = true
        xx = 1725
        yy = 1200
        xx2 = 1725
        yy2 = 1200
    end
    if curBeat == 544 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 1725
        yy = 1100
        xx2 = 1725
        yy2 = 1100
    end
    if curBeat == 608 then
        setProperty('defaultCamZoom',0.9)
		followchars = true
        xx = 1725
        yy = 1200
        xx2 = 1725
        yy2 = 1200
    end
    if curBeat == 672 then
        setProperty('defaultCamZoom',0.7)
		followchars = true
        xx = 1725
        yy = 1100
        xx2 = 1725
        yy2 = 1100
    end

    
end

