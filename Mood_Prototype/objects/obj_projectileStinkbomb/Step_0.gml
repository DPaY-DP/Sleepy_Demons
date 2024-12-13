if (spd > 0)
{
	x += lengthdir_x(spd, image_angle);
	y += lengthdir_y(spd, image_angle);
	
	spd *= 0.95;
	if (spd < 0.05) stop();
}
else
{
	timerDuration--;
	if (timerDuration == 0) instance_destroy();
}

timerStink++;
if (timerStink mod 45 == 0) instance_create_layer(x, y, "Overlay", obj_projectileStinkbombEffect, { dur : 1 });