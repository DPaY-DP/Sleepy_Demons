function draw_button_sprite(x, y, sprite, dataSprite = {})
{	
	var _var;
	
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
	
	//functionality
	var activeWidth = sprite_get_width(sprite) * spriteSizeInactive;
	var activeHeight = sprite_get_height(sprite) * spriteSizeInactive;
	
	var xTop = x;
	var yTop = y;
	
	var subimg = subimgInactive;
	var spriteSize = spriteSizeInactive;
		
	var returnVal = false;
	
	if (mouse_in_area(xTop, yTop, activeWidth, activeHeight))
	{
		subimg = subimgHover;
		
		spriteSize = spriteSizeHover;
		
		if (mouse_check_button(mb_left))
		{
			subimg = subimgClicked;
			spriteSize = spriteSizeClicked;
		}
		
		if (mouse_check_button_released(mb_left)) 
		{
			returnVal = true;
		}
	}
	
	if (sprite) draw_sprite_simple(sprite, subimg, x, y, { size : spriteSize });
	
	return returnVal;
}
