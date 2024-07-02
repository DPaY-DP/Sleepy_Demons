function camera_view_move_smooth(camera, startX, startY, newX, newY, moveSpeed)
{
	var cameraX = camera_get_view_x(camera);
	var cameraY = camera_get_view_y(camera);
	
	var realSpeed = moveSpeed / 20;
	
	var absoluteDistance = point_distance(startX, startY, newX, newY);
	var maxSpeed = absoluteDistance * 0.02;
	var minSpeed = absoluteDistance * 0.005;
	
	var relativeDistance = point_distance(cameraX, cameraY, newX, newY);
	var relativeDistanceValue = relativeDistance * realSpeed;
	var relativeDistanceValue = closer_to_zero(maxSpeed, relativeDistanceValue);
	
	var dir = point_direction(cameraX, cameraY, newX, newY);
	
	if (point_distance(cameraX, cameraY, startX, startY) < absoluteDistance)
	{
		camera_set_view_pos(camera, cameraX + lengthdir_x(relativeDistanceValue + minSpeed, dir),
									cameraY + lengthdir_y(relativeDistanceValue + minSpeed, dir));
									
		return false
	}
	
	return true
}