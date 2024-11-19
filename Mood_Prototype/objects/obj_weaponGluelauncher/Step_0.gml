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
if (lmb) && (timerFirerate == 0) && (ammo > 0)
{
	timerFirerate = intervalFirerate;
	ammo--;
	
	show_debug_message("glue launched")
	instance_create_depth(x, y, depth, obj_projectileGluetrap, { image_angle : image_angle });
}


//secondary action
if (rmb) && (timerFirerate == 0) && (ammo > 0)
{
	timerFirerate = intervalFirerate;
	ammo--;
	
	var _dir = image_angle;
	obj_player.hvel -= lengthdir_x(rocketjump, image_angle);
	obj_player.vvel -= lengthdir_y(rocketjump, image_angle);
}