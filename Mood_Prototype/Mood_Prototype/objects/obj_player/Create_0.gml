	//values
//movement
spd = spdPlayer;
	
//weapons
firstShot = true;

weaponsAvailable = [];
weaponEquipped = undefined;
weaponName = undefined;

timerWeapon = 0;	
intervalNitequil = 12;
intervalNitequilCharge = 1;
intervalPyjamaCharge = 90;

gunDistance = 28.6;
gunAngle = 330;

rangeHitscan = 500;

//##NEW
//room
inRoom = instance_place(x, y, obj_room);
booster_cd = 0;
booster_speed = 0;