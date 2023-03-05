local xx = 500
local yy = 600
local xx2 = 1000

function onCreate()

	makeLuaSprite('roomcodebg', 'Stages/Polus/roomcodebg', -350, -20);
	scaleObject('roomcodebg', 1.1, 1);
	setScrollFactor('roomcodebg', 1, 1);
	setProperty('roomcodebg.antialiasing', true);
	setObjectOrder('roomcodebg', 1);
end

function onCountdownStarted()
setProperty('dad.scale.y', 1.1)
end

function onUpdate()
    if mustHitSection == false then
		triggerEvent('Camera Follow Pos',xx,yy)
	else
		triggerEvent('Camera Follow Pos',xx2,yy)
	end
end

