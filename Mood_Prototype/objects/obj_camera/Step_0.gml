//window resize
//run state machine
state.run();
timerState++;


//update window and surface size
if	((window_size[0] != windowWidth) || (window_size[1] != windowHeight)) &&
	((windowWidth != 0) && (windowHeight != 0))
{
	aspect_ratio = windowWidth / window_get_height();
	
	ideal_width = aspect_ratio * native_height;
	
	camera_set_view_size(cam, ideal_width, native_height);
	surface_resize(surface, windowWidth, windowHeight);
	alarm[0] = 1;
	
	window_size = [windowWidth, windowHeight];
	
	global.GUIScale = windowHeight / native_height;
}


//functions
if (global.debugmode)
{
	if (keyboard_check_pressed(vk_f12)) toggle_fullscreen();
}

//show_debug_message($"nissaan al gaib + {room}")


//DEBUG MESSAGE
//show_debug_message("");
//show_debug_message($"CAMERA      ## w: {camera_get_view_width(0)}, h: {camera_get_view_height(0)}");
//show_debug_message($"APP SURFACE ## w: {surface_get_width(surface)}, h: {surface_get_height(surface)}");
//show_debug_message($"WINDOW		 ## w: {window_get_width()}, h: {window_get_height()}");
//show_debug_message($"GUI LAYER   ## w: {display_get_gui_width()}, h: {display_get_gui_height()}");