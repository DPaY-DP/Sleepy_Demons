if (hpLast < 7)
{
	instance_activate_layer("Rooms_1");
	instance_deactivate_layer("Walls");
	instance_activate_layer("Walls_1");
	instance_activate_layer("Doors_1");
	instance_activate_layer("Enemies_1");
	show_debug_message("drückeberger");
}