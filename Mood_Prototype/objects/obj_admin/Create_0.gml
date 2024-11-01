GUIwidth = display_get_gui_width()
GUIheight = display_get_gui_height()

_ySpawn = GUIheight  ;
_xSpawn = GUIwidth ;
						
instance_create_depth(_xSpawn * 0.15, _ySpawn * 0.2, 10, obj_cable_blue_start,);
instance_create_depth(_xSpawn * 0.15, _ySpawn * 0.35, 10, obj_cable_yellow_start,);
instance_create_depth(_xSpawn * 0.15, _ySpawn * 0.5, 10, obj_cable_red_start,);
instance_create_depth(_xSpawn * 0.15, _ySpawn * 0.65, 10, obj_cable_green_start,);

instance_create_depth(_xSpawn * 0.75, _ySpawn * 0.2,  10, obj_cable_green_end,);
instance_create_depth(_xSpawn * 0.75, _ySpawn * 0.35, 10, obj_cable_red_end,);
instance_create_depth(_xSpawn * 0.75, _ySpawn * 0.5, 10, obj_cable_yellow_end,);
instance_create_depth(_xSpawn * 0.75, _ySpawn * 0.65, 10, obj_cable_blue_end,);



