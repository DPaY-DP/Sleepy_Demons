function struct_spill(struct)
{
	var arrayNames = variable_struct_get_names(struct);
	var lengthStruct = variable_struct_names_count(struct);
	
	for (var i = 0; i < lengthStruct; i++)
	{
		var currentVariableName = arrayNames[i];
		if (variable_instance_exists(self.id, currentVariableName)) 
		{
			//show_debug_message("##INFO## variable name '" + currentVariableName + "' already exists; overwritten");
		}
		
		variable_instance_set(self.id, currentVariableName, variable_struct_get(struct, currentVariableName));
	}
}