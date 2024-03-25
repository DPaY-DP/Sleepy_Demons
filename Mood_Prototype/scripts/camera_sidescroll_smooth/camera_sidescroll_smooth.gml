function camera_sidescroll_smooth(camera, follow, limit, range, maxSpd)
{
	//var cameraX = camera_get_view_x(camera);
	//var cameraSize = camera_get_view_width(camera);
	
	//var viewCenter = cameraX + cameraSize / 2;
	
	//var limitLeft = viewCenter - limit;
	//var limitRight = viewCenter + limit;
	//var rangeLeft = limitLeft - range;
	//var rangeRight = limitRight + range;
	
	//var relativePos = follow.x - cameraX + cameraSize;
	
	//if	(relativePos < limitLeft)
	//{
	//	var _dist = limitLeft - relativePos;
	//	var spd = -maxSpd * (_dist / range);
		
	//	camera_set_view_pos(camera, cameraX + spd, 0);
	//}
	
	//if	(relativePos > limitRight)
	//{
	//	var _dist = relativePos - limitRight;
	//	var spd = maxSpd * (_dist / range);
		
	//	camera_set_view_pos(camera, cameraX + spd, 0);
	//}
	
	//show_debug_message($"viewCenter: {viewCenter}; relativePos: {relativePos};\nlimitLeft: {limitLeft}; limitRight: {limitRight}");
	
	var camX = camera_get_view_x(view_camera[0]);
	var camY = camera_get_view_y(view_camera[0]);
	
	var toX = obj_player.x - 320;
	var toY = obj_player.y;
	
	var distX = toX - camX;
	var distY = toY - camY;
	
	camera_set_view_pos(view_camera[0], min(2580 - 640, camX + distX / 20), 0);
}