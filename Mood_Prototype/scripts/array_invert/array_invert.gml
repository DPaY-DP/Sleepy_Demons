function array_invert(array)
{
	var arrayInvert = [];
	var lengthArray = array_length(array);
	
	for (i = lengthArray - 1; i > -1; i--)
	{
		array_push(arrayInvert, array[i]);
	}
	
	return arrayInvert
}