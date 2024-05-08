function draw_button_string(x, y, stringDisplay, dataString = {})
{	
	var _var;
	
	//text setup
	_var = variable_struct_get(dataString, "colorInactive");
	var stringColorInactive = (!is_undefined(_var)) ? _var : c_black;
	_var = variable_struct_get(dataString, "colorHover");
	var stringColorHover = (!is_undefined(_var)) ? _var : #ABA100;
	_var = variable_struct_get(dataString, "colorClicked");
	var stringColorClicked = (!is_undefined(_var)) ? _var : c_white;
	
	if (!is_undefined(variable_struct_get(dataString, "font")))
	{
		var fontInactive = dataString.font;
		var fontHover = dataString.font;
		var fontClicked = dataString.font;
	}
	else
	{
		_var = variable_struct_get(dataString, "fontInactive");
		var fontInactive = (!is_undefined(_var)) ? _var : undefined;
		_var = variable_struct_get(dataString, "fontHover");
		var fontHover = (!is_undefined(_var)) ? _var : undefined;
		_var = variable_struct_get(dataString, "fontClicked");
		var fontClicked = (!is_undefined(_var)) ? _var : undefined;
	}
	
	//functionality
	if (!is_undefined(fontInactive)) draw_set_font(fontInactive);
	
	var activeWidth = string_width(stringDisplay);
	var activeHeight = string_height(stringDisplay);
	
	var xTop = x;
	var yTop = y;
	
	var stringColor = stringColorInactive;
	var font = fontInactive;
	
	var returnVal = false;
	
	if (mouse_in_area(xTop, yTop, activeWidth, activeHeight))
	{
		stringColor = stringColorHover;
		font = fontHover;
		
		if (mouse_check_button(mb_left))
		{
			stringColor = stringColorClicked;
			font = fontClicked;
		}
		
		if (mouse_check_button_released(mb_left)) 
		{
			returnVal = true;
		}
	}
	
	if (is_string(stringDisplay)) draw_text_simple(x, y, stringDisplay, { valign : fa_top, halign : fa_left, color : stringColor, font : font });
	
	return returnVal;
}
