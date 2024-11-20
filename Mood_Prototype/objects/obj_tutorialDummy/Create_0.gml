currentRoom = room_get_name(room);

timesShot = 0;
timesMelee = 0;
executedDummy = false;

dummyBehaviour = function()
{
	switch(currentRoom)
	{
		case "room_tutorialShooting":
			draw_text_simple(x,y-25,timesShot,{size : .1});
			draw_text_simple(x,y-50,timesMelee, {size : .1});

			if(timesShot >= 3 && timesMelee >= 3)
			{
				instance_destroy(self);
			}
		break;
	
		case "room_tutorialExecutie":
			draw_sprite_simple(spr_UI_button, 0, x, y - 16, { size : 0.8 });
			
			draw_text_simple(x,y-25,executedDummy, {size : .1});
			if	(point_distance(x, y, obj_player.x, obj_player.y) < 120)
			{
				if (keyExecute) && (!instance_exists(obj_managerMinigame))
				{
					//show_debug_message("keyExecute pressed")
					instance_create_layer(x, y, "Overlay", obj_managerMinigame, { enemy : id });
				}
			}
			
			if(executedDummy) instance_destroy(self);
		break;
	
		case "room_tutorialEnvironment":
		
		break;
	}
}