
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 1270;
local yy = 850;
local xx2 = 1270;
local yy2 = 850;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
addCharacterToList('blackTT', 'dad')
addCharacterToList('ghost', 'dad')
addCharacterToList('maroon', 'dad')

addCharacterToList('bf-tt', 'boyfriend') 
addCharacterToList('bf-defeat-scared', 'boyfriend') 

makeLuaSprite('ttv4', 'Stages/TT/ttv4', 30, 200);
setScrollFactor('ttv4', 1, 1);
scaleLuaSprite('ttv4', 1, 1);
addLuaSprite('ttv4', false);

makeLuaSprite('ttv4fg', 'Stages/TT/ttv4fg', 50, 125);
setScrollFactor('ttv4fg', 1, 1);
scaleLuaSprite('ttv4fg', 1.28, 1.25);
addLuaSprite('ttv4fg', false);

makeLuaSprite('ttv4fg', 'Stages/TT/ttv4fg', 50, 125);
setScrollFactor('ttv4fg', 1, 1);
scaleLuaSprite('ttv4fg', 1.28, 1.25);
addLuaSprite('ttv4fg', false);

makeLuaSprite('overlay', 'Stages/TT/overlay', 50, -250);
setScrollFactor('overlay', 1, 1);
scaleLuaSprite('overlay', 1, 1.4);
addLuaSprite('overlay', true);
setGraphicSize('overlay', getProperty('ttv4fg.width'))
setProperty('overlay.alpha',  0.5) 
setBlendMode('overlay', 'multiply')

setProperty('defaultCamZoom',0.7)
end


function onEvent(n, v1, v2)
if n == "Change Character" then
if v2 == 'maroonP' then
cameraFlash('camGame', 'FFFFFF', 0.2)
triggerEvent('Change Character', 'bf', 'bf-tt');
end
end
if n == "Asbel" then
if v1 == 'grey' then
cameraFlash('camGame', 'FFFFFF', 0.2)
triggerEvent('Change Character', 'bf', 'bf-defeat-scared');
triggerEvent('Change Character', 'dad', 'ghost');
elseif v1 == 'maroon' then
cameraFlash('camGame', 'FFFFFF', 0.2)
triggerEvent('Change Character', 'dad', 'maroon');
triggerEvent('Change Character', 'bf', 'bf-defeat-scared');
elseif v1 == 'black' then
cameraFlash('camGame', 'FFFFFF', 0.2)
triggerEvent('Change Character', 'bf', 'bf-tt');
triggerEvent('Change Character', 'dad', 'blackTT');
setProperty("dad.x", defaultOpponentX+400)   
setProperty("dad.y", defaultOpponentY+400)   
end
end
end