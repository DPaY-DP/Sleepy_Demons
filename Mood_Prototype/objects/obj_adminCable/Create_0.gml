
_ySpawn = GUIheight;
_xSpawn = GUIwidth;
						
//instance_create_depth(_xSpawn * 0.1, _ySpawn * 0.2, 10, obj_cable_blue_start,);
//instance_create_depth(_xSpawn * 0.1, _ySpawn * 0.4, 10, obj_cable_yellow_start,);
//instance_create_depth(_xSpawn * 0.1, _ySpawn * 0.6, 10, obj_cable_red_start,);
//instance_create_depth(_xSpawn * 0.1, _ySpawn * 0.8, 10, obj_cable_green_start,);

//instance_create_depth(_xSpawn * 0.9, _ySpawn * 0.2,  10, obj_cable_green_end,);
//instance_create_depth(_xSpawn * 0.9, _ySpawn * 0.4, 10, obj_cable_red_end,);
//instance_create_depth(_xSpawn * 0.9, _ySpawn * 0.6, 10, obj_cable_yellow_end,);
//instance_create_depth(_xSpawn * 0.9, _ySpawn * 0.8, 10, obj_cable_blue_end,);



		
		array_cables_start = [obj_cable_blue_start,obj_cable_yellow_start,obj_cable_red_start,obj_cable_green_start]
		ypos_start = [_ySpawn * 0.2,_ySpawn * 0.4,_ySpawn * 0.6,_ySpawn * 0.8]
		
		for (i = 0; i < 4; i++)
		{

			var chosen_index = irandom( array_length(ypos_start) - 1 );
			var chosen_option_y = ypos_start[chosen_index]
		
	

			instance_create_depth(_xSpawn * 0.1,chosen_option_y, 10, array_cables_start[i],);
			array_delete(ypos_start, chosen_index, 1)
		}
		
		array_cables_end = [obj_cable_blue_end,obj_cable_yellow_end,obj_cable_red_end,obj_cable_green_end]
		ypos_end = [_ySpawn * 0.2,_ySpawn * 0.4,_ySpawn * 0.6,_ySpawn * 0.8]
		
		for (i = 0; i < 4; i++)
		{

			var chosen_index = irandom( array_length(ypos_end) - 1 );
			var chosen_option_y = ypos_end[chosen_index]
		
	

			instance_create_depth(_xSpawn * 0.9,chosen_option_y, 10, array_cables_end[i],);
			array_delete(ypos_end, chosen_index, 1)
		}


