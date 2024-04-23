function instance_place_list_array(_x, _y, _obj)
{
	var _list = ds_list_create();
	instance_place_list(_x, _y, _obj, _list, true);
	
	var _array = ds_list_to_array(_list);
	
	ds_list_destroy(_list);
	
	return _array
}