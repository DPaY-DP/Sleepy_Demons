function ds_list_to_array(_dslist)
{
	if (!ds_list_empty(_dslist))
	{
	    var _length = ds_list_size(_dslist);
	}
	else return [];
	
	var _array = [];
	
	for (var i = 0; i < _length; i++)
	{
		_array[i] = _dslist[| i];
	}
	
	return _array;
}