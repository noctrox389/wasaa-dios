
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 1200;
local yy = 500;
local xx2 = 1400;
local yy2 = 500;
local ofs = 10;
local followchars = true;
local del = 0;
local del2 = 0;


function onCreate()
	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 0);

	makeLuaSprite('Back Wall Kitchen', 'Stages/chef/Back Wall Kitchen', 10, -317);
	scaleObject('Back Wall Kitchen', 1, 1);
	setScrollFactor('Back Wall Kitchen', 1, 1);
	setProperty('Back Wall Kitchen.antialiasing', true);
	setObjectOrder('Back Wall Kitchen', 1);

	makeLuaSprite('Chef Floor', 'Stages/chef/Chef Floor', -663, 689);
	scaleObject('Chef Floor', 1, 1);
	setScrollFactor('Chef Floor', 1, 1);
	setProperty('Chef Floor.antialiasing', false);
	setObjectOrder('Chef Floor', 2);

	makeLuaSprite('oven', 'Stages/chef/oven', 1710, 47);
	scaleObject('oven', 1, 1);
	setScrollFactor('oven', 1, 1);
	setProperty('oven.antialiasing', true);
	setObjectOrder('oven', 3);

	makeLuaSprite('Back Table Kitchen', 'Stages/chef/Back Table Kitchen', -183, -213);
	scaleObject('Back Table Kitchen', 1, 1);
	setScrollFactor('Back Table Kitchen', 1, 1);
	setProperty('Back Table Kitchen.antialiasing', true);
	setObjectOrder('Back Table Kitchen', 4);

	makeAnimatedLuaSprite('Boppers2', 'Stages/chef/Boppers2', 880, 243);
	scaleObject('Boppers2', 1, 1);
	addAnimationByPrefix('Boppers2', '', '', 24, true);
	setScrollFactor('Boppers2', 1, 1);
	setProperty('Boppers2.antialiasing', true);
	setObjectOrder('Boppers2', 5);

	makeAnimatedLuaSprite('Boppers', 'Stages/chef/Boppers', 1283, 233);
	scaleObject('Boppers', 1, 1);
	addAnimationByPrefix('Boppers', '', '', 24, true);
	setScrollFactor('Boppers', 1, 1);
	setProperty('Boppers.antialiasing', true);
	setObjectOrder('Boppers', 6);

	makeLuaSprite('Kitchen Counter', 'Stages/chef/Kitchen Counter', 797, 416);
	scaleObject('Kitchen Counter', 1, 1);
	setScrollFactor('Kitchen Counter', 1, 1);
	setProperty('Kitchen Counter.antialiasing', true);
	setObjectOrder('Kitchen Counter', 7);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 8);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 9);

	makeLuaSprite('black_overhead_shadow', 'Stages/chef/black_overhead_shadow', -190, -520);
	scaleObject('black_overhead_shadow', 2, 2);
	setScrollFactor('black_overhead_shadow', 1, 1);
	setProperty('black_overhead_shadow.antialiasing', true);
	setObjectOrder('black_overhead_shadow', 10);

	makeLuaSprite('bluelight', 'Stages/chef/bluelight', -146.67, -430.33);
	scaleObject('bluelight', 2, 2);
	setScrollFactor('bluelight', 1, 1);
	setProperty('bluelight.antialiasing', true);
	setObjectOrder('bluelight', 11);
end


function onUpdate()
	setProperty('gf.alpha', 0);
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.8)
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

            setProperty('defaultCamZoom',0.8)
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

	if curStep >= 171 and curStep < 176 then
		setProperty('defaultCamZoom',1)
	end

    if curBeat == 44 then
        setProperty('defaultCamZoom', 0.8)
    end

    if curBeat == 112 then
		setProperty('defaultCamZoom',0.9)
		xx = 1180;
		yy = 820-300;
	end

	if curBeat == 113 then
		setProperty('defaultCamZoom',1)
		xx = 1160;
		yy = 840-300;
	end

	if curBeat == 114 then
		setProperty('defaultCamZoom',1.1)
		xx = 1140;
		yy = 860-300;
	end

	if curBeat == 115 then
		setProperty('defaultCamZoom',1.2)
		xx = 1120;
		yy = 880-300;
	end

	if curBeat == 116 then
		setProperty('defaultCamZoom',0.8)
		xx = 1200;
		yy = 800-300;
	end

	if curStep == 206 or curStep == 207 then
		setProperty('defaultCamZoom',1)
	end

	if curStep >= 399 and curStep < 404 then
		setProperty('defaultCamZoom',1)
	end

	if curStep == 404 then
		setProperty('defaultCamZoom',0.8)
	end

	if curStep == 1172 then
		setProperty('defaultCamZoom', 0.8)
	end

	if curStep >= 1164 and curStep < 1172 then
		setProperty('defaultCamZoom',1)
	end

	if curStep == 1172 then
		setProperty('defaultCamZoom',0.8)
	end

	if curBeat == 304 then
		setProperty('defaultCamZoom',0.9)
		xx = 1180;
		yy = 820-300;
	end

	if curBeat == 305 then
		setProperty('defaultCamZoom',1)
		xx = 1160;
		yy = 840-300;
	end

	if curBeat == 306 then
		setProperty('defaultCamZoom',1.1)
		xx = 1140;
		yy = 860-300;
	end

	if curBeat == 307 then
		setProperty('defaultCamZoom',1.2)
		xx = 1120;
		yy = 880-300;
	end

	if curBeat == 308 then
		setProperty('defaultCamZoom',0.8)
		xx = 1200;
		yy = 800-300;
	end

	if curBeat == 320 then
		setProperty('defaultCamZoom',0.9)
		xx = 1180;
		yy = 820-300;
	end

	if curBeat == 321 then
		setProperty('defaultCamZoom',1)
		xx = 1160;
		yy = 840-300;
	end

	if curBeat == 322 then
		setProperty('defaultCamZoom',1.1)
		xx = 1140;
		yy = 860-300;
	end

	if curBeat == 323 then
		setProperty('defaultCamZoom',1.2)
		xx = 1120;
		yy = 880-300;
	end

	if curBeat >= 324 then
		setProperty('defaultCamZoom',0.7)
		followchars = false
		triggerEvent('Camera Follow Pos', 1300, 700-300)
	end
    
end

