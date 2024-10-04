//ENUMERATOR
enum enumWeapon
{
	NITEQUIL,
	PROWLER,
	LAUNCHER,
	RAILGUN,
	CATCHER,
	REPAIR,
}


//WEAPONS
weaponData = [
	{
		name : "nitequil",
		
		holdfire : false,
		
		xBarrel : 0,
		yBarrel : 0,
		
		recoil : 5,
		firerate : 40,
		
		ammoMax: infinity,
		ammopool : infinity,
		
		burst : 1,
		intervalBurst : 0,
		
		blast : 1,
		blastDeviance : 0,
		
		intervalDelay : 0,
		
		projectile : obj_projectileBulletNitequil,
		sound : 
		{
			fire : snd_pistol,
			delay : false,
			volume : 1.5,
		},
	},
	{
		name : "prowler",
		
		holdfire : false,
		
		xBarrel : 0,
		yBarrel : 0,
		
		recoil : 8,
		firerate : 15,
		
		ammoMax: 28,
		ammopool : infinity,
		
		burst : 4,
		intervalBurst : 2,
		
		blast : 1,
		blastDeviance : 0,
		
		intervalDelay : 0,
		
		projectile : obj_projectileBulletProwler,
		sound : 
		{
			fire : snd_prowler2,
			delay : false,
			volume : 0.3,
		},
	},
	{
		name : "launcher",
		
		holdfire : false,
		
		xBarrel : 0,
		yBarrel : 0,
		
		recoil : 20,
		firerate : 60,
		
		ammoMax: 3,
		ammopool : infinity,
		
		burst : 1,
		intervalBurst : 0,
		
		blast : 1,
		blastDeviance : 0,
		
		intervalDelay : 0,
		
		projectile : obj_projectileRocket,
		sound : 
		{
			fire : snd_rocketLaunch,
			delay : false,
			volume : 1,
		},
	},
	{
		name : "railgun",
		
		holdfire : false,
		
		xBarrel : 39,
		yBarrel : 47,
		
		recoil : 50,
		firerate : 60,
		
		ammoMax: 3,
		ammopool : infinity,
		
		burst : 1,
		intervalBurst : 0,
		
		blast : 1,
		blastDeviance : 0,
		
		intervalDelay : 62,
		
		projectile : obj_projectileHitscan,
		sound : 
		{
			fire : false,
			delay : snd_railgun_full,
			volume : 1,
		},
	},
	{
		name : "repair",
		
		holdfire : true,
		
		xBarrel : 0,
		yBarrel : 0,
		
		recoil : 1.4,
		firerate : 1,
		
		ammoMax: 400,
		ammopool : infinity,
		
		burst : 1,
		intervalBurst : 0,
		
		blast : 1,
		blastDeviance : 0,
		
		intervalDelay : 0,
		
		projectile : obj_projectileRepair,
		sound : 
		{
			fire : false,
			delay : false,
			volume : 1,
		},
		
	},
	{
		name : "catcher",
		
		holdfire : false,
		
		xBarrel : 0,
		yBarrel : 0,
		
		recoil : 10,
		firerate : 10,
		
		ammoMax: 7,
		ammopool : infinity,
		
		burst : 1,
		intervalBurst : 0,
		
		blast : 1,
		blastDeviance : 0,
		
		intervalDelay : 0,
		
		projectile : obj_projectileNet,
		sound : 
		{
			fire : snd_extendoThrow,
			delay : false,
			volume : 1,
		},
	},
	{
		name : "blunderfuss",
		
		holdfire : false,
		
		xBarrel : 0,
		yBarrel : 0,
		
		recoil : 10,
		firerate : 60,
		
		ammoMax: 5,
		ammopool : infinity,
		
		burst : 1,
		intervalBurst : 0,
		
		blast : 16,
		blastDeviance : 26,
		
		intervalDelay : 0,
		
		projectile : obj_projectileBlunder,
		sound : 
		{
			fire : Shotgun_2,
			delay : false,
			volume : 1,
		},
	},
	//{
	//	name : "puddle",
		
	//	recoil : 30,
	//	punch : 55,
		
	//	area : 300,
	//	range : 500,
		
	//	spd : 20,
		
	//	intervalDelay : 0,
		
	//	damage : 0,
	//	firerate : 60,
	//	projectile : obj_projectileAOEEffect,
		
	//	length : 120,
	//},
]

var _length = array_length(global.weaponData);
for (var i = 0; i < _length; i++)
{
	weaponData[i].weaponId = i;
	
	weaponData[i].number = i;
	weaponData[i].timerFirerate = 0;
	weaponData[i].timerBurst = 0;
	weaponData[i].timerDelay = weaponData[i].intervalDelay;
	weaponData[i].ammo = weaponData[i].ammoMax;
}