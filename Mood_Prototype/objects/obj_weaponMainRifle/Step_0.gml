//get input
var lmb = mouse_check_button_pressed(mb_left);
var lmbHeld = mouse_check_button(mb_left);
var rmb = mouse_check_button_pressed(mb_right);
var rmbHeld = mouse_check_button(mb_right);


//firerate
if (timerFirerate > 0) timerFirerate--;


//active filter
if (!active) || (!canShoot) exit;


//main action
if (lmb)
if (timerFirerate == 0)
{
	timerFirerate = intervalFirerate;
	
	instance_create_depth(x, y, depth, obj_projectileDamage, { size : 1.5, damage : 14, image_angle : image_angle, spd : 52, punch : 18 });
	
	audio_play_sound(snd_prowler2, 0, 0, gainSFX);
}
else if (timerFirerate > 0) audio_play_sound(snd_weaponOnCooldown, 0, 0, gainSFX);


//secondary action
//if (rmb) && (timerFirerate == 0)
//{
//	timerFirerate = intervalFirerate;
//}