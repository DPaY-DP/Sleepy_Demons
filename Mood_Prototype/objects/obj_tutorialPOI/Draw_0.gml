draw_self();
if (!fixed)
{
	var _x = x + lengthdir_x(8, image_angle - 45);
	var _y = y + lengthdir_y(8, image_angle - 45);
	
	draw_sprite_simple(spr_UI_button, 1, _x, _y, { size : 0.8 });
}

if	(point_distance(x, y, obj_player.x, obj_player.y) < 120)		//LUIZ uses a scaled down version of enemy code
{
	if (keyRepair)	
	{
		fixed = true;
		image_index = 0;
		image_speed = 0;
		image_blend = c_white;
		
		obj_tutorialEnvBig.POIsFixed++;
	}
}
			