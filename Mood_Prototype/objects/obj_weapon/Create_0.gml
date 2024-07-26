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

//methods
pickup_gun = function(_type)
{
	array_push(weaponsAvailable, global.weaponData[_type]);
	
	if (array_length(weaponsAvailable) == 1)
	{
		image_alpha = 1;
	}
}