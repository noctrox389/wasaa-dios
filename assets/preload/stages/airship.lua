
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 700;
local yy = -2000;
local xx2 = 1634.05;
local yy2 = -54.3;
local ofs = 50;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()

makeLuaSprite('sky', 'Stages/Airship/Danger/sky', -1300, -2500);
setScrollFactor('sky', 0.3, 0.3);
scaleLuaSprite('sky', 5, 4);
addLuaSprite('sky', false);

makeLuaSprite('farthestClouds', 'Stages/Airship/Danger/farthestClouds', -1300, -500);
setScrollFactor('farthestClouds', 0.4, 0.4);
scaleLuaSprite('farthestClouds', 5, 4);
addLuaSprite('farthestClouds', false);
farthestCloudsW = getProperty("farthestClouds.width")

makeLuaSprite('farthestClouds2', 'Stages/Airship/Danger/farthestClouds', farthestCloudsW-2600, -500);
setScrollFactor('farthestClouds2', 0.4, 0.4);
scaleLuaSprite('farthestClouds2', 5, 4);
addLuaSprite('farthestClouds2', false);

makeLuaSprite('backClouds', 'Stages/Airship/Danger/backClouds', -1000, -300);
setScrollFactor('backClouds', 0.6, 0.6);
scaleLuaSprite('backClouds', 5, 4);
addLuaSprite('backClouds', false);
backCloudsW = getProperty("backClouds.width")

makeLuaSprite('backClouds2', 'Stages/Airship/Danger/backClouds', farthestCloudsW-2000, -300);
setScrollFactor('backClouds2', 0.6, 0.6);
scaleLuaSprite('backClouds2', 5, 4);
addLuaSprite('backClouds2', false);

makeLuaSprite('airship', 'Stages/Airship/Danger/airship', 2000, -1000);
setScrollFactor('airship', 0.7, 0.7);
scaleLuaSprite('airship', 2, 1.1);
addLuaSprite('airship', false);

makeAnimatedLuaSprite('airshipFan', 'Stages/Airship/Danger/airshipFan', 3000, 0);
addAnimationByPrefix('airshipFan', 'airshipFan', 'ala avion instance ', 24, true);  
objectPlayAnimation('airshipFan', 'airshipFan', true)
setScrollFactor('frontClouds', 0.7, 0.7);
scaleLuaSprite('airshipFan', 3.5, 3.5);
addLuaSprite('airshipFan', false);

makeLuaSprite('bigCloud', 'Stages/Airship/Danger/bigCloud', 3000, -900);
setScrollFactor('bigCloud', 0.7, 0.7);
scaleLuaSprite('bigCloud', 2.1, 1);
addLuaSprite('bigCloud', false);

makeLuaSprite('frontClouds', 'Stages/Airship/Danger/frontClouds', -1200, 100);
setScrollFactor('frontClouds', 0.8, 0.8);
scaleLuaSprite('frontClouds', 4, 1.3);
addLuaSprite('frontClouds', false);

frontCloudsW = getProperty("frontClouds.width")  

makeLuaSprite('frontClouds2', 'Stages/Airship/Danger/frontClouds', frontCloudsW-2200, 100);
setScrollFactor('frontClouds2', 0.8, 0.8);
scaleLuaSprite('frontClouds2', 4, 1.3);
addLuaSprite('frontClouds2', false);

makeLuaSprite('fgPlatform', 'Stages/Airship/Danger/fgPlatform', -1200, 100);
setScrollFactor('fgPlatform', 1, 1);
scaleLuaSprite('fgPlatform', 4.3, 1.3);
addLuaSprite('fgPlatform', false);

fgPlatformW = getProperty("fgPlatform.width") 

makeLuaSprite('fgPlatform2', 'Stages/Airship/Danger/fgPlatform', fgPlatformW-2200, 100);
setScrollFactor('fgPlatform2', 1, 1);
scaleLuaSprite('fgPlatform2', 4.3, 1.3);
addLuaSprite('fgPlatform2', false); 

makeAnimatedLuaSprite('blacklegs', 'Stages/Airship/Danger/blacklegs', -50, 225);
addAnimationByPrefix('blacklegs', 'blacklegs', 'legs', 24, true);  
objectPlayAnimation('blacklegs', 'blacklegs', true)
addLuaSprite('blacklegs', false);
scaleLuaSprite('blacklegs', 1.3, 1.3);
setObjectOrder('blacklegs', getObjectOrder('gfGroup'))

makeAnimatedLuaSprite('bf_legs', 'Stages/Airship/Danger/bf_legs', 1460, 380);
addAnimationByPrefix('bf_legs', 'bf_legs', 'run legs', 24, true);  
objectPlayAnimation('bf_legs', 'bf_legs', true)
addLuaSprite('bf_legs', false);
scaleLuaSprite('bf_legs', 1, 1);
setObjectOrder('bf_legs', getObjectOrder('gfGroup'))
 

doTweenX("fgPlatformT1", "fgPlatform", getProperty('fgPlatform.x')-fgPlatformW, 1.75, "linear")  
doTweenX("fgPlatform2T1", "fgPlatform2", getProperty('fgPlatform2.x')-fgPlatformW, 1.75, "linear")  
setProperty("fgPlatform.x", -3200)   
setProperty("fgPlatform2.x", fgPlatformW-3740)

doTweenX("frontCloudsT1", "frontClouds", getProperty('frontClouds.x')-frontCloudsW, 10, "linear")  
doTweenX("frontClouds2T1", "frontClouds2", getProperty('frontClouds2.x')-frontCloudsW, 10, "linear")
setProperty("frontClouds.x", -3200)   
setProperty("frontClouds2.x", frontCloudsW-3200)

