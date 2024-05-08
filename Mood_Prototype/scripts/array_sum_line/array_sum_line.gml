function array_sum_line(array, line)
{
	var _sum = 0;
	for (var i = 0; i < array_length(array); i++)
	{
		_sum += array[i][line];
	}
	return _sum;
}
