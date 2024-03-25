function array_find_first(_array, _value)
{
	var _length = array_length(_array);
	
	for (var i = 0; i < _length; i++)
	{
		if (_array[i] == _value) return i;
	}
	
	return undefined
}