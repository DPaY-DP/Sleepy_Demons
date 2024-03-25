function ease_in(timer, startVal, change, duration)
{
	timer /= duration;
	
	var _return = change * timer * timer * timer + startVal;
	
	return _return
}