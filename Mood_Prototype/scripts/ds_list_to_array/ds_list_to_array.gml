function ds_list_to_array(_ds_list)
{
	var _length = ds_list_size(_ds_list);	
	var _array = [];
	
	for (var i = 0; i < _length; i++)
	{
		_array[i] = _ds_list[| i];
	}
	
	return _array
}

function ds_list_to_array_transcribe(_ds_list, _array)
{
	var _length = ds_list_size(_ds_list);
	
	for (var i = 0; i < _length; i++)
	{
		_array[i] = _ds_list[| i];
	}
}