local Shops = {'BFskinShop','GFskinShop','PetsskinShop'}
local Map = 'BF'
local BF = {'bfg', 'boyfriendHappy', 'RedPlayer', 'amongbf', 'GreenPlayer', 'BlackPlayer', 'bfsauce', 'stick-bf', 'bf', 'dripbf', 'susfriend', 'alien', 'bf-geoff', 'bfpolus', 'bfairship', 'bfmira', 'bfsusreal', 'picolobby'}
local Pets = {'ham','dog','frankenDog','crab','ufo','NoPet','miniCrewmate','chewmate','snowball','henry','ellie','hamster'}
local GF = {'ghostgf','gfdead','tuesdaygf','oldgf','gfpolus','gf','stick-gf','gf-farmer','gfmira'}
local Separacion = 160

function onStartCountdown() 
if not allowCountdown then
 return Function_Stop
end 
if allowCountdown then
return Function_Continue
end 
end

function onCreate()
initSaveData('gfSkins')
initSaveData('bfSkins')
initSaveData('petSkins')
initSaveData('Skins')

makeLuaSprite('starBG', 'Stages/shop/starBG', -1200, -200);
setScrollFactor('starBG', 0.5, 0.5);
scaleLuaSprite('starBG', 1, 1);
addLuaSprite('starBG', false);

starBGW = getProperty("starBG.width")  

makeLuaSprite('starBG2', 'Stages/shop/starBG', starBGW-2200, -200);
setScrollFactor('starBG2', 0.5, 0.5);
scaleLuaSprite('starBG2', 1, 1);
addLuaSprite('starBG2', false);

makeLuaSprite('starFG', 'Stages/shop/starFG', -1200, -200);
setScrollFactor('starFG', 0.8, 0.8);
scaleLuaSprite('starFG', 1, 1);
addLuaSprite('starFG', false);

starFGW = getProperty("starFG.width")  

makeLuaSprite('starFG2', 'Stages/shop/starFG', starFGW-2200, -200);
setScrollFactor('starFG2', 0.8, 0.8);
scaleLuaSprite('starFG2', 1, 1);
addLuaSprite('starFG2', false);

setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
makeLuaSprite('topBar', 'Stages/shop/topBar', 0, 0);
setScrollFactor('topBar', 1, 1);
scaleLuaSprite('topBar', 1, 1);
setObjectCamera('topBar', 'other');
addLuaSprite('topBar', false);

makeLuaSprite('BFskinShop', 'Stages/shop/mapas/BFskinShop', 100, 100);
setScrollFactor('BFskinShop', 0.75, 0.75);
scaleLuaSprite('BFskinShop', 0.5, 0.5);
setObjectCamera('BFskinShop', 'other');
setProperty('BFskinShop.alpha', 0)
addLuaSprite('BFskinShop', false);

makeLuaSprite('GFskinShop', 'Stages/shop/mapas/GFskinShop', 200, 175);
setScrollFactor('GFskinShop', 0.75, 0.75);
scaleLuaSprite('GFskinShop', 0.5, 0.5);
setObjectCamera('GFskinShop', 'other');
setProperty('GFskinShop.alpha', 0)
addLuaSprite('GFskinShop', false);

makeLuaSprite('PetsskinShop', 'Stages/shop/mapas/PetsskinShop', 240, 125);
setScrollFactor('PetsskinShop', 0.75, 0.75);
scaleLuaSprite('PetsskinShop', 0.45, 0.45);
setObjectCamera('PetsskinShop', 'other');
setProperty('PetsskinShop.alpha', 0)
addLuaSprite('PetsskinShop', false);

makeLuaSprite('menuBack', 'Stages/shop/menuBack', 20, 5);
setScrollFactor('menuBack', 1, 1);
scaleLuaSprite('menuBack', 1, 1);
setObjectCamera('menuBack', 'other');
addLuaSprite('menuBack', false);

