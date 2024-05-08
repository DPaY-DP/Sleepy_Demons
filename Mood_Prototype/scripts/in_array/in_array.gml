function in_array(value, array)
{
	var lengthArray = array_length(array),
	
	for (var i = 0; i < lengthArray; i++)
	{
		if (array[i] == value) return true
	}
	
	return false
}

function in_array_pos(value, array)
{
	var lengthArray = array_length(array),
	
	for (var i = 0; i < lengthArray; i++)
	{
		if (array[i] == value) return i
	}
	
	return false
}