x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

if (instance_position(x, y, obj_enemyDemonSaboteurBig)) with (instance_place(x, y, obj_enemyDemonSaboteurBig)) 
{
	vulnerable = true;
	image_index = 1;
}
if (instance_position(x, y, obj_wall)) instance_destroy();

draw_self();