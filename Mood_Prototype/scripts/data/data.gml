//DEBUG
global.debugmode = false;


//MACROS
#macro key_melee keyboard_check_pressed(ord("C"))

#macro key_primary mouse_check_button_pressed(mb_left)
#macro key_primary_held mouse_check_button(mb_left)
#macro key_secondary mouse_check_button_pressed(mb_right)
#macro key_secondary_held mouse_check_button(mb_right)


//WEAPONS
global.weaponData = [
	{
		name : "nitequil",
		
		punch : 5,
		
		damage : 6,
		firerate : 30,
		projectile : obj_projectileBullet,
		
		firerateSecondary : 60,
	},
	{
		name : "pyjama",
		
		punch : 20,
		
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
		
		punch : 50,
		
		damage : 15,
		firerate : 60,
		projectile : obj_projectileHitscan,
	},
	{
		name : "prowler",
		
		burst : 3,
		burstrate : 3,
		
		punch : 8,
		
		damage : 3,
		firerate : 15,
		projectile : obj_projectileBulletProwler,
	},
	{
		name : "puddle",
		
		punch : 30,
		
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
		
		damage : 1,
		firerate : 10,
		projectile : obj_projectileRepair,
		
		punch : 1.4,
	},
	{
		name : "catcher",
		
		damage : 0,
		firerate : 60,
		projectile : obj_projectileNet,
		
		punch : 10,
	},
]

var _length = array_length(global.weaponData);
for (var i = 0; i < _length; i++)
{
	global.weaponData[i].number = i;
}