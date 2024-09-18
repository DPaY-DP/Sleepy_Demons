function file_save(stringName, data, overwrite)
{
	show_debug_message(data)
	show_debug_message("save:")
	if (file_exists(stringName))
	{
		if (!overwrite) return false
	}
	
	show_debug_message(data)
	
	var jsonString = json_stringify(data);
	show_debug_message(jsonString)
	var _buffer = buffer_create(string_byte_length(jsonString) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, jsonString);
	buffer_save(_buffer, stringName);
	buffer_delete(_buffer);
	
	return true
}