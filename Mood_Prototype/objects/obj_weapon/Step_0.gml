//get input
var left = mouse_check_button_pressed(mb_left);
var left_held = mouse_check_button(mb_left);
var right = mouse_check_button_pressed(mb_right);

var weaNext = mouse_wheel_down() || keyboard_check_pressed(vk_space);
var weaPrev = mouse_wheel_up();

//weapons
var _numberWeapons = array_length(weaponsAvailable);

if (_numberWeapons > 0)
{
	//switching
	var _switch = weaNext - weaPrev;
	if (_switch != 0) && (!ability)
	{
		weaponEquipped += _switch;
		show_debug_message(weaponEquipped);
		if (weaponEquipped == _numberWeapons) weaponEquipped = 0;
		else if (weaponEquipped == -1) weaponEquipped = _numberWeapons - 1;
		weaponData = weaponsAvailable[weaponEquipped];
		
		timerFireRate = 0;
	}
	
	var _weapon = weaponsAvailable[weaponEquipped];
	
	//angle
	var _dir = point_direction(x, y, mouse_x, mouse_y);
	
	//functionality
	switch (_weapon.name)
	{
		case "nitequil": if (key_primary) && (timerFireRate <= 0)
						{
							instance_create_depth(x, y, depth + 1, _weapon.projectile, { image_angle : image_angle, punch : _weapon.punch, 
								damage : _weapon.damage });
							obj_player.x -= lengthdir_x(_weapon.punch, image_angle);
							obj_player.y -= lengthdir_y(_weapon.punch, image_angle);
							timerFireRate = _weapon.firerate;
						}
						
						if (key_secondary)
						{
							instance_create_depth(x, y, depth + 1, obj_projectileDart, { image_angle : image_angle, punch : _weapon.punch, 
								damage : 0 });
								
							obj_player.hvel -= lengthdir_x(_weapon.punch, image_angle);
							obj_player.vvel -= lengthdir_y(_weapon.punch, image_angle);
							timerFireRate = _weapon.firerateSecondary;
						}
						
		break;
		
		case "pyjama":	if (key_primary) && (timerFireRate <= 0)
						{
							instance_create_depth(x, y, depth + 1, _weapon.projectile, { image_angle : image_angle, punch : _weapon.punch, 
								damage : _weapon.damage, area : _weapon.area, range : _weapon.range });
							obj_player.hvel -= lengthdir_x(_weapon.punch, image_angle);
							obj_player.vvel -= lengthdir_y(_weapon.punch, image_angle);
							timerFireRate = _weapon.firerate;
						}
						
						if (key_secondary_held)
						{
							timerLaunch--;
							if (timerLaunch == 0)
							{
								instance_create_depth(x, y, depth + 1, _weapon.projectile, { image_angle : image_angle, punch : _weapon.punch, 
									damage : _weapon.damage, area : _weapon.area, range : 0 });
								
								obj_player.hvel -= lengthdir_x(_weapon.launch, image_angle);
								obj_player.vvel -= lengthdir_y(_weapon.launch, image_angle);
								
								timerLaunch = intervalLaunch;
							}
						}
		break;
		
		case "railgun":	if (key_primary) && (timerFireRate <= 0) && (!ability)
						{
							audio_play_sound(snd_railgun_full, 0, 0);
							ability = true;
							delay = _weapon.delay;
						}
						
						if (ability)
						{
							delay--;
							if (delay == 0) 
							{
								var _dirBarrel = point_direction(0, 32, _weapon.xBarrel, _weapon.yBarrel);
								var _distBarrel = point_distance(0, 32, _weapon.xBarrel, _weapon.yBarrel);
								
								var _x = x + lengthdir_x(_distBarrel, _dirBarrel + image_angle);
								var _y = y + lengthdir_y(_distBarrel, _dirBarrel + image_angle);
								
								instance_create_depth(_x, _y, depth + 1, _weapon.projectile, { image_angle : image_angle, punch : _weapon.punch, damage : _weapon.damage, xBarrel : _weapon.xBarrel, yBarrel : _weapon.yBarrel });
								
								obj_player.hvel -= lengthdir_x(_weapon.punch, image_angle);
								obj_player.vvel -= lengthdir_y(_weapon.punch, image_angle);
							
								ability = false;
								timerFireRate = _weapon.firerate;
							}
						}
		break;
		
		case "prowler":	if (key_primary) && (timerFireRate <= 0) && (!ability)
						{
							ability = true;
							burst = _weapon.burst;
						}
						
						if (ability)
						{
							hitReport = [undefined, 0];
		
							timer_burstfire--;
							if (timer_burstfire <= 0)
							{
								burst--;
								audio_play_sound(snd_prowler2, 0, 0);
								instance_create_depth(x, y, depth + 1, _weapon.projectile, { image_angle : image_angle, last : (burst == 0), punch : _weapon.punch, damage : _weapon.damage });
								obj_player.hvel -= lengthdir_x(_weapon.punch, image_angle);
								obj_player.vvel -= lengthdir_y(_weapon.punch, image_angle);
								timerFireRate = _weapon.firerate;
			
								timer_burstfire = _weapon.burstrate;
							}
		
							if (burst == 0)
							{
								ability = 0;
								timerFireRate = _weapon.firerate;
							}
						}
							
		break;
		
		case "puddle":	
							
		break;
		
		case "repair":	if (key_primary_held)
						{
								var _dirBarrel = point_direction(0, 32, _weapon.xBarrel, _weapon.yBarrel);
								var _distBarrel = point_distance(0, 32, _weapon.xBarrel, _weapon.yBarrel);
								
								var _x = x + lengthdir_x(_distBarrel, _dirBarrel + image_angle);
								var _y = y + lengthdir_y(_distBarrel, _dirBarrel + image_angle);
								
								if (timerFireRate <= 0)
								{
									instance_create_depth(_x, _y, depth + 1, _weapon.projectile, { dir : image_angle, damage : _weapon.damage + irandom(2) });
									obj_player.hvel -= lengthdir_x(_weapon.punch, image_angle);
									obj_player.vvel -= lengthdir_y(_weapon.punch, image_angle);
									timerFireRate = _weapon.firerate;
								}
								else
								{
									instance_create_depth(_x, _y, depth + 1, _weapon.projectile, { dir : image_angle + random_range(-10, 10), damage : 0 });
									obj_player.hvel -= lengthdir_x(_weapon.punch, image_angle);
									obj_player.vvel -= lengthdir_y(_weapon.punch, image_angle);
								}
						}
		
		break;
		
		case "catcher":	if (key_primary) && (timerFireRate <= 0)
						{
							audio_play_sound(snd_extendoThrow, 0, 0);
							
							instance_create_depth(x, y, depth + 1, _weapon.projectile, { image_angle : image_angle });
							obj_player.hvel -= lengthdir_x(_weapon.punch, image_angle);
							obj_player.vvel -= lengthdir_y(_weapon.punch, image_angle);
							timerFireRate = _weapon.firerate;
						}
		break;
	}
	
	
	
	
	timerFireRate--;
}