function onCreate()
makeLuaSprite('HOTASS', 'Stages/Polus/HOTASS', -600, -200);
setScrollFactor('HOTASS', 1, 1);
scaleLuaSprite('HOTASS', 1, 1);
addLuaSprite('HOTASS', false);
end

function onSongStart()
for i = 0, getProperty('opponentStrums.length') - 1 do
setPropertyFromGroup('opponentStrums', i, 'visible', false);
local strum = 'dadStrum' .. i;
local dir = 'LEFT';
if i == 1 then
dir = 'DOWN';
elseif i == 2 then
dir = 'UP'
elseif i == 3 then
dir = 'RIGHT';
end
makeAnimatedLuaSprite(strum, getPropertyFromGroup('opponentStrums', i, 'texture'),
getPropertyFromGroup('opponentStrums', i, 'x'), getPropertyFromGroup('opponentStrums', i, 'y'));
addAnimationByPrefix(strum, 'static', 'arrow' .. dir);
scaleObject(strum, getPropertyFromGroup('opponentStrums', i, 'scale.x'),
getPropertyFromGroup('opponentStrums', i, 'scale.y'));
setObjectCamera(strum, 'hud');
addLuaSprite(strum);
objectPlayAnimation(strum, 'static');
setProperty('grpNoteSplashes.visible', false)
end
end

function onUpdatePost(elasped)
for i = 0, getProperty('opponentStrums.length') - 1 do
local strum = 'dadStrum' .. i;
setProperty(strum .. '.x', getPropertyFromGroup('opponentStrums', i, 'x'));
setProperty(strum .. '.y', getPropertyFromGroup('opponentStrums', i, 'y'));
setProperty(strum .. '.angle', getPropertyFromGroup('opponentStrums', i, 'angle'));
setProperty(strum .. '.alpha', getPropertyFromGroup('opponentStrums', i, 'alpha'));
end
end