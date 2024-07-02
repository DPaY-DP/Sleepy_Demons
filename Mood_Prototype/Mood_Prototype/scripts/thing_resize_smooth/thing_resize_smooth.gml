function thing_resize_smooth(object, startVal, newVal, resizeSpeed)
{
	var realSpeed = resizeSpeed / 20;
	
	var absoluteDifference = newVal - startVal;
	var maxSpeed = absoluteDifference * 0.02;
	var minSpeed = absoluteDifference * 0.005;
	
	var relativeDifference = newVal - object.image_xscale;
	var relativeDifferenceValue = relativeDifference * realSpeed;
	var relativeDifferenceValue = closest_to_zero(maxSpeed, relativeDifferenceValue);
	
	if (abs(object.image_xscale - startVal) < abs(absoluteDifference))
	{
		object.image_xscale += relativeDifferenceValue + minSpeed;
		object.image_yscale += relativeDifferenceValue + minSpeed;
									
		return false
	}
	
	return true
}