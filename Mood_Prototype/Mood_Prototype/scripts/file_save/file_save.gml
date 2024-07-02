function file_save(stringName, data, overwrite)
{
	if (file_exists(stringName))
	{
		if (!overwrite) return false
	}
	
	var jsonString = json_stringify(data);
	var _buffer = buffer_create(string_byte_length(jsonString) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, jsonString);
	buffer_save(_buffer, stringName);
	buffer_delete(_buffer);
	
	return true
}