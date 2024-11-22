draw_self();

if(instance_number(obj_tutorialEnvSmall) == 0)
{
	draw_sprite_simple(spr_UI_button, 0, x, y - 16, { size : 0.8 });

	if	(point_distance(x, y, obj_player.x, obj_player.y) < 120)		//LUIZ uses a scaled down version of enemy code
		{
			if (keyExecute)	&& (!instance_exists(obj_managerMinigame))
				{
					//show_debug_message("keyExecute pressed")
					instance_create_depth(x, y, depth, obj_managerMinigame, { broken : id, game : enumMinigame.INPUTS_RAW });
				}
		}

	inputsDone = function()
	{
		var _dummy = instance_find(obj_tutorialDummy,0);
		show_debug_message("Found and destroyed dummy: " + string(_dummy))
		_dummy.executedDummy = true;
	}
}