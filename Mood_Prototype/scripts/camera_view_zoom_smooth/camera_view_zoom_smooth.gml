function camera_view_zoom_smooth(camera, startX, startY, newX, newY, startWidth, startHeight, newWidth, newHeight, zoomSpeed)
{
	var move = camera_view_move_smooth(camera, startX, startY, newX, newY, zoomSpeed);
	var resize = camera_view_resize_smooth(camera, startWidth, startHeight, newWidth, newHeight, zoomSpeed);
	
	if ((!move) && (resize)) || ((move) && (!resize))
	{
		//show_debug_message("##ERROR## Misaligned:\nmove: " + string(move) + "\nresize: " + string(resize));
	}
	
	if (move && resize) return true
	
	return false
}