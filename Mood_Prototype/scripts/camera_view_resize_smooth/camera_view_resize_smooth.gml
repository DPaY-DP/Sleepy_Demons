function camera_view_resize_smooth(camera, startWidth, startHeight, newWidth, newHeight, resizeSpeed)
{
	var cameraViewWidth = camera_get_view_width(camera);
	var cameraViewHeight = camera_get_view_height(camera);
	
	var realSpeed = resizeSpeed / 20;
	
	//width
	var absoluteDifferenceWidth = newWidth - startWidth;
	var maxSpeedWidth = absoluteDifferenceWidth * 0.02;
	var minSpeedWidth = absoluteDifferenceWidth * 0.005;
	
	var relativeDifferenceWidth = newWidth - cameraViewWidth;
	var relativeDifferenceValueWidth = relativeDifferenceWidth * realSpeed;
	var relativeDifferenceValueWidth = closest_to_zero(maxSpeedWidth, relativeDifferenceValueWidth);
	
	//height	
	var absoluteDifferenceHeight = newHeight - startHeight;
	var maxSpeedHeight = absoluteDifferenceHeight * 0.02;
	var minSpeedHeight = absoluteDifferenceHeight * 0.005;
	
	var relativeDifferenceHeight = newHeight - cameraViewHeight;
	var relativeDifferenceValueHeight = relativeDifferenceHeight * realSpeed;
	var relativeDifferenceValueHeight = closest_to_zero(maxSpeedHeight, relativeDifferenceValueHeight);
	
	var returnTrue = true;
	
	if (abs(cameraViewWidth - startWidth) < abs(absoluteDifferenceWidth))
	{
		camera_set_view_size(camera,	cameraViewWidth + relativeDifferenceValueWidth + minSpeedWidth,
										cameraViewHeight + relativeDifferenceValueHeight + minSpeedHeight);
										
		return false
	}
	
	return true
}