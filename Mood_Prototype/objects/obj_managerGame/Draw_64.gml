state.drawGUI();

if (global.debugmode)
{
	draw_text_simple(device_mouse_x_to_gui(0) + 16, device_mouse_y_to_gui(0) + 16, $"{mouse_x}, {mouse_y}", { color : c_red, font : font_upheaval_scalable, size : fontscale * 4 });
}