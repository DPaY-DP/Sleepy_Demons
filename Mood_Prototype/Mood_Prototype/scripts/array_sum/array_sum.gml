function array_sum(array)
{
	var _sum = 0;
	for (var i = 0; i < array_length(array); i++)
	{
		_sum += array[i];
	}
	return _sum;
}
