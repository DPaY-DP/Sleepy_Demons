image_xscale = size;
image_yscale = size;

image_index = 1;

ySpawn = y;


amountStepsMove = 30;
move = 32 * size;
stepMove = move / amountStepsMove;

amountStepsRotate = ceil(amountStepsMove * 1.5);
stepRotate = 180 / amountStepsRotate;

counterStepsMove = 0;
counterStepsRotate = 0;

directionMove = "down";

check_horse_collider = function()
{
	if (place_meeting(x, y, obj_horsecolliderCrit)) 
	{
		obj_horsemanager.indicator += 3;
		audio_play_sound(snd_horseGameHit, 0, 0, gainSFX, 0, 1.5);
	}
	else if (place_meeting(x, y, obj_horsecollider)) 
	{
		obj_horsemanager.indicator++;
		audio_play_sound(snd_horseGameHit, 0, 0, gainSFX);
	}
	else audio_play_sound(snd_horseGameMiss, 0, 0, gainSFX);
	
	if (obj_horsemanager.indicator < 2)
	{	
		instance_create_depth(x, ySpawn, depth, obj_horseslider01, { size : size });
	}
	instance_destroy();
}

sfx = audio_play_sound(snd_HorseSliderRight, 0, 0, gainSFX);