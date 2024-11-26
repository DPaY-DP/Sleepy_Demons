//get input
var lmb = mouse_check_button_pressed(mb_left);
var lmbHeld = mouse_check_button(mb_left);
var rmb = mouse_check_button_pressed(mb_right);
var rmbHeld = mouse_check_button(mb_right);


//firerate
if (timerFirerate > 0) timerFirerate--;

if (timerFirerate == 1)
{
	instance_create_depth(x, y, depth, obj_ammoSpent, { image_index : enumWeaponEffect.GLUELAUNCHER, dir : image_angle - 70 - random(40) });
}


//active filter
if (!active) || (!canShoot) exit;


//main action
if (lmb)
if (timerFirerate == 0) && (ammo > 0)
{
	timerFirerate = intervalFirerate;
	ammo--;
	
	instance_create_depth(x, y, depth, obj_projectileGluetrap, { image_angle : image_angle });
	
	audio_play_sound(snd_defaultCannon, 0, 0, gainSFX);
}
else if (timerFirerate > 0) audio_play_sound(snd_weaponOnCooldown, 0, 0, gainSFX);
else if (ammo <= 0) audio_play_sound(snd_weaponEmpty, 0, 0, gainSFX);


//secondary action
if (rmb)
if (timerFirerate == 0) && (ammo > 0)
{
	timerFirerate = intervalFirerate;
	ammo--;
	
	var _dir = image_angle;
	obj_player.hvel -= lengthdir_x(rocketjump, image_angle);
	obj_player.vvel -= lengthdir_y(rocketjump, image_angle);
	
	with(obj_player.movementMods[enumMovementModsPlayer.ROCKETJUMP])
	{
		strength = 100;
		timer = 20;
		active = true;
	}
	
	instance_create_depth(x, y, depth, obj_projectileRocketjump, { image_angle : random(360) });
	
	audio_play_sound(snd_defaultCannonCut, 0, 0, gainSFX * 1.5, 0, 0.5);
}
else if (timerFirerate > 0) audio_play_sound(snd_weaponOnCooldown, 0, 0, gainSFX);
else if (ammo <= 0) audio_play_sound(snd_weaponEmpty, 0, 0, gainSFX);