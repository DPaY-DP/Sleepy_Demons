function draw_button_sprite_string(x, y, dataSprite = {}, dataString = {})
{	
	var _var;
	
	var sprite = dataSprite.sprite;
	var stringDisplay = dataString.stringDisplay;
	
	//sprite setup
	_var = variable_struct_get(dataSprite, "subimgInactive");
	var subimgInactive = (!is_undefined(_var)) ? _var : 0;
	_var = variable_struct_get(dataSprite, "subimgHover");
	var subimgHover = (!is_undefined(_var)) ? _var : 1;
	_var = variable_struct_get(dataSprite, "subimgClicked");
	var subimgClicked = (!is_undefined(_var)) ? _var : 2;
	_var = variable_struct_get(dataSprite, "subimgActive");
	var subimgActive = (!is_undefined(_var)) ? _var : 3;
		
	_var = variable_struct_get(dataSprite, "sizeInactive");
	var spriteSizeInactive = (!is_undefined(_var)) ? _var : 1;
	_var = variable_struct_get(dataSprite, "sizeHover");
	var spriteSizeHover = (!is_undefined(_var)) ? _var : 1;
	_var = variable_struct_get(dataSprite, "sizeClicked");
	var spriteSizeClicked = (!is_undefined(_var)) ? _var : 1;
	_var = variable_struct_get(dataSprite, "sizeActive");
	var spriteSizeActive = (!is_undefined(_var)) ? _var : 1;
	
	//text setup
	_var = variable_struct_get(dataString, "colorInactive");
	var stringColorInactive = (!is_undefined(_var)) ? _var : c_black;
	_var = variable_struct_get(dataString, "colorHover");
	var stringColorHover = (!is_undefined(_var)) ? _var : #ABA100;
	_var = variable_struct_get(dataString, "colorClicked");
	var stringColorClicked = (!is_undefined(_var)) ? _var : c_white;
	_var = variable_struct_get(dataString, "colorActive");
	var stringColorActive = (!is_undefined(_var)) ? _var : c_red;
		
	_var = variable_struct_get(dataString, "fontInactive");
	var fontInactive = (!is_undefined(_var)) ? _var : undefined;
	_var = variable_struct_get(dataString, "fontHover");
	var fontHover = (!is_undefined(_var)) ? _var : undefined;
	_var = variable_struct_get(dataString, "fontClicked");
	var fontClicked = (!is_undefined(_var)) ? _var : undefined;
	_var = variable_struct_get(dataString, "fontActive");
	var fontActive = (!is_undefined(_var)) ? _var : undefined;
	
	//functionality
	var activeWidth = sprite_get_width(sprite) * spriteSizeInactive;
	var activeHeight = sprite_get_height(sprite) * spriteSizeInactive;
	
	var xTop = x;
	var yTop = y;
	
	var subimg = subimgInactive;
	var spriteSize = spriteSizeInactive;
		
	var stringColor = stringColorInactive;
	var font = fontInactive;
	
	var returnVal = false;
	
	if (mouse_in_area(xTop, yTop, activeWidth, activeHeight))
	{
		subimg = subimgHover;
		spriteSize = spriteSizeHover;
			
		stringColor = stringColorHover;
		font = fontHover;
		
		if (mouse_check_button(mb_left))
		{
			subimg = subimgClicked;
			spriteSize = spriteSizeClicked;
				
			stringColor = stringColorClicked;
			font = fontClicked;
		}
		
		if (mouse_check_button_released(mb_left)) 
		{
			returnVal = true;
		}
	}
	
	draw_sprite_simple(sprite, subimg, x, y, { size : spriteSize });
	draw_text_simple(x, y, stringDisplay, { valign : fa_top, halign : fa_left, color : stringColor, font : font });
	
	return returnVal;
}
