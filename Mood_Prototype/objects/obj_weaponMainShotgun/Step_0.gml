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
	
	repeat (5) instance_create_depth(x, y, depth, obj_projectileDamage, { size : 0.6 - random(0.2), damage : 3, image_angle : image_angle + 20 - random(40), spd : 24 - irandom(10), punch : 5 });
	
	audio_play_sound(snd_shotgun, 0, 0, gainSFX);
}
else if (timerFirerate > 0) audio_play_sound(snd_weaponOnCooldown, 0, 0, gainSFX);


//secondary action
//if (rmb) && (timerFirerate == 0)
//{
//	timerFirerate = intervalFirerate;
//}