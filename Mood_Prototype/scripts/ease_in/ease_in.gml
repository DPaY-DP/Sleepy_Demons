function ease_in(timeVal, startVal, change, duration)
{
	timeVal /= duration;
	
	var _return = change * timeVal * timeVal * timeVal + startVal;
	
	return _return
}