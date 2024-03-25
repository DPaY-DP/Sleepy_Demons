function ease_out(timer, startVal, change, duration)
{
	timer /= duration;
	timer = 1 - timer;
	
	var _return = change - (change * timer * timer * timer) + startVal;
	
	return _return
}