setProperty("farthestClouds.x", -1300)   
setProperty("farthestClouds2.x", farthestCloudsW-1300)
doTweenX("farthestCloudsT1", "farthestClouds", getProperty('farthestClouds.x')-farthestCloudsW, 40, "linear")  
doTweenX("farthestClouds2T1", "farthestClouds2", getProperty('farthestClouds2.x')-farthestCloudsW, 40, "linear")  


setProperty("backClouds.x", -1000)   
setProperty("backClouds2.x", farthestCloudsW-1000)
doTweenX("backCloudsT1", "backClouds", getProperty('backClouds.x')-backCloudsW, 20, "linear")  
doTweenX("backClouds2T1", "backClouds2", getProperty('backClouds2.x')-backCloudsW, 20, "linear")  

end

function onCreatePost()

setProperty('dad.scale.x', 2.6)
setProperty('dad.scale.y', 2.6) 
setProperty('dad.y',  getProperty('dad.y')+25)

setProperty('gf.scale.x', 1.5)
setProperty('gf.scale.y', 1.5) 

setProperty('healthbar.texture', 'healthBarFinaleBlue')
end

function onCountdownStarted()
    doTweenX("bigCloud", "bigCloud", getProperty('bigCloud.x')-8000, 75, "linear")
end

function onTweenCompleted(tag)  
if tag == "bigCloud" then 
setProperty("bigCloud.x", getProperty('bigCloud.x')+8000)   
doTweenX("bigCloud", "bigCloud", getProperty('bigCloud.x')-8000, 75, "linear")
end
if tag == "fgPlatformT1" then 
setProperty("fgPlatform.x", -3200)   
setProperty("fgPlatform2.x", fgPlatformW-3740)

doTweenX("fgPlatformT1", "fgPlatform", getProperty('fgPlatform.x')-fgPlatformW, 1.75, "linear")  
doTweenX("fgPlatform2T1", "fgPlatform2", getProperty('fgPlatform2.x')-fgPlatformW, 1.75, "linear")  
end
if tag == "frontCloudsT1" then 
setProperty("frontClouds.x", -3200)   
setProperty("frontClouds2.x", frontCloudsW-3200)

doTweenX("frontCloudsT1", "frontClouds", getProperty('frontClouds.x')-frontCloudsW, 10, "linear")  
doTweenX("frontClouds2T1", "frontClouds2", getProperty('frontClouds2.x')-frontCloudsW, 10, "linear")  
end
if tag == "farthestCloudsT1" then 
setProperty("farthestClouds.x", -1300)   
setProperty("farthestClouds2.x", farthestCloudsW-1300)

doTweenX("farthestCloudsT1", "farthestClouds", getProperty('farthestClouds.x')-farthestCloudsW, 40, "linear")  
doTweenX("farthestClouds2T1", "farthestClouds2", getProperty('farthestClouds2.x')-farthestCloudsW, 40, "linear")   
end
if tag == "backCloudsT1" then 
setProperty("backClouds.x", -1000)   
setProperty("backClouds2.x", farthestCloudsW-1000)
doTweenX("backCloudsT1", "backClouds", getProperty('backClouds.x')-backCloudsW, 20, "linear")  
doTweenX("backClouds2T1", "backClouds2", getProperty('backClouds2.x')-backCloudsW, 20, "linear")  
end
end

function onEvent(name,value1,value2)
if name == 'Change Character' then
setProperty('dad.scale.x', 2.6)
setProperty('dad.scale.y', 2.6) 
updateHitbox('dad')
end 
if name == 'bye gf' then
doTweenX("gf", "gf", getProperty('gf.x')-2500, 5, "linear")
end
end

function onUpdate(elapsed)
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
    if curStep == 1 then
        setProperty('defaultCamZoom',0.3)
		followchars = true
        xx = 1634.05
        yy = -54.3
        xx2 = 1634.05
        yy2 = -54.3
    end
    if curBeat == 64 then
        setProperty('defaultCamZoom', 0.4)
        followchars = true
        xx = 800
        yy = 150
        xx2 = 1200
        yy2 = 150
    end
    if curBeat == 96 then
        setProperty('defaultCamZoom', 0.6)
        followchars = true
        xx = 700
        yy = 150
        xx2 = 1200
        yy2 = 150
    end
    if curBeat == 128 then
        setProperty('defaultCamZoom', 0.4)
        xx = 800
        yy = 150
        xx2 = 1200
        yy2 = 150
    end
    if curBeat == 155 then
        setProperty('defaultCamZoom', 0.8)
        followchars = true
        xx = 450
        yy = 150
        xx2 = 450
        yy2 = 150
    end
    if curBeat == 160 then
        setProperty('defaultCamZoom', 0.4)
        followchars = true
        xx = 800
        yy = 150
        xx2 = 1200
        yy2 = 150
    end
    if curBeat == 192 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 700
        yy = 150
        xx2 = 1200
        yy2 = 150
    end
    if curBeat == 256 then
        setProperty('defaultCamZoom', 0.4)
        followchars = true
        xx = 800
        yy = 150
        xx2 = 1200
        yy2 = 150
    end
    if curBeat == 288 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 700
        yy = 150
        xx2 = 1200
        yy2 = 150
    end
    if curBeat == 320 then
        setProperty('defaultCamZoom', 0.3)
        followchars = true
        xx = 1634.05
        yy = -54.3
        xx2 = 1634.05
        yy2 = -54.3
    end
    if curBeat == 384 then
        setProperty('defaultCamZoom',0.6)
		followchars = true
        xx = 700
        yy = 150
        xx2 = 1200
        yy2 = 150
    end

    
end