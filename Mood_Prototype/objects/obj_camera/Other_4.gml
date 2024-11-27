view_enabled = true;
view_visible[0] = true;

if ((windowWidth != 0) && (windowHeight != 0))
{
	camera_set_view_size(cam, native_width, native_height)
	surface_resize(surface, windowWidth, windowHeight);
	alarm[0] = 1;
	
	window_size = [windowWidth, windowHeight];

	global.GUIScale = windowHeight / native_height;
}