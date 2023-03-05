local PermitirParticulas = true

function onUpdate(elapsed)
if PermitirParticulas == true then
	particleThink();
end
end

function onCountdownStarted()
PermitirParticulas = true
spawnParticles();
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'particleSpawn' and PermitirParticulas == true then
		particleTimer();
	end

	if tag == 'particleSpawnFRONT' and PermitirParticulas == true then
		particleTimerFront();
	end
end

-- particle logic
particleCount = 0;
particleLimit = 10;
particleTime = 3.5;

function spawnParticles()
for i = 1, particleLimit do
tag = ('pixelParticle'..i);
makeAnimatedLuaSprite(tag, 'Stages/Polus/NewUnTrans/ember', 800, 850);
addAnimationByPrefix(tag, 'ember', 'ember', 24, true);  
objectPlayAnimation(tag, 'ember', true)
scaleLuaSprite(tag, 1.1, 1.1);
addLuaSprite(tag, false);
setBlendMode(tag, 'add');
end
runTimer('particleSpawn', 0.1, 0);

	for i = 1, particleLimit do
tag = ('pixelParticlefront'..i);
makeAnimatedLuaSprite(tag, 'Stages/Polus/NewUnTrans/ember', 800, 850);
addAnimationByPrefix(tag, 'ember', 'ember', 24, true);  
objectPlayAnimation(tag, 'ember', true)
scaleLuaSprite(tag, 1.1, 1.1);
addLuaSprite(tag, true);
setBlendMode(tag, 'add');
	end
	runTimer('particleSpawnFRONT', 0.2, 0);
end

function particleTimer()
	particleCount = particleCount + 1;
	if particleCount > particleLimit then
		particleCount = 1;
	end

	tag = ('pixelParticle'..particleCount);
	setProperty(tag..'.scale.x', getRandomFloat(1000, 1200) / 1000);
	setProperty(tag..'.x', getRandomFloat(500, 2800));
	velX = getRandomFloat(-50, 50);
	setProperty(tag..'.velocity.x', velX);
	setProperty(tag..'.scale.y', getRandomFloat(1000, 1200) / 1000);
	setProperty(tag..'.y', getRandomFloat(100, 1000));
	setProperty(tag..'.velocity.y', getRandomFloat(-75, -150));
	setProperty(tag..'.alpha', 1);

	doTweenAlpha(tag..'AlphaTween', tag, 0, particleTime, 'linear');
	doTweenX(tag..'ScaleX', tag..'.scale', 0, particleTime, 'linear');
	doTweenY(tag..'ScaleY', tag..'.scale', 0, particleTime, 'linear');
	doTweenX(tag..'SpeedX', tag..'.velocity', velX * -0.75, particleTime/2, 'linear');
end

function particleTimerFront()
	particleCount = particleCount + 1;
	if particleCount > particleLimit then
		particleCount = 1;
	end

	tag = ('pixelParticlefront'..particleCount);
	setProperty(tag..'.scale.x', getRandomFloat(1000, 1200) / 300);
	setProperty(tag..'.x', getRandomFloat(700, 3000));
	velX = getRandomFloat(-50, 50);
	setProperty(tag..'.velocity.x', velX);
	setProperty(tag..'.scale.y', getRandomFloat(1000, 1200) / 300);
	setProperty(tag..'.y', getRandomFloat(300, 1200));
	setProperty(tag..'.velocity.y', getRandomFloat(-75, -150));
	setProperty(tag..'.alpha', 1);

	doTweenAlpha(tag..'AlphaTween', tag, 0, particleTime, 'linear');
	doTweenX(tag..'ScaleX', tag..'.scale', 0, particleTime, 'linear');
	doTweenY(tag..'ScaleY', tag..'.scale', 0, particleTime, 'linear');
	doTweenX(tag..'SpeedX', tag..'.velocity', velX * -0.75, particleTime/2, 'linear');
end