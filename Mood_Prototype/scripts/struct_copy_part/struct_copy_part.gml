function struct_copy_part(sourceStruct, arrayVariableNames) constructor
{
	var lengthNames = array_length(arrayVariableNames);
	for (var i = 0; i < lengthNames; i++)
	{
		var currentVar = arrayVariableNames[i];
		self[$ currentVar] = sourceStruct[$ currentVar];
	}
}