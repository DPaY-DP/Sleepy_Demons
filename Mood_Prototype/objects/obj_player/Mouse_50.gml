/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 268692A6
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)timerWeapon++;$(13_10)$(13_10)switch (weapon)$(13_10){$(13_10)	case "nitequil":	if (timerWeapon > intervalNitequil)$(13_10)						{$(13_10)							var _dir = point_direction(x, y, mouse_x, mouse_y);$(13_10)							$(13_10)							instance_create_layer(x, y, "Instances", obj_bulletNitequil, { dir : _dir });$(13_10)						}$(13_10)	break;$(13_10)	$(13_10)	case "pyjama":		var _charge = timerWeapon / intervalPyjamaCharge;$(13_10)						var _images = sprite_get_number(spr_interactioncircle);$(13_10)						var _image = round(_images * _charge);$(13_10)						_image = clamp(_image, 0, _images);$(13_10)						$(13_10)						draw_sprite(spr_interactioncircle, _images, x, y);$(13_10)	break;$(13_10)}"
/// @description Execute Code
timerWeapon++;

switch (weapon)
{
	case "nitequil":	if (timerWeapon > intervalNitequil)
						{
							var _dir = point_direction(x, y, mouse_x, mouse_y);
							
							instance_create_layer(x, y, "Instances", obj_bulletNitequil, { dir : _dir });
						}
	break;
	
	case "pyjama":		var _charge = timerWeapon / intervalPyjamaCharge;
						var _images = sprite_get_number(spr_interactioncircle);
						var _image = round(_images * _charge);
						_image = clamp(_image, 0, _images);
						
						draw_sprite(spr_interactioncircle, _images, x, y);
	break;
}