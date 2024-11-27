//get input
var lmb = mouse_check_button_pressed(mb_left);
var lmbHeld = mouse_check_button(mb_left);
var rmb = mouse_check_button_pressed(mb_right);
var rmbHeld = mouse_check_button(mb_right);


//firerate
if (timerFirerate > 0) timerFirerate--;

if (timerFirerate == 1)
{
	instance_create_depth(x, y, depth, obj_ammoSpent, { image_index : enumWeaponEffect.GUMMYBEAR, dir : image_angle - 70 - random(40) });
}


//active filter
if (!active) || (!canShoot) exit;


//main action
if (lmb)
if (timerFirerate == 0) && (ammo > 0)
{
	timerFirerate = intervalFirerate;
	ammo--;
	
	instance_create_depth(x, y, depth, obj_projectileGummybear, { image_angle : image_angle });
	
	audio_play_sound(snd_gummySplat, 0, 0, gainSFX, 0, 1.1);
}
else if (timerFirerate > 0) audio_play_sound(snd_weaponOnCooldown, 0, 0, gainSFX);
else if (ammo <= 0) audio_play_sound(snd_weaponEmpty, 0, 0, gainSFX);


//secondary action
if (rmb)
if (timerFirerate == 0) && (ammo > 0)
{
	timerFirerate = intervalFirerate;
	ammo--;
	
	instance_create_depth(x, y, depth, obj_projectileGummybumper, { image_xscale : 3, image_yscale : 3, dir : image_angle });
	
	audio_play_sound(snd_gummySplat, 0, 0, gainSFX, 0, 0.8);
}
else if (timerFirerate > 0) audio_play_sound(snd_weaponOnCooldown, 0, 0, gainSFX);
else if (ammo <= 0) audio_play_sound(snd_weaponEmpty, 0, 0, gainSFX);