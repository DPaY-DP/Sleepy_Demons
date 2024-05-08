function array_sum_abs(array)
{
	var _sum = 0;
	for (var i = 0; i < array_length(array); i++)
	{
		_sum += abs(array[i]);
	}
	return _sum;
}
