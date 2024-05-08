if (global.timerYes = true)
{
	 

	global.timer --;
}
	if (global.timer == 0)
{
	instance_destroy(obj_horseshoe);
	instance_destroy(obj_horseshoeColliderRight);
	global.timerYes = false;
	global.timer = 40;
	instance_destroy(obj_horseshoeTracker4);
}