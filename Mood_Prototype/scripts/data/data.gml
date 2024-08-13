//DEBUG
global.debugmode = false;


//WEAPONS
global.weaponData = [
	{
		name : "nitequil",
		
		recoil : 5,
		punch : 12,
		
		damage : 6,
		firerate : 30,
		projectile : obj_projectileBullet,
		
		firerateSecondary : 60,
	},
	{
		name : "pyjama",
		
		recoil : 20,
		punch : 40,
		
		area : 200,
		range : 500,
		
		launch : 200,
		
		spd : 15,
		
		damage : 4,
		firerate : 60,
		projectile : obj_projectileAOE,
	},
	{
		name : "railgun",
		
		delay : 62,
		
		xBarrel : 39,
		yBarrel : 47,
		
		recoil : 50,
		punch : 120,
		
		damage : 15,
		firerate : 60,
		projectile : obj_projectileHitscan,
	},
	{
		name : "prowler",
		
		burst : 3,
		burstrate : 3,
		
		recoil : 8,
		punch : 15,
		
		damage : 3,
		firerate : 15,
		projectile : obj_projectileBulletProwler,
	},
	{
		name : "puddle",
		
		recoil : 30,
		punch : 55,
		
		area : 300,
		range : 500,
		
		spd : 20,
		
		damage : 0,
		firerate : 60,
		projectile : obj_projectileAOEEffect,
		
		length : 120,
	},
	{
		name : "repair",
		
		xBarrel : 39,
		yBarrel : 48,
		
		damage : 4,
		firerate : 10,
		projectile : obj_projectileRepair,
		
		recoil : 1.4,
		punch : 1,
	},
	{
		name : "catcher",
		
		damage : 0,
		firerate : 60,
		projectile : obj_projectileNet,
		
		recoil : 10,
		punch : 16,
	},
]

var _length = array_length(global.weaponData);
for (var i = 0; i < _length; i++)
{
	global.weaponData[i].number = i;
}