draw_self();

if (applyDamage) 
{
	if (point_distance(x, y, obj_player.x, obj_player.y) < rangeInteract)
	{
		var _x = x + lengthdir_x(16, image_angle);
		var _y = y + lengthdir_y(16, image_angle);
	
		draw_sprite_simple(spr_UI_button, 1, _x, _y, { size : 0.8 });
	}
	image_blend = c_red;
}
else image_blend = c_white;