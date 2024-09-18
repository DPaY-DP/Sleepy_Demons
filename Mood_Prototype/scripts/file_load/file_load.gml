function file_load(stringName)
{
	if file_exists(stringName) 
	{
		var _buffer = buffer_load(stringName);
		
		show_debug_message(_buffer)
		
		var jsonString = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		
		show_debug_message(jsonString)
			
		var fileData = json_parse(jsonString);
		
		show_debug_message(fileData)
		
		return fileData
	}
	
	return false
}