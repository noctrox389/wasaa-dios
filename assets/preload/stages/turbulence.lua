local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 1200;
local yy = 500;
local xx2 = 1750.95;
local yy2 = 900;
local ofs = 50;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	makeLuaSprite('turbsky', 'Stages/Airship/WJ/turbulence/turbsky', -995, -895);
	scaleObject('turbsky', 2, 2);
	setScrollFactor('turbsky', 0.6, 0.6);
	setProperty('turbsky.antialiasing', true);
	setObjectOrder('turbsky', 0);

	makeLuaSprite('backclouds', 'Stages/Airship/WJ/turbulence/backclouds', 1115, 75);
	scaleObject('backclouds', 1, 1);
	setScrollFactor('backclouds', 0.7, 0.7);
	setProperty('backclouds.antialiasing', true);
	setObjectOrder('backclouds', 1);

	makeLuaSprite('hotairballoon', 'Stages/Airship/WJ/turbulence/hotairballoon', 1115, 75);
	scaleObject('hotairballoon', 1, 1);
	setScrollFactor('hotairballoon', 0.8, 0.8);
	setProperty('hotairballoon.antialiasing', true);
	setObjectOrder('hotairballoon', 2);

	makeLuaSprite('midclouds', 'Stages/Airship/WJ/turbulence/midclouds', -410, -110);
	scaleObject('midclouds', 2, 2);
	setScrollFactor('midclouds', 0.9, 0.9);
	setProperty('midclouds.antialiasing', true);
	setObjectOrder('midclouds', 3);

	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 4);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 5);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 6);

	makeLuaSprite('clawback', 'Stages/Airship/WJ/turbulence/clawback', -930, 690);
	scaleObject('clawback', 1, 1);
	setScrollFactor('clawback', 1, 1);
	setProperty('clawback.antialiasing', true);
	setObjectOrder('clawback', 7);

	makeAnimatedLuaSprite('clawfront', 'Stages/Airship/WJ/turbulence/clawfront', 1780, 490);
	scaleObject('clawfront', 1, 1);
	addAnimationByPrefix('clawfront', '', '', 24, true);
	setScrollFactor('clawfront', 1, 1);
	setProperty('clawfront.antialiasing', true);
	setObjectOrder('clawfront', 8);

	makeLuaSprite('frontclouds', 'Stages/Airship/WJ/turbulence/frontclouds', -200, 818);
	scaleObject('frontclouds', 2, 2);
	setScrollFactor('frontclouds', 1.1, 1.1);
	setProperty('frontclouds.antialiasing', true);
	setObjectOrder('frontclouds', 9);
    AAA = getProperty("frontclouds.width")

	makeLuaSprite('front2', 'Stages/Airship/WJ/turbulence/frontclouds', -987-AAA, 820);
	scaleObject('front2', 2, 2);
	setScrollFactor('front2', 1.1, 1.1);
	setProperty('front2.antialiasing', true);
	setObjectOrder('front2', 10);

doTweenX("frontclouds", "frontclouds", getProperty('frontclouds.x')+AAA, 3, "linear")  
doTweenX("front2", "front2", getProperty('front2.x')+AAA, 3, "linear") 

setProperty("midclouds.x", -4000) 
doTweenX("midclouds", "midclouds", getProperty('midclouds.x')+7000, 7, "linear") 

setProperty("backclouds.x", -7000) 
doTweenX("backclouds", "backclouds", getProperty('backclouds.x')+10000, 15, "linear") 

setProperty("frontclouds.x", -987)   
setProperty("front2.x", -987-AAA)

setProperty("hotairballoon.x", -7000) 
doTweenX("hotairballoon", "hotairballoon", getProperty('hotairballoon.x')+10000, 12, "linear") 
end

function onTweenCompleted(tag)  
if tag == "frontclouds" then 
setProperty("frontclouds.x", -987)   
setProperty("front2.x", -987-AAA)

doTweenX("frontclouds", "frontclouds", getProperty('frontclouds.x')+AAA, 3, "linear")  
doTweenX("front2", "front2", getProperty('front2.x')+AAA, 3, "linear") 
end
if tag == "midclouds" then 
setProperty("midclouds.x", -4000) 
doTweenX("midclouds", "midclouds", getProperty('midclouds.x')+7000, 7, "linear") 
end
if tag == "backclouds" then 
setProperty("backclouds.x", -7000) 
doTweenX("backclouds", "backclouds", getProperty('backclouds.x')+10000, 15, "linear") 
end
if tag == "hotairballoon" then 
setProperty("hotairballoon.x", -7000) 
doTweenX("hotairballoon", "hotairballoon", getProperty('hotairballoon.x')+10000, 12, "linear") 
end
end

function onCreatePost()

setProperty('dad.scale.x', 2.2)
setProperty('dad.scale.y', 2.2) 

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
            setProperty('defaultCamZoom',0.6)
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

            setProperty('defaultCamZoom',0.6)
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
end