function onCreate()
makeLuaSprite('whitebg', 'Stages/infikill/whitebg', -600, -300);
setScrollFactor('whitebg', 1, 1);
scaleLuaSprite('whitebg', 2, 2);
addLuaSprite('whitebg', false);

makeLuaSprite('mountains', 'Stages/infikill/mountains', -200, -300);
setScrollFactor('mountains', 1, 1);
scaleLuaSprite('mountains', 1, 1);
addLuaSprite('mountains', false);

makeAnimatedLuaSprite('house', 'Stages/infikill/house', 300, -300);
addAnimationByPrefix('house', 'house', 'housescaled', 24, true);  
objectPlayAnimation('house', 'house', true)
addLuaSprite('house', false);
scaleLuaSprite('house', 2.2, 2);

makeLuaSprite('base', 'Stages/infikill/base', -170, 400);
setScrollFactor('base', 1, 1);
scaleLuaSprite('base', 1, 1);
addLuaSprite('base', false);


end