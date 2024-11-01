function file_load(stringName)
{
	if file_exists(stringName) 
	{
		var _buffer = buffer_load(stringName);
		var jsonString = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
			
		var fileData = json_parse(jsonString);
		
		return fileData
	}
	
	return false
}