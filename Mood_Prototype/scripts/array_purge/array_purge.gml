//searches an array and deletes a single entry from it

function array_purge(_array, _id)
{
	var _length = array_length(_array);
	for (var i = 0; i < _length; i++)
	{
		if (_array[i] == _id) 
		{
			array_delete(_array, i, 1);
			return _array;
		}
	}
	
	//show_debug_message("array_purge: unable to purge entry; not found");
	return _array;
}