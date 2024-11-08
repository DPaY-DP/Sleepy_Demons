//IMMUTABLE VALUES
spdBase = 5;

//forceBase = 1;
//forceBoost = forceBase * 5;

rangeBase = 100;
rangeBoost = 200;

factorCircleBase = 1;
factorFactorCircle = 0.025;


//GAME VALUES
timerDuration = 300;

spd = spdBase;

force = 6;

range = rangeBase;

factorCircle = factorCircleBase;


//METHODS
burst = function()
{
	instance_create_depth(x, y, depth, obj_projectileGluetrap_lingering);
	instance_destroy();
}


//STATES