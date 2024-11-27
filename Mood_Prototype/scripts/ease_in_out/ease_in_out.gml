function ease_in_out(time, startVal, change, duration)
{
	time /= duration / 2;
	
	if (time < 1) return change / 2 * time * time + startVal;
	
	time--;
	return -change / 2 * (time * ( time - 2 ) - 1) + startVal;
}