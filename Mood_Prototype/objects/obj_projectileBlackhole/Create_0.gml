//IMMUTABLE VALUES
spdBase = 5;

//forceBase = 1;
//forceBoost = forceBase * 5;

rangeBase = 50;
rangeBoost = 100;

factorCircleBase = 1;
factorFactorCircle = 0.025;


//SETUP AND SPAWNING
//audio_play_sound(snd_blackholeGunStartTief, 0, 0, gainSFX);


//GAME VALUES
timerDuration = 300;

spd = spdBase;

force = 3;

range = rangeBase;

factorCircle = factorCircleBase;


//METHODS
burst = function()
{
	instance_create_depth(x, y, depth, obj_projectileGluetrap_lingering);
	instance_destroy();
}


//STATES