
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx =  500;
local yy =  475;
local xx2 = 900;
local yy2 = 475;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;


function onCreate()
makeLuaSprite('mirabg', 'Stages/MiraGrn/mirabg', -90, 50);
setScrollFactor('mirabg', 1, 1);
scaleLuaSprite('mirabg', 1 * 1.5, 1 * 1.5);
addLuaSprite('mirabg', false);

if songName == 'Lights-Down' then
addCharacterToList('whitegreen', 'dad')
addCharacterToList('whitebf', 'boyfriend') 

makeAnimatedLuaSprite('bf_mira_vent', 'Stages/MiraGrn/bf_mira_vent', 50, 140);
addAnimationByPrefix('bf_mira_vent', 'bf_mira_vent', 'bf vent', 24, false);  
scaleLuaSprite('bf_mira_vent', 1, 1);
addLuaSprite('bf_mira_vent', false);
setProperty('bf_mira_vent.visible', false)

makeAnimatedLuaSprite('stereo_taken', 'Stages/MiraGrn/stereo_taken', defaultGirlfriendX, defaultGirlfriendY+300);
addAnimationByPrefix('stereo_taken', 'stereo_taken', 'stereo boom', 24, false);  
scaleLuaSprite('stereo_taken', 1, 1);
addLuaSprite('stereo_taken', false);
setProperty('stereo_taken.visible', false)
setObjectOrder('stereo_taken', getObjectOrder('gfGroup'))
else
makeAnimatedLuaSprite('cyan_toogus', 'Stages/MiraGrn/cyan_toogus', -1000, 300);
addAnimationByPrefix('cyan_toogus', 'cyan_toogus', 'Cyan Dancy', 24, false);  
scaleLuaSprite('cyan_toogus', 1.75, 1.75);
addLuaSprite('cyan_toogus', true);
end

makeLuaSprite('mirafg', 'Stages/MiraGrn/mirafg', -475, 65);
setScrollFactor('mirafg', 1, 1);
scaleLuaSprite('mirafg', 1* 1.5, 1.05* 1.5);
addLuaSprite('mirafg', false);

makeLuaSprite('table_bg', 'Stages/MiraGrn/table_bg', -375, 400);
setScrollFactor('table_bg', 1, 1);
scaleLuaSprite('table_bg', 1* 1.5, 1* 1.5);
addLuaSprite('table_bg', false);

end

function onCreatePost()
if songName == 'Lights-Down' then
setProperty('dad.scale.x', 1.5)
setProperty('dad.scale.y', 1.5) 
else
setProperty('dad.scale.x', 1.3)
setProperty('dad.scale.y', 1.3) 
end
end

function onCountdownStarted()
if songName == 'Lights-Down' then
doTweenColor('scoreTxt', 'scoreTxt', '00771B', 0.5, 'linear');
else
doTweenAlpha('camHUD', 'camHUD', 0, 0.01, 'linear')
doTweenColor('scoreTxt', 'scoreTxt', '00771B', 0.5, 'linear');
end
end

function onEvent(name,value1,value2)
if name == 'Lights out' then
cameraFlash('camGame', 'FFFFFF', '0.5')

triggerEvent('Change Character', 'dad', 'whitegreen');
triggerEvent('Change Character', 'boyfriend', 'whitebf');

setProperty('mirabg.visible', false)
setProperty('mirafg.visible', false)
setProperty('table_bg.visible', false)
setProperty('gf.visible', false) 

setProperty('dad.scale.x', 1.5)
setProperty('dad.scale.y', 1.5) 
updateHitbox('dad')
end
if name == 'Lights on' then
cameraFlash('camGame', '000000', '0.5')

triggerEvent('Change Character', 'dad', 'impostor3');
triggerEvent('Change Character', 'boyfriend', 'bf');

setProperty('mirabg.visible', true)
setProperty('mirafg.visible', true)
setProperty('table_bg.visible', true)
setProperty('gf.visible', true) 

setProperty('dad.scale.x', 1.5)
setProperty('dad.scale.y', 1.5) 
updateHitbox('dad')
end
if name == 'Lights on Ending' then
doTweenAlpha('camHUD', 'camHUD', 0, 0.01, 'linear')

triggerEvent('Change Character', 'dad', 'impostor3');

setProperty('mirabg.visible', true)
setProperty('mirafg.visible', true)
setProperty('table_bg.visible', true)
setProperty('gf.visible', false) 
setProperty('boyfriend.visible', false) 

setProperty('dad.scale.x', 1.5)
setProperty('dad.scale.y', 1.5) 

triggerEvent('Play Animation', 'liveReaction', 'dad')

setProperty('bf_mira_vent.visible', true)
objectPlayAnimation('bf_mira_vent', 'bf_mira_vent', true)

setProperty('stereo_taken.visible', true)
objectPlayAnimation('stereo_taken', 'stereo_taken', true)
end
if name == 'Lights Down OFF' then
doTweenAlpha('camGame', 'camGame', 0, 0.01, 'linear')
end
if name == 'Asbel' then
if value1 == 'sax' then
doTweenAlpha('camHUD', 'camHUD', 0, 0.5, 'linear')
objectPlayAnimation('cyan_toogus', 'cyan_toogus', true)
doTweenX("cyan_toogus", "cyan_toogus", getProperty('cyan_toogus.x')+2600, 14, "linear")  
end 
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
            setProperty('defaultCamZoom',0.9)
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

            setProperty('defaultCamZoom',0.9)
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

