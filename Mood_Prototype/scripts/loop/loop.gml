function loop(value, minValue, maxValue)
{	
	if (value > maxValue)
	{
		var range = maxValue - minValue;
		
		do value -= range + 1
		until (value <= maxValue)
	}
	
	if (value < minValue)
	{
		var range = maxValue - minValue;
		
		do value += range + 1
		until (value >= minValue)
	}
	
	return value
}