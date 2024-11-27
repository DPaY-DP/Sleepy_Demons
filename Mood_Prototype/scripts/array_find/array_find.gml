function array_find(array,value)
{
	var lengthArray = array_length(array),
	
	for (var i = 0; i < lengthArray; i++)
	{
		if (array[i] == value) return i
	}
	
	return false
}