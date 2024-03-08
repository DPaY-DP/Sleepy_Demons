/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 34DE2829
draw_self();

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 141361B1
/// @DnDArgument : "code" "if (keyboard_check_pressed(vk_space)) $(13_10)if (weapon = "nitequil") weapon = "pyjama"; else weapon = "nitequil";$(13_10)$(13_10)var _dir = point_direction(x, y, mouse_x, mouse_y);$(13_10)$(13_10)if (mouse_check_button(mb_left))$(13_10){$(13_10)	timerWeapon++;$(13_10)$(13_10)	switch (weapon)$(13_10)	{$(13_10)		case "nitequil":	if (timerWeapon > intervalNitequil)$(13_10)							{$(13_10)								instance_create_layer(x, y, "Instances", obj_bulletNitequil, { dir : _dir });$(13_10)								timerWeapon = 0;$(13_10)							}$(13_10)		break;$(13_10)	$(13_10)		case "pyjama":		var _images = sprite_get_number(spr_interactioncircle);$(13_10)	$(13_10)							if (timerWeapon < intervalPyjamaCharge)$(13_10)							{$(13_10)								var _charge = timerWeapon / intervalPyjamaCharge;$(13_10)								var _image = round(_images * _charge);$(13_10)								_image = clamp(_image, 0, _images);$(13_10)						$(13_10)								draw_sprite(spr_interactioncircle, _image, x, y);$(13_10)							}$(13_10)							else$(13_10)							{$(13_10)								draw_sprite(spr_interactioncircle, _images - 1, x, y);$(13_10)							$(13_10)								instance_create_layer(x, y, "Instances", obj_bulletPyjama, { dir : _dir });$(13_10)								timerWeapon = 0;$(13_10)							}$(13_10)		break;$(13_10)	}$(13_10)}"
if (keyboard_check_pressed(vk_space)) 
if (weapon = "nitequil") weapon = "pyjama"; else weapon = "nitequil";

var _dir = point_direction(x, y, mouse_x, mouse_y);

if (mouse_check_button(mb_left))
{
	timerWeapon++;

	switch (weapon)
	{
		case "nitequil":	if (timerWeapon > intervalNitequil)
							{
								instance_create_layer(x, y, "Instances", obj_bulletNitequil, { dir : _dir });
								timerWeapon = 0;
							}
		break;
	
		case "pyjama":		var _images = sprite_get_number(spr_interactioncircle);
	
							if (timerWeapon < intervalPyjamaCharge)
							{
								var _charge = timerWeapon / intervalPyjamaCharge;
								var _image = round(_images * _charge);
								_image = clamp(_image, 0, _images);
						
								draw_sprite(spr_interactioncircle, _image, x, y);
							}
							else
							{
								draw_sprite(spr_interactioncircle, _images - 1, x, y);
							
								instance_create_layer(x, y, "Instances", obj_bulletPyjama, { dir : _dir });
								timerWeapon = 0;
							}
		break;
	}
}