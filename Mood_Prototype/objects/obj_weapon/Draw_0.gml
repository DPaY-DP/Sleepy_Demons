var _numberWeapons = array_length(weaponsAvailable);
if (_numberWeapons > 0)
{	
	var _weapon = weaponsAvailable[weaponEquipped];
	
	//angle
	var _dir = point_direction(x, y, mouse_x, mouse_y);
	
	//functionality
	switch (_weapon.name)
	{
		case "nitequil": 						
		break;
		
		case "pyjama":							
		break;
		
		case "railgun":	var _dirBarrel = point_direction(0, 32, _weapon.xBarrel, _weapon.yBarrel);
						var _distBarrel = point_distance(0, 32, _weapon.xBarrel, _weapon.yBarrel);
								
						var _x = x + lengthdir_x(_distBarrel, _dirBarrel + image_angle);
						var _y = y + lengthdir_y(_distBarrel, _dirBarrel + image_angle);
						
						var _alpha = 0.8;
						var i = 0;
						
						show_debug_message(image_angle)
						
						while (_alpha > 0)
						{
							draw_sprite_simple(spr_laser, 0, _x + lengthdir_x(4, image_angle) * i, _y + lengthdir_y(4, image_angle) * i, { alpha : _alpha, angle : image_angle });
							
							_alpha -= 0.01;
							i++;
						}
		
		break;
		
		case "prowler":
		break;
		
		case "puddle":	
		break;
		
		case "repair":	
		break;
		
		case "catcher":	
		break;
	}
}

draw_self();