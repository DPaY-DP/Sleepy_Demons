draw_self();
draw_sprite_simple(spr_UI_button, 0, x, y - 16, { size : 0.8 });

if	(point_distance(x, y, obj_player.x, obj_player.y) < 120)		//LUIZ uses a scaled down version of enemy code
		{
			if (keyExecute)	instance_destroy();
		}
			