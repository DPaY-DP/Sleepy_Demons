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
if (lmbHeld) && (timerFirerate == 0) && (ammo > 0) && (spinUp >= 20)
{
	timerFirerate = intervalFirerate;
	ammo--;
	
	instance_create_depth(x, y, depth, obj_projectileCandydart, { image_angle : image_angle - 8 + random(16) });
}

if (lmbHeld) spinUp++;
else 
{
	spinUp -= 2;
	if (spinUp < 0) spinUp = 0;
}


//secondary action
if (rmb) && (timerFirerate == 0) && (ammo > 0)
{
	timerFirerate = intervalFirerate;
	ammo -= min(25, ammo);
	
	obj_player.boosted = true;
	obj_player.timerBoosted = 300;
}