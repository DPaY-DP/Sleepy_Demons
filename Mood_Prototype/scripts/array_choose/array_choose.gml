function array_choose(array)
{
	var arrayLength = array_length(array);
	
	if (arrayLength == 0)
	{
		return false
	}
	if (argument_count == 1) return array[irandom(arrayLength - 1)];
	else
	{
		var list = [];
		for (var i = 0; i < argument_count; i++)
		{
			list[i] = argument[i][irandom(array_length(argument[i]) - 1)];
		}
		return array_choose(list);
	}
}