makeLuaSprite('DELETE', 'Stages/shop/DELETE', 50, 120);
setScrollFactor('DELETE', 1, 1);
scaleLuaSprite('DELETE', 0.5, 0.5);
setObjectCamera('DELETE', 'other');
addLuaSprite('DELETE', false);

makeLuaSprite('pets', 'Stages/shop/pets', 600, 5);
setScrollFactor('pets', 1, 1);
scaleLuaSprite('pets', 1, 1);
setObjectCamera('pets', 'other');
addLuaSprite('pets', false);

makeLuaSprite('cosmicube', 'Stages/shop/cosmicube', 800, 5);
setScrollFactor('cosmicube', 1, 1);
scaleLuaSprite('cosmicube', 1, 1);
setObjectCamera('cosmicube', 'other');
addLuaSprite('cosmicube', false);

makeLuaSprite('skins', 'Stages/shop/skins', 400, 5);
setScrollFactor('skins', 1, 1);
scaleLuaSprite('skins', 1, 1);
setObjectCamera('skins', 'other');
addLuaSprite('skins', false);

makeAnimatedLuaSprite('check', 'Stages/shop/check', -1000, 950);
addAnimationByPrefix('check', 'check', 'check', 24, false);  
objectPlayAnimation('check', 'check', true)
setObjectCamera('check', 'other');
addLuaSprite('check', false);

setProperty("starBG.x", -1300)   
setProperty("starBG2.x", starBGW-1300)
doTweenX("starBGT1", "starBG", getProperty('starBG.x')-starBGW, 25, "linear")  
doTweenX("starBG2T1", "starBG2", getProperty('starBG2.x')-starBGW, 25, "linear")  

setProperty("starFG.x", -1000)   
setProperty("starFG2.x", starBGW-1000)
doTweenX("starFGT1", "starFG", getProperty('starFG.x')-starFGW, 20, "linear")  
doTweenX("starFG2T1", "starFG2", getProperty('starFG2.x')-starFGW, 20, "linear")  
end

local i = 1

function onCreatePost ()
setProperty('camHUD.alpha', 0)
end

