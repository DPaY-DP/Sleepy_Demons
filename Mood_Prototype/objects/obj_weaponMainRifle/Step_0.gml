//get input
var lmb = mouse_check_button_pressed(mb_left);
var lmbHeld = mouse_check_button(mb_left);
var rmb = mouse_check_button_pressed(mb_right);
var rmbHeld = mouse_check_button(mb_right);


//firerate
if (timerFirerate > 0) timerFirerate--;


//active filter
if (!active) exit;


//main action
if (lmb) && (timerFirerate == 0)
{
	timerFirerate = intervalFirerate;
	
	instance_create_depth(x, y, depth, obj_projectileDamage, { size : 1.5, damage : 14, image_angle : image_angle, spd : 52, punch : 18 })
}


//secondary action
if (rmb) && (timerFirerate == 0)
{
	timerFirerate = intervalFirerate;
}