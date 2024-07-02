	//checks whether the given value is between value min and value max
	//check equals to enable checks for smallerEquals / greaterEquals
	
function in_range(value, minimum, maximum)
{
	if (value > minimum) && (value < maximum) return true
	
	return false
}

function in_range_equals(value, minimum, maximum)
{
	if (value >= minimum) && (value <= maximum) return true
	
	return false
}