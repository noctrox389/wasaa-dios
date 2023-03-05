
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx =  275;
local yy =  550;
local xx2 = 275;
local yy2 = 550;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;


function onCreate()
makeLuaSprite('sky', 'Stages/MiraGrn/Ejected/sky', -1500, -800);
setScrollFactor('sky', 0.8, 0.8);
scaleLuaSprite('sky', 1* 1.6, 1.05* 1.6);
addLuaSprite('sky', false);

makeLuaSprite('Builds', 'Stages/MiraGrn/Ejected/Builds', -1150, -800);
setScrollFactor('Builds', 1, 1);
scaleLuaSprite('Builds', 8, 8);
addLuaSprite('Builds', false);

BuildsH = getProperty("Builds.height")    

makeLuaSprite('Builds2', 'Stages/MiraGrn/Ejected/Builds', -1150, BuildsH-100);
setScrollFactor('Builds2', 1, 1);
scaleLuaSprite('Builds2', 8, 8);
addLuaSprite('Builds2', false);

makeLuaSprite('nube1', 'Stages/MiraGrn/Ejected/Nubes/n1', -1800, 1600);
setScrollFactor('nube1', 1, 1);
scaleLuaSprite('nube1', 2, 2);
addLuaSprite('nube1', true);

makeLuaSprite('nube2', 'Stages/MiraGrn/Ejected/Nubes/n2', 0, 1600);
setScrollFactor('nube2', 1, 1);
scaleLuaSprite('nube2', 2, 2);
addLuaSprite('nube2', true);

makeLuaSprite('nube3', 'Stages/MiraGrn/Ejected/Nubes/n3', 0, 1600);
setScrollFactor('nube3', 1, 1);
scaleLuaSprite('nube3', 2, 2);
addLuaSprite('nube3', true);

makeLuaSprite('nube4', 'Stages/MiraGrn/Ejected/Nubes/n4', 0, 1600);
setScrollFactor('nube4', 1, 1);
scaleLuaSprite('nube4', 2, 2);
addLuaSprite('nube4', true);

makeLuaSprite('speedLines', 'Stages/MiraGrn/Ejected/speedLines', -1050, -700);
setScrollFactor('speedLines', 1, 1);
scaleLuaSprite('speedLines', 4, 4.5);
addLuaSprite('speedLines', true);

speedLinesH = getProperty("speedLines.height")    

makeLuaSprite('speedLines2', 'Stages/MiraGrn/Ejected/speedLines', -1020, speedLinesH-100);
setScrollFactor('speedLines2', 1, 1);
scaleLuaSprite('speedLines2', 4, 4.5);
addLuaSprite('speedLines2', true);

doTweenY("BuildsT1", "Builds", getProperty('Builds.y')-BuildsH-20, 1.5, "linear")  
doTweenY("Builds2T1", "Builds2", getProperty('Builds2.y')-BuildsH-170, 1.5, "linear") 

doTweenY("speedLinesT1", "speedLines", getProperty('speedLines.y')-speedLinesH-20, 0.5, "linear")  
doTweenY("speedLines2T1", "speedLines2", getProperty('speedLines2.y')-speedLinesH-170, 0.5, "linear") 

doTweenY("XDY", "camHUD", getProperty('camHUD.y')-20, 1, 'sineIn') 
doTweenAngle('XD', 'camHUD', -2, 1, 'backIn'); 
end

function onBeatHit()
if curBeat % 6 == 0 then
CurNube = 'nube'..getRandomInt(1, 4)
doTweenY('nubeT', CurNube, -5000, 0.6, "linear")  
end
end 


function onTweenCompleted(tag)  
if tag == "nubeT" then    
setProperty('nube1.y', 1600)    
setProperty('nube2.y', 1600)    
setProperty('nube3.y', 1600)    
setProperty('nube4.y', 1600)   

setProperty('nube1.x', getRandomFloat(-1800, 400))    
setProperty('nube2.x', getRandomFloat(-1800, 400))    
setProperty('nube3.x', getRandomFloat(-1800, 400))    
setProperty('nube4.x', getRandomFloat(-1800, 400))    
elseif tag == 'XD' then
doTweenY("XDY", "camHUD", getProperty('camHUD.y')+20, 1, 'sineIn') 
doTweenAngle('XD2', 'camHUD', 2, 1, 'backIn');   
elseif tag == 'XD2' then
doTweenY("XDY", "camHUD", getProperty('camHUD.y')-20, 1, 'sineIn')    
doTweenAngle('XD', 'camHUD', -2, 1, 'backIn');   
end
if tag == "BuildsT1" then    
setProperty("Builds.y", -800)    
setProperty("Builds2.y", BuildsH-100)


doTweenY("BuildsT1", "Builds", getProperty('Builds.y')-BuildsH-20, 1.5, "linear")  
doTweenY("Builds2T1", "Builds2", getProperty('Builds2.y')-BuildsH-170, 1.5, "linear") 
end
if tag == "speedLinesT1" then    
setProperty("speedLines.y", -700)    
setProperty("speedLines2.y", BuildsH-100)

doTweenY("speedLinesT1", "speedLines", getProperty('speedLines.y')-speedLinesH-20, 0.5, "linear")  
doTweenY("speedLines2T1", "speedLines2", getProperty('speedLines2.y')-speedLinesH-170, 0.5, "linear") 
end
end

function onCreatePost()
setProperty('dad.scale.x', 2.6 * 2)
setProperty('dad.scale.y', 2.6 * 2)
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
            setProperty('defaultCamZoom', 0.35)
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

            setProperty('defaultCamZoom', 0.35)
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

