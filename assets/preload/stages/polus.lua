
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx =  470;
local yy =  250;
local xx2 = 820;
local yy2 = 250;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;


function onCreate()
makeLuaSprite('polus_custom_sky', 'Stages/Polus/polus_custom_sky', -500, -500);
setScrollFactor('polus_custom_sky', 0.6, 0.6);
scaleLuaSprite('polus_custom_sky', 2, 2);
addLuaSprite('polus_custom_sky', false);

makeLuaSprite('polusrocks', 'Stages/Polus/polusrocks', -550, -300);
setScrollFactor('polusrocks', 0.7, 0.7);
scaleLuaSprite('polusrocks', 2, 2);
addLuaSprite('polusrocks', false);

makeLuaSprite('polusHills', 'Stages/Polus/polusHills', -1000, -150);
setScrollFactor('polusHills', 0.8, 0.8);
scaleLuaSprite('polusHills', 1, 1);
addLuaSprite('polusHills', false);

makeLuaSprite('polus_custom_lab', 'Stages/Polus/polus_custom_lab', 0, -400);
setScrollFactor('polus_custom_lab', 1, 1);
scaleLuaSprite('polus_custom_lab', 1, 1);
addLuaSprite('polus_custom_lab', false);

makeLuaSprite('polus_custom_floor', 'Stages/Polus/polus_custom_floor', -780, 380);
setScrollFactor('polus_custom_floor', 1, 1);
scaleLuaSprite('polus_custom_floor', 1, 1);
addLuaSprite('polus_custom_floor', false);
end

function onCountdownStarted()
if songName == 'Sabotage' then

makeAnimatedLuaSprite('speakerlonely', 'Stages/Polus/speakerlonely', getProperty('gf.x')+10, getProperty('gf.y') + 220)
addAnimationByPrefix('speakerlonely', 'idle', 'speakers lonely', 24, false); 
scaleLuaSprite('speakerlonely', 1.3, 1.3); 
addLuaSprite('speakerlonely', false);

setProperty('gf.scale.x', 1.25)
setProperty('gf.scale.y', 1.25) 

elseif songName == 'Meltdown' then

setProperty('gf.scale.x', 1.25)
setProperty('gf.scale.y', 1.25) 

makeAnimatedLuaSprite('speakerlonely', 'Stages/Polus/speakerlonely', getProperty('gf.x')-200, getProperty('gf.y') + 400)
addAnimationByPrefix('speakerlonely', 'idle', 'speakers lonely', 24, false); 
scaleLuaSprite('speakerlonely', 1.3, 1.3); 
addLuaSprite('speakerlonely', false);

makeAnimatedLuaSprite('boppers_meltdown', 'Stages/Polus/boppers_meltdown', -650, 250);
addAnimationByPrefix('boppers_meltdown', 'idle', 'BoppersMeltdown', 24, false); 
setScrollFactor('boppers_meltdown', 1.2, 1.2);
scaleLuaSprite('boppers_meltdown', 2.5, 2.5); 
addLuaSprite('boppers_meltdown', true);

makeLuaSprite('bfdead', 'Stages/Polus/bfdead', getProperty('boyfriend.x')-400, getProperty('boyfriend.y') + 335)
setScrollFactor('bfdead', 1, 1);
scaleLuaSprite('bfdead', 1, 1);
addLuaSprite('bfdead', false);
end

makeAnimatedLuaSprite('snow', 'Stages/Polus/snow', -500, -500);
addAnimationByPrefix('snow', 'idle', 'cum', 24, true); 
setScrollFactor('snow', 1, 1);
scaleLuaSprite('snow', 3, 3); 
addLuaSprite('snow', true);
objectPlayAnimation('snow', 'idle');

setProperty('defaultCamZoom', 0.75) 
end

function onBeatHit()
if curBeat % 2 == 0 then
objectPlayAnimation('speakerlonely', 'idle');
if songName == 'Meltdown' then
objectPlayAnimation('boppers_meltdown', 'idle');
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
            setProperty('defaultCamZoom',0.75)
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

            setProperty('defaultCamZoom',0.75)
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