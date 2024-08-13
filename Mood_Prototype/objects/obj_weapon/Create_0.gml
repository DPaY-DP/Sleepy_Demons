//visuals
image_speed = 0;
image_alpha = 0;


//functionality
timerFireRate = 0;

weaponsAvailable = [];
weaponEquipped = 0;

intervalLaunch = 30;
timerLaunch = intervalLaunch;

burst = 0;
burstfire = 0;
timer_burstfire = 0;

burstId = 0;

ability = 0;

combo = [];

fire = false;
counterBurst = 0;

//methods
pickup_gun = function(_type)
{
	array_push(weaponsAvailable, ds_clone(global.weaponData[_type]));
	
	if (array_length(weaponsAvailable) == 1)
	{
		image_alpha = 1;
	}
	
	weaponEquipped = array_length(weaponsAvailable) - 1;
}

restock_ammo = function(_weaponId)
{
	var _length = array_length(weaponsAvailable);
	for (var i = 0; i < _length; i++)
	{
		var _weapon = weaponsAvailable[i];
		if (_weaponId == _weapon.weaponId)
		{
			_weapon.ammo = _weapon.ammoMax;
		}
	}
}