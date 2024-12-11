currentRoom = room_get_name(room);

timesShot = 0;
timesMelee = 0;
executedDummy = false;

dummyBehaviour = function()
{
	switch(currentRoom)
	{
		case "room_tutorialShooting":
			
			var _colorShot = c_black;
			var _colorMelee = c_black;
			if (timesShot > 2) _colorShot = c_green;
			if (timesMelee > 2) _colorMelee = c_green;
			
			draw_self();
			draw_text_simple(x + 20,y - 10,timesShot,{size : .2, color : _colorShot});
			draw_text_simple(x + 20,y + 10,timesMelee, {size : .2, color : _colorMelee});

			if(timesShot >= 3 && timesMelee >= 3)		//LUIZ This is bad, since at the moment bullets & melee can hit multiple times -.-
			{
				instance_destroy();
			}
		break;
	
		case "room_tutorialExecutie":
			draw_self();
			draw_sprite_simple(spr_UI_button, 0, x, y, { size : 0.8 });
			
			//draw_text_simple(x,y-25,executedDummy, {size : .1});
			if	(point_distance(x, y, obj_player.x, obj_player.y) < 120)		//LUIZ uses a scaled down version of enemy code
			{
				if (keyExecute) && (!instance_exists(obj_managerMinigame))
				{
					//show_debug_message("keyExecute pressed")
					instance_create_layer(x, y, "Overlay", obj_managerMinigame, { enemy : id });
				}
			}
			
			if(executedDummy) instance_destroy();
		break;
		
		case "room_tutorialEnvironment":
			if (executedDummy) instance_destroy();
		break;
	}
}