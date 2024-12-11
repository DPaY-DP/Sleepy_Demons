//get input
var lmb = mouse_check_button_pressed(mb_left);
var lmbHeld = mouse_check_button(mb_left);
var rmb = mouse_check_button_pressed(mb_right);
var rmbHeld = mouse_check_button(mb_right);


//firerate
if (timerFirerate > 0) timerFirerate--;

if (timerFirerate == 1)
{
	instance_create_depth(x, y, depth, obj_ammoSpent, { image_index : enumWeaponEffect.STINKBOMB, dir : image_angle - 70 - random(40), size : 1 });
}



//active filter
if (!active) || (!canShoot) exit;


//main action
if (lmb)
if (timerFirerate == 0) && (ammo > 0)
{
	timerFirerate = intervalFirerate;
	ammo--;
	
	instance_create_depth(x, y, depth, obj_projectileStinkbomb, { image_angle : image_angle });
	
	audio_play_sound(snd_defaultCannon, 0, 0, gainSFX, 0, 1.1);
	audio_play_sound(snd_gummySplat, 0, 0, gainSFX, 0, 0.8);
}


//secondary action
if (rmb)
if (timerFirerate == 0) && (ammo > 0)
{
	timerFirerate = intervalFirerate;
	ammo--;
	
	instance_create_depth(x, y, depth, obj_weaponStinkbombMelee, { weaponActive : obj_loadout.weaponActive });
	active = false;
	
	audio_play_sound(snd_steampipeLeaking, 0, 0, gainSFX, 0, 1.5);
	//audio_play_sound(snd_stinkBombRush, 0, 0, gainSFX, 0, 1.5);
}