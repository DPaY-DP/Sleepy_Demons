
_ySpawn = GUIheight  /2;
_xSpawn = GUIwidth * 0.8;
						
instance_create_depth(_xSpawn * 0.1, _ySpawn * 0.2, 10, obj_cable_blue_start,);
instance_create_depth(_xSpawn * 0.1, _ySpawn * 0.5, 10, obj_cable_yellow_start,);
instance_create_depth(_xSpawn * 0.1, _ySpawn * 0.8, 10, obj_cable_red_start,);
instance_create_depth(_xSpawn * 0.1, _ySpawn * 1.1, 10, obj_cable_green_start,);

instance_create_depth(_xSpawn * 0.75, _ySpawn * 0.2,  10, obj_cable_green_end,);
instance_create_depth(_xSpawn * 0.75, _ySpawn * 0.5, 10, obj_cable_red_end,);
instance_create_depth(_xSpawn * 0.75, _ySpawn * 0.8, 10, obj_cable_yellow_end,);
instance_create_depth(_xSpawn * 0.75, _ySpawn * 1.1, 10, obj_cable_blue_end,);



