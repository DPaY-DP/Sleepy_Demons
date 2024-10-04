//immutable values
	//projectile values
boundary = 200;

xStart = x;
yStart = y;

	//unique values
if (!variable_global_exists("counterRepair")) global.counterRepair = 0;
else global.counterRepair++;

spd = 20;
damage = 10 + irandom(2);

range = 300;
rangeFalloff = 300;




//game values
active = true;
falloff = 0;


//setup
image_index = irandom(image_number - 1);
rot = (3 + random(3)) * choose(1, -1); 

if (global.counterRepair mod 6 == 0) 
{
	audio_play_sound_at(snd_repairgun, x, y, 0, 100, 150, 1, 0, 0);
	
	image_xscale = 2;
	image_yscale = 2;
	
	dir = image_angle;
}
else
{
	image_xscale = random_range(1, 1.5);
	image_yscale = random_range(1, 1.5);
	
	dir = image_angle + random_range(-10, 10);
	
	active = false;
}
	