view_enabled = true;
view_visible[0] = true;

if (((windowWidth != 0) && (windowHeight != 0)))
{
	aspect_ratio = windowWidth / windowHeight;
	ideal_width = aspect_ratio * native_height;
	camera_set_view_size(cam, ideal_width, native_height);
	surface_resize(surface, windowWidth, windowHeight);
	alarm[0] = 1;
	
	window_size = [windowWidth, windowHeight];

	global.GUIScale = windowHeight / native_height;
}