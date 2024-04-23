//get inputs
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));

var weaNext = mouse_wheel_down() || keyboard_check_pressed(vk_space);
var weaPrev = mouse_wheel_up();

//##NEW
//get values
inRoom = instance_place(x, y, obj_room);

if (inRoom != noone) var _spd = spd - 2.5 * (inRoom.floodAmount);
else var _spd = spd;


//movement
var dir = point_direction(x, y, mouse_x, mouse_y);

var _newX = x + (right - left) * _spd;
var _newY = y + (down - up) * _spd;

if (!place_meeting(_newX, y, OBJ_collider)) x = _newX;
if (!place_meeting(x, _newY, OBJ_collider)) y = _newY;

image_angle = dir;


//draw self
draw_self();

//weapon
var _numberWeapons = array_length(weaponsAvailable);

if (_numberWeapons > 0)
{
	if (weaNext) 
	{
		weaponEquipped++;
		if (weaponEquipped == _numberWeapons) weaponEquipped = 0;
		weaponData = weaponsAvailable[weaponEquipped];
	}
	else if (weaPrev) 
	{
		weaponEquipped--;
		if (weaponEquipped == -1) weaponEquipped = _numberWeapons - 1;
		weaponData = weaponsAvailable[weaponEquipped];
	}
	
	var _dir = point_direction(x, y, mouse_x, mouse_y);
	
	draw_sprite_ext(spr_gunHeld, weaponData.number, x, y, 1, 1, _dir, c_white, 1);
	
	if (mouse_check_button(mb_left)) && (!instance_exists(obj_managerMinigame))
	{
		timerWeapon++;
		
		switch (weaponData.name)
		{
			case "nitequil":	var _newX = x + (right - left) * spd;
								var _newY = y + (down - up) * spd;
								var gun_x = x + lengthdir_x(gunDistance, image_angle + gunAngle);
								var gun_y = y + lengthdir_y(gunDistance, image_angle + gunAngle);
								var range_x = gun_x + lengthdir_x(rangeHitscan, image_angle);
								var range_y = gun_y + lengthdir_y(rangeHitscan, image_angle);
								
								var target = collision_line(gun_x, gun_y, range_x, range_y, OBJ_target, true, true);
			
								if (firstShot) || (timerWeapon > intervalNitequil)
								{
									firstShot = false;
									
									var _ef = ef_smoke;
									
									if (target == noone)
									{
										effect_create_above(_ef, range_x, range_y, 0, c_white);
										var contact_x = range_x;
										var contact_y = range_y;
									}
									else 
									{
										var contact_x = range_x;
										var contact_y = range_y;
										var percent_start = 0;
										var percent_end = 1;
										var distance_x = range_x - gun_x;
										var distance_y = range_y - gun_y;
										var iterations = ceil(log2(point_distance(gun_x, gun_y, range_x, range_y)));
										
										repeat (iterations) 
										{
										    var middle_way = (percent_end - percent_start) * 0.5 + percent_start;
										    var end_x = distance_x * middle_way + gun_x
										    var end_y = distance_y * middle_way + gun_y
										    var start_x = distance_x * percent_start + gun_x
										    var start_y = distance_y * percent_start + gun_y
										    var found = collision_line(start_x, start_y, end_x, end_y, OBJ_target, true, true)
											
										    if (found == noone) 
											{
										        percent_start = middle_way;
										    } 
											else 
											{
										        target = found
										        contact_x = end_x
										        contact_y = end_y
										        percent_end = middle_way
										    }
										}
									
										if (target.object_index == obj_wall)
										{ 
											effect_create_above(_ef, contact_x, contact_y, 0, c_orange);
										}
									
										if (object_is_ancestor(target.object_index, OBJ_enemy))
										if (target.vulnerable)
										{
											effect_create_above(_ef, contact_x, contact_y, 0, c_red);
											
											if(target.hp < target.hpMax)
											{
												target.hp++;
											}
										}
									}
									
									draw_line_color(x + lengthdir_x(gunDistance, image_angle + gunAngle), y + lengthdir_y(gunDistance, image_angle + gunAngle), contact_x, contact_y, #662D91, #662D91);
									
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
							
									instance_create_layer(x + lengthdir_x(gunDistance, image_angle + gunAngle), y + lengthdir_y(gunDistance, image_angle + gunAngle), "Instances", obj_bulletPyjama, { dir : _dir } );
									timerWeapon = 0;
								}
			break;
		}
	}
	else 
	{
		firstShot = true;
		timerWeapon = 0;
	}
}


//room 
inRoom = instance_place(x, y, obj_room);


//DEBUG
if (keyboard_check_pressed(ord("I"))) with (obj_enemyDemonSaboteur) switch_state(stateExecutable);
if (keyboard_check_pressed(ord("B"))) instance_create_depth(view_get_wport(0) / 2, view_get_hport(0) / 2, depth, obj_bhop);

draw_debug(firstShot)