//get input
var lmb = mouse_check_button_pressed(mb_left);
var lmbHeld = mouse_check_button(mb_left);
var rmb = mouse_check_button_pressed(mb_right);
var rmbHeld = mouse_check_button(mb_right);


//firerate
if (timerFirerate > 0) timerFirerate--;

if (timerFirerate == 1)
{
	instance_create_depth(x, y, depth, obj_ammoSpent, { image_index : enumWeaponEffect.MINIYUM, dir : image_angle - 70 - random(40) });
}



//active filter
if (!active) || (!canShoot) exit;


//main action
if (lmbHeld) && (timerFirerate == 0) && (spinUp >= 20)
{
	timerFirerate = intervalFirerate;
	
	if (ammo > 0)
	{
		ammo--;
	
		instance_create_depth(x, y, depth, obj_projectileCandydart, { image_angle : image_angle - 8 + random(16) });
	
		audio_play_sound(snd_miniGunBullet, 0, 0, gainSFX, 0, 0.8 + random(0.4));
	}
	else audio_play_sound(snd_weaponEmpty, 0, 0, gainSFX, 0, 1.3);
}

if (lmbHeld) 
{
	if (spinUp == 0) audio_play_sound(snd_minigunStart, 0, 0, gainSFX);
	
	spinUp++;
	if (spinUp >= 20) && (!audio_is_playing(snd_minigunLoopTief)) audio_play_sound(snd_minigunLoopTief, 0, 0, gainSFX, 0, 0.8 + random(0.4));
}
else 
{
	spinUp = 0;
	
	//spinUp -= 2;
	//if (spinUp < 0) spinUp = 0;
}


//secondary action
if (rmb)
if (timerFirerate == 0) && (ammo > 0) && (obj_player.movementMods[enumMovementModsPlayer.MINIYUM].timer == 0)
{
	timerFirerate = intervalFirerate;
	ammo -= min(25, ammo);
	
	with (obj_player.movementMods[enumMovementModsPlayer.MINIYUM])
	{
		strength = 2.5;
		timer = 700;
		active = true;
	}
	
	audio_play_sound(snd_miniyumBoost, 0, 0, gainSFX, 0, 1.2);
}
else if (timerFirerate > 0) audio_play_sound(snd_weaponOnCooldown, 0, 0, gainSFX);
else if (ammo <= 0) audio_play_sound(snd_weaponEmpty, 0, 0, gainSFX);