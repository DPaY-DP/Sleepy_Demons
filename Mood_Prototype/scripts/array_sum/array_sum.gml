function array_sum(array, abs)
{
	var _sum = 0;
	for (var i = 0; i < array_length(array); i++)
	{
		if (abs) _sum += abs(array[i]);
		else _sum += array[i];
	}
	return _sum;
}
