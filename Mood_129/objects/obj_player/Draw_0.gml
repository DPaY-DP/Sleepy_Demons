draw_self();

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