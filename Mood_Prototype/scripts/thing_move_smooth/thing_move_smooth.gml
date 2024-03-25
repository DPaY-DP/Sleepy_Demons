function thing_move_smooth(object, startX, startY, newX, newY, moveSpeed)
{
	var realSpeed = moveSpeed / 20;
	
	var absoluteDistance = point_distance(startX, startY, newX, newY);
	var maxSpeed = absoluteDistance * 0.02;
	var minSpeed = absoluteDistance * 0.005;
	
	var relativeDistance = point_distance(object.x, object.y, newX, newY);
	var relativeDistanceValue = relativeDistance * realSpeed;
	var relativeDistanceValue = closest_to_zero(maxSpeed, relativeDistanceValue);
	
	var dir = point_direction(object.x, object.y, newX, newY);
	
	if (point_distance(object.x, object.y, startX, startY) < absoluteDistance)
	{
		object.x += lengthdir_x(relativeDistanceValue + minSpeed, dir);
		object.y += lengthdir_y(relativeDistanceValue + minSpeed, dir);
									
		return false
	}
	
	return true
}