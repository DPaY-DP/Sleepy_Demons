function ds_clone(dataStructure)
{
	if (is_struct(dataStructure))
	{
		var structLength = variable_struct_names_count(dataStructure);
		if (structLength == 0) return {}
	
		var structVariableNames = variable_struct_get_names(dataStructure);
	
		var newStruct = {};
		for (var i = 0; i < structLength; i++)
		{
			var currentStructVariableName = structVariableNames[i];
			var currentStructVariable = dataStructure[$ structVariableNames[i]];
			
			if (is_struct(currentStructVariable) || is_array(currentStructVariable))
			{
				newStruct[$ currentStructVariableName] = ds_clone(currentStructVariable);
			}
			else newStruct[$ currentStructVariableName] = currentStructVariable;
		}
	
		return newStruct
	}
	
	if (is_array(dataStructure))
	{
		var arrayLength = array_length(dataStructure);
		if (array_length == 0) return []
	
		var newArray = [];
		for (var i = 0; i < arrayLength; i++)
		{
			var currentContent = dataStructure[i];
			if (is_array(currentContent) || is_struct(currentContent)) 
			{
				newArray[i] = ds_clone(currentContent);
			}
			else newArray[i] = currentContent;
		}
	
		return newArray
	}
	
	show_debug_message($"##ds_clone: copied value is not a data structure: {dataStructure}");
	return dataStructure
}