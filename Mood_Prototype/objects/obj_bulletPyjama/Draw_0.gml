x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

if (instance_position(x, y, obj_enemyDemonSaboteurBig)) with (instance_place(x, y, obj_enemyDemonSaboteurBig)) 
{
	vulnerable = true;
	image_index = 1;
}

if (place_meeting(x, y, obj_wall)) ||
   (place_meeting(x, y, obj_wallPlayer)) instance_destroy();

draw_self();