function onUpdatePost(elasped)
if getMouseX('camOther') > getProperty('menuBack.x') and getMouseY('camOther') > getProperty('menuBack.y') and getMouseX('camOther') < getProperty('menuBack.x') + getProperty('menuBack.width') and getMouseY('camOther') < getProperty('menuBack.y') + getProperty('menuBack.height') and mouseReleased() then
endSong()
end
if getMouseX('camOther') > getProperty('DELETE.x') and getMouseY('camOther') > getProperty('DELETE.y') and getMouseX('camOther') < getProperty('DELETE.x') + getProperty('DELETE.width') and getMouseY('camOther') < getProperty('DELETE.y') + getProperty('DELETE.height') and mouseReleased() then
setDataFromSave('Skins', 'Sobrescribir', false) 
setDataFromSave('Skins', 'AllowMascota', false) 
playSound('select', 1);
end
if getMouseX('camOther') > getProperty('skins.x') and getMouseY('camOther') > getProperty('skins.y') and getMouseX('camOther') < getProperty('skins.x') + getProperty('skins.width') and getMouseY('camOther') < getProperty('skins.y') + getProperty('skins.height') and mouseReleased() then
setProperty('BFskinShop.alpha', 1)
setProperty('GFskinShop.alpha', 0)
setProperty('PetsskinShop.alpha', 0)
setProperty('check.alpha', 0)
playSound('select', 1);
CrearBFHitBoxes()
end
if getMouseX('camOther') > getProperty('cosmicube.x') and getMouseY('camOther') > getProperty('cosmicube.y') and getMouseX('camOther') < getProperty('cosmicube.x') + getProperty('cosmicube.width') and getMouseY('camOther') < getProperty('cosmicube.y') + getProperty('cosmicube.height') and mouseReleased() then
setProperty('BFskinShop.alpha', 0)
setProperty('GFskinShop.alpha', 1)
setProperty('check.alpha', 0)
setProperty('PetsskinShop.alpha', 0)
playSound('select', 1);
CrearGFsHitBoxes()
end
if getMouseX('camOther') > getProperty('pets.x') and getMouseY('camOther') > getProperty('pets.y') and getMouseX('camOther') < getProperty('pets.x') + getProperty('pets.width') and getMouseY('camOther') < getProperty('pets.y') + getProperty('pets.height') and mouseReleased() then
setProperty('BFskinShop.alpha', 0)
setProperty('GFskinShop.alpha', 0)
setProperty('check.alpha', 0)
setProperty('PetsskinShop.alpha', 1)
playSound('select', 1);
CrearPetsHitBoxes()
end
for i = 1, 100 do 
if getMouseX('camOther') > getProperty('hitbox'..i..'.x') and getMouseY('camOther') > getProperty('hitbox'..i..'.y') and getMouseX('camOther') < getProperty('hitbox'..i..'.x') + getProperty('hitbox'..i..'.width') and getMouseY('camOther') < getProperty('hitbox'..i..'.y') + getProperty('hitbox'..i..'.height') and mouseReleased() then
setProperty('hitbox'..i..'.alpha', 0)
objectPlayAnimation('check', 'check', true)
setProperty('check.alpha', 1)
setProperty("check.x", getProperty('hitbox'..i..'.x'))   
setProperty("check.y", getProperty('hitbox'..i..'.y'))   
playSound('equip', 1);
makeLuaText('Yo',  string.upper(Map[i]), getPropertyFromClass('flixel.FlxG', 'width'), 500, 100);
setTextSize('Yo', 22);
setTextBorder('Yo', 1, '000000');
setTextAlignment('Yo', 'center');
setObjectCamera('Yo', 'other');
setTextFont("Yo", "arial.ttf");
addLuaText('Yo');
setObjectOrder('Yo', getObjectOrder('scoreTxt'))
if Map == BF then
setDataFromSave('Skins', 'Sobrescribir', true) 
setDataFromSave('bfSkins', 'skin', Map[i]) 
elseif Map == GF then
setDataFromSave('Skins', 'Sobrescribir', true) 
setDataFromSave('gfSkins', 'skin', Map[i]) 
elseif Map == Pets then
setDataFromSave('Skins', 'AllowMascota', true) 
setDataFromSave('petSkins', 'skin', Map[i]) 
end
end
end
end

function onTweenCompleted(tag)  
if tag == 'starBGT1' then
setProperty("starBG.x", -1300)   
setProperty("starBG2.x", starBGW-1300)
doTweenX("starBGT1", "starBG", getProperty('starBG.x')-starBGW, 25, "linear")  
doTweenX("starBG2T1", "starBG2", getProperty('starBG2.x')-starBGW, 25, "linear")  
end
if tag == 'starFGT1' then
setProperty("starFG.x", -1000)   
setProperty("starFG2.x", starBGW-1000)
doTweenX("starFGT1", "starFG", getProperty('starFG.x')-starFGW, 20, "linear")  
doTweenX("starFG2T1", "starFG2", getProperty('starFG2.x')-starFGW, 20, "linear")  
end
end

function CrearBFHitBoxes()
Map = BF

makeLuaSprite('hitbox1', 'Stages/shop/place', 455, 100);
setScrollFactor('hitbox1', 1, 1);
scaleLuaSprite('hitbox1', 2, 2);
setObjectCamera('hitbox1', 'other');
addLuaSprite('hitbox1', false);

makeLuaSprite('hitbox2', 'Stages/shop/place', 630, 100);
setScrollFactor('hitbox2', 1, 1);
scaleLuaSprite('hitbox2', 2, 2);
setObjectCamera('hitbox2', 'other');
addLuaSprite('hitbox2', false);

makeLuaSprite('hitbox3', 'Stages/shop/place', 278, 272);
setScrollFactor('hitbox3', 1, 1);
scaleLuaSprite('hitbox3', 2, 2);
setObjectCamera('hitbox3', 'other');
addLuaSprite('hitbox3', false);

makeLuaSprite('hitbox4', 'Stages/shop/place', 455, 272);
setScrollFactor('hitbox4', 1, 1);
scaleLuaSprite('hitbox4', 2, 2);
setObjectCamera('hitbox4', 'other');
addLuaSprite('hitbox4', false);

makeLuaSprite('hitbox5', 'Stages/shop/place', 630, 272);
setScrollFactor('hitbox5', 1, 1);
scaleLuaSprite('hitbox5', 2, 2);
setObjectCamera('hitbox5', 'other');
addLuaSprite('hitbox5', false);

makeLuaSprite('hitbox6', 'Stages/shop/place', 810, 272);
setScrollFactor('hitbox6', 1, 1);
scaleLuaSprite('hitbox6', 2, 2);
setObjectCamera('hitbox6', 'other');
addLuaSprite('hitbox6', false);

makeLuaSprite('hitbox7', 'Stages/shop/place', 100, 450);
setScrollFactor('hitbox7', 1, 1);
scaleLuaSprite('hitbox7', 2, 2);
setObjectCamera('hitbox7', 'other');
addLuaSprite('hitbox7', false);

makeLuaSprite('hitbox8', 'Stages/shop/place', 278, 450);
setScrollFactor('hitbox8', 1, 1);
scaleLuaSprite('hitbox8', 2, 2);
setObjectCamera('hitbox8', 'other');
addLuaSprite('hitbox8', false);

makeLuaSprite('hitbox9', 'Stages/shop/place', 455, 450);
setScrollFactor('hitbox9', 1, 1);
scaleLuaSprite('hitbox9', 2, 2);
setObjectCamera('hitbox9', 'other');
addLuaSprite('hitbox9', false);

makeLuaSprite('hitbox10', 'Stages/shop/place', 630, 450);
setScrollFactor('hitbox10', 1, 1);
scaleLuaSprite('hitbox10', 2, 2);
setObjectCamera('hitbox10', 'other');
addLuaSprite('hitbox10', false);

makeLuaSprite('hitbox11', 'Stages/shop/place', 810, 450);
setScrollFactor('hitbox11', 1, 1);
scaleLuaSprite('hitbox11', 2, 2);
setObjectCamera('hitbox11', 'other');
addLuaSprite('hitbox11', false);

makeLuaSprite('hitbox12', 'Stages/shop/place', 975, 450);
setScrollFactor('hitbox12', 1, 1);
scaleLuaSprite('hitbox12', 2, 2);
setObjectCamera('hitbox12', 'other');
addLuaSprite('hitbox12', false);

makeLuaSprite('hitbox13', 'Stages/shop/place', 100, 620);
setScrollFactor('hitbox13', 1, 1);
scaleLuaSprite('hitbox13', 2, 2);
setObjectCamera('hitbox13', 'other');
addLuaSprite('hitbox13', false);

makeLuaSprite('hitbox14', 'Stages/shop/place', 278, 620);
setScrollFactor('hitbox14', 1, 1);
scaleLuaSprite('hitbox14', 2, 2);
setObjectCamera('hitbox14', 'other');
addLuaSprite('hitbox14', false);

makeLuaSprite('hitbox15', 'Stages/shop/place', 455, 620);
setScrollFactor('hitbox15', 1, 1);
scaleLuaSprite('hitbox15', 2, 2);
setObjectCamera('hitbox15', 'other');
addLuaSprite('hitbox15', false);

makeLuaSprite('hitbox16', 'Stages/shop/place', 630, 620);
setScrollFactor('hitbox16', 1, 1);
scaleLuaSprite('hitbox16', 2, 2);
setObjectCamera('hitbox16', 'other');
addLuaSprite('hitbox16', false);

makeLuaSprite('hitbox17', 'Stages/shop/place', 800, 620);
setScrollFactor('hitbox17', 1, 1);
scaleLuaSprite('hitbox17', 2, 2);
setObjectCamera('hitbox17', 'other');
addLuaSprite('hitbox17', false);

makeLuaSprite('hitbox18', 'Stages/shop/place', 975, 620);
setScrollFactor('hitbox18', 1, 1);
scaleLuaSprite('hitbox18', 2, 2);
setObjectCamera('hitbox18', 'other');
addLuaSprite('hitbox18', false);

for i = 1, 100 do 
setProperty('hitbox'..i..'.alpha', 0)
end
end

function CrearPetsHitBoxes()
Map = Pets

makeLuaSprite('hitbox1', 'Stages/shop/place', 558, 130);
setScrollFactor('hitbox1', 1, 1);
scaleLuaSprite('hitbox1', 1.75, 1.75);
setObjectCamera('hitbox1', 'other');
addLuaSprite('hitbox1', false);

makeLuaSprite('hitbox2', 'Stages/shop/place', 716, 130);
setScrollFactor('hitbox2', 1, 1);
scaleLuaSprite('hitbox2', 1.75, 1.75);
setObjectCamera('hitbox2', 'other');
addLuaSprite('hitbox2', false);

makeLuaSprite('hitbox3', 'Stages/shop/place', 875, 130);
setScrollFactor('hitbox3', 1, 1);
scaleLuaSprite('hitbox3', 1.75, 1.75);
setObjectCamera('hitbox3', 'other');
addLuaSprite('hitbox3', false);

makeLuaSprite('hitbox4', 'Stages/shop/place', 240, 282);
setScrollFactor('hitbox4', 1, 1);
scaleLuaSprite('hitbox4', 1.75, 1.75);
setObjectCamera('hitbox4', 'other');
addLuaSprite('hitbox4', false);

makeLuaSprite('hitbox5', 'Stages/shop/place', 240+160, 282);
setScrollFactor('hitbox5', 1, 1);
scaleLuaSprite('hitbox5', 1.75, 1.75);
setObjectCamera('hitbox5', 'other');
addLuaSprite('hitbox5', false);

makeLuaSprite('hitbox6', 'Stages/shop/place', 240+320, 282);
setScrollFactor('hitbox6', 1, 1);
scaleLuaSprite('hitbox6', 1.75, 1.75);
setObjectCamera('hitbox6', 'other');
addLuaSprite('hitbox6', false);

makeLuaSprite('hitbox7', 'Stages/shop/place', 240+320+160, 282);
setScrollFactor('hitbox7', 1, 1);
scaleLuaSprite('hitbox7', 1.75, 1.75);
setObjectCamera('hitbox7', 'other');
addLuaSprite('hitbox7', false);

makeLuaSprite('hitbox8', 'Stages/shop/place', 240+320+320, 282);
setScrollFactor('hitbox8', 1, 1);
scaleLuaSprite('hitbox8', 1.75, 1.75);
setObjectCamera('hitbox8', 'other');
addLuaSprite('hitbox8', false);

makeLuaSprite('hitbox9', 'Stages/shop/place', 240+Separacion, 282+Separacion);
setScrollFactor('hitbox9', 1, 1);
scaleLuaSprite('hitbox9', 1.75, 1.75);
setObjectCamera('hitbox9', 'other');
addLuaSprite('hitbox9', false);

makeLuaSprite('hitbox10', 'Stages/shop/place', 240+Separacion*2, 282+Separacion);
setScrollFactor('hitbox10', 1, 1);
scaleLuaSprite('hitbox10', 1.75, 1.75);
setObjectCamera('hitbox10', 'other');
addLuaSprite('hitbox10', false);

makeLuaSprite('hitbox11', 'Stages/shop/place', 240+Separacion*3, 282+Separacion);
setScrollFactor('hitbox11', 1, 1);
scaleLuaSprite('hitbox11', 1.75, 1.75);
setObjectCamera('hitbox11', 'other');
addLuaSprite('hitbox11', false);

makeLuaSprite('hitbox12', 'Stages/shop/place', 240+Separacion*2, 282+Separacion*2);
setScrollFactor('hitbox12', 1, 1);
scaleLuaSprite('hitbox12', 1.75, 1.75);
setObjectCamera('hitbox12', 'other');
addLuaSprite('hitbox12', false);

makeLuaSprite('hitbox13', 'Stages/shop/papu', 2000, 620);
setScrollFactor('hitbox13', 1, 1);
scaleLuaSprite('hitbox13', 2, 2);
setObjectCamera('hitbox13', 'other');
addLuaSprite('hitbox13', false);

makeLuaSprite('hitbox14', 'Stages/shop/papu', 2000, 620);
setScrollFactor('hitbox14', 1, 1);
scaleLuaSprite('hitbox14', 2, 2);
setObjectCamera('hitbox14', 'other');
addLuaSprite('hitbox14', false);

makeLuaSprite('hitbox15', 'Stages/shop/papu', 2000, 620);
setScrollFactor('hitbox15', 1, 1);
scaleLuaSprite('hitbox15', 2, 2);
setObjectCamera('hitbox15', 'other');
addLuaSprite('hitbox15', false);

makeLuaSprite('hitbox16', 'Stages/shop/papu', 2000, 620);
setScrollFactor('hitbox16', 1, 1);
scaleLuaSprite('hitbox16', 2, 2);
setObjectCamera('hitbox16', 'other');
addLuaSprite('hitbox16', false);

makeLuaSprite('hitbox17', 'Stages/shop/papu', 2000, 620);
setScrollFactor('hitbox17', 1, 1);
scaleLuaSprite('hitbox17', 2, 2);
setObjectCamera('hitbox17', 'other');
addLuaSprite('hitbox17', false);

makeLuaSprite('hitbox18', 'Stages/shop/papu', 2000, 620);
setScrollFactor('hitbox18', 1, 1);
scaleLuaSprite('hitbox18', 2, 2);
setObjectCamera('hitbox18', 'other');
addLuaSprite('hitbox18', false);

for i = 1, 100 do 
setProperty('hitbox'..i..'.alpha', 0)
end
end

function CrearGFsHitBoxes()
Map = GF
makeLuaSprite('hitbox1', 'Stages/shop/place', 555, 178);
setScrollFactor('hitbox1', 1, 1);
scaleLuaSprite('hitbox1', 2, 2);
setObjectCamera('hitbox1', 'other');
addLuaSprite('hitbox1', false);

makeLuaSprite('hitbox2', 'Stages/shop/place', 555+Separacion*1.1, 178);
setScrollFactor('hitbox2', 1, 1);
scaleLuaSprite('hitbox2', 2, 2);
setObjectCamera('hitbox2', 'other');
addLuaSprite('hitbox2', false);

makeLuaSprite('hitbox3', 'Stages/shop/place', 555+Separacion*2.2, 178);
setScrollFactor('hitbox3', 1, 1);
scaleLuaSprite('hitbox3', 2, 2);
setObjectCamera('hitbox3', 'other');
addLuaSprite('hitbox3', false);

makeLuaSprite('hitbox4', 'Stages/shop/place', 515-Separacion*2, 190+Separacion);
setScrollFactor('hitbox4', 1, 1);
scaleLuaSprite('hitbox4', 2, 2);
setObjectCamera('hitbox4', 'other');
addLuaSprite('hitbox4', false);

makeLuaSprite('hitbox5', 'Stages/shop/place', 515-Separacion+21, 190+Separacion);
setScrollFactor('hitbox5', 1, 1);
scaleLuaSprite('hitbox5', 2, 2);
setObjectCamera('hitbox5', 'other');
addLuaSprite('hitbox5', false);

makeLuaSprite('hitbox6', 'Stages/shop/place', 515-Separacion+21*2+Separacion, 190+Separacion);
setScrollFactor('hitbox6', 1, 1);
scaleLuaSprite('hitbox6', 2, 2);
setObjectCamera('hitbox6', 'other');
addLuaSprite('hitbox6', false);

makeLuaSprite('hitbox7', 'Stages/shop/place', 555+Separacion*1.1, 190+Separacion);
setScrollFactor('hitbox7', 1, 1);
scaleLuaSprite('hitbox7', 2, 2);
setObjectCamera('hitbox7', 'other');
addLuaSprite('hitbox7', false);

makeLuaSprite('hitbox8', 'Stages/shop/place', 515-Separacion+21, 178+Separacion*2.2);
setScrollFactor('hitbox8', 1, 1);
scaleLuaSprite('hitbox8', 2, 2);
setObjectCamera('hitbox8', 'other');
addLuaSprite('hitbox8', false);

makeLuaSprite('hitbox9', 'Stages/shop/place', 555, 178+Separacion*2.2);
setScrollFactor('hitbox9', 1, 1);
scaleLuaSprite('hitbox9', 2, 2);
setObjectCamera('hitbox9', 'other');
addLuaSprite('hitbox9', false);

makeLuaSprite('hitbox10', 'Stages/shop/papu', 2000, 450);
setScrollFactor('hitbox10', 1, 1);
scaleLuaSprite('hitbox10', 2, 2);
setObjectCamera('hitbox10', 'other');
addLuaSprite('hitbox10', false);

makeLuaSprite('hitbox11', 'Stages/shop/papu', 2000, 450);
setScrollFactor('hitbox11', 1, 1);
scaleLuaSprite('hitbox11', 2, 2);
setObjectCamera('hitbox11', 'other');
addLuaSprite('hitbox11', false);

makeLuaSprite('hitbox12', 'Stages/shop/papu', 2000, 450);
setScrollFactor('hitbox12', 1, 1);
scaleLuaSprite('hitbox12', 2, 2);
setObjectCamera('hitbox12', 'other');
addLuaSprite('hitbox12', false);

makeLuaSprite('hitbox13', 'Stages/shop/papu', 2000, 620);
setScrollFactor('hitbox13', 1, 1);
scaleLuaSprite('hitbox13', 2, 2);
setObjectCamera('hitbox13', 'other');
addLuaSprite('hitbox13', false);

makeLuaSprite('hitbox14', 'Stages/shop/papu', 2000, 620);
setScrollFactor('hitbox14', 1, 1);
scaleLuaSprite('hitbox14', 2, 2);
setObjectCamera('hitbox14', 'other');
addLuaSprite('hitbox14', false);

makeLuaSprite('hitbox15', 'Stages/shop/papu', 2000, 620);
setScrollFactor('hitbox15', 1, 1);
scaleLuaSprite('hitbox15', 2, 2);
setObjectCamera('hitbox15', 'other');
addLuaSprite('hitbox15', false);

makeLuaSprite('hitbox16', 'Stages/shop/papu', 2000, 620);
setScrollFactor('hitbox16', 1, 1);
scaleLuaSprite('hitbox16', 2, 2);
setObjectCamera('hitbox16', 'other');
addLuaSprite('hitbox16', false);

makeLuaSprite('hitbox17', 'Stages/shop/papu', 2000, 620);
setScrollFactor('hitbox17', 1, 1);
scaleLuaSprite('hitbox17', 2, 2);
setObjectCamera('hitbox17', 'other');
addLuaSprite('hitbox17', false);

makeLuaSprite('hitbox18', 'Stages/shop/papu', 2000, 620);
setScrollFactor('hitbox18', 1, 1);
scaleLuaSprite('hitbox18', 2, 2);
setObjectCamera('hitbox18', 'other');
addLuaSprite('hitbox18', false);
for i = 1, 100 do 
setProperty('hitbox'..i..'.alpha', 0)
end
end