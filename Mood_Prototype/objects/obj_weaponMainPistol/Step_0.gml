//get input
var lmb = mouse_check_button_pressed(mb_left);
var lmbHeld = mouse_check_button(mb_left);
var rmb = mouse_check_button_pressed(mb_right);
var rmbHeld = mouse_check_button(mb_right);


//firerate
if (timerFirerate > 0) timerFirerate--;

if (timerFirerate == 1)
{
	instance_create_depth(x, y, depth, obj_ammoSpentMain, { image_index : enumWeaponMain.PISTOL, dir : image_angle - 70 - random(40) });
}


//active filter
if (!active) || (!canShoot) exit;


//main action
if (lmb)
if (timerFirerate == 0)
{
	timerFirerate = intervalFirerate;
	
	instance_create_depth(x, y, depth, obj_projectileDamage, { size : 1, damage : 8, image_angle : image_angle + 5 - random(10), spd : 36, punch : 12 });
	
	audio_play_sound(snd_pistol, 0, 0, gainSFX, 0, 0.8 + random(0.4));
}
else if (timerFirerate > 0) audio_play_sound(snd_weaponOnCooldown, 0, 0, gainSFX);


//secondary action
//if (rmb) && (timerFirerate == 0)
//{
//	timerFirerate = intervalFirerate;
//}