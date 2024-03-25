//get inputs
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));

var weaNext = mouse_wheel_down() || keyboard_check_pressed(vk_space);
var weaPrev = mouse_wheel_up();

var dir = point_direction(x, y, mouse_x, mouse_y);

var _newX = x + (right - left) * spd;
var _newY = y + (down - up) * spd;

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
	
	
	if (mouse_check_button(mb_left))
	{
		timerWeapon++;

		switch (weaponData.name)
		{
			case "nitequil":	if (timerWeapon > intervalNitequilCharge)
								if (timerWeapon > intervalNitequil + intervalNitequilCharge)
								{
									instance_create_layer(x, y, "Instances", obj_bulletNitequil, { dir : _dir });
									timerWeapon = intervalNitequilCharge;
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
	else timerWeapon = 0;
}


//gate arrow
if (!instance_exists(OBJ_enemy))
{	
	var _dirGate = point_direction(obj_player.x, obj_player.y, obj_gate.x, obj_gate.y);
	draw_sprite_ext(spr_arrowGate, 0, obj_player.x + lengthdir_x(40, _dirGate), obj_player.y + lengthdir_y(40, _dirGate), 1, 1, _dirGate, c_white, 1);
}