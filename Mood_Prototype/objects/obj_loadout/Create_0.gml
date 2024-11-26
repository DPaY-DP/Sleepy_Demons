//SETUP
if (instance_number(id) > 1) instance_destroy();


//IMMUTABLE VALUES


//GAME VALUES
weaponsMain = global.save.weaponsUnlocked.main;
weaponsEffect = global.save.weaponsUnlocked.effect;

modeSelect = 0;

selected = [0, 0, 0];
spriteWeapon = [spr_weaponMenuMain, spr_weaponMenuEffect, spr_weaponMenuEffect];

shufflebag = [];


//METHODS
reload = function()
{
	if (weaponsMax < 2) exit;
	
	if (array_length(shufflebag) == 0)
	{
			//we could do this with a for loop if we ever wanna create more weapon slots
		with (weaponsEquipped[1])
		{
			array_push(other.shufflebag, [1, ammoBag]);
			array_push(other.shufflebag, [1, ammoBag]);
		}
		if (weaponsEquipped[2] != noone) with (weaponsEquipped[2])
		{
			array_push(other.shufflebag, [2, ammoBag]);
			array_push(other.shufflebag, [2, ammoBag]);
		}
		
		array_shuffle(shufflebag);
	}
	
	var _shufflebag = array_pop(shufflebag);
	
	var _weapon = weaponsEquipped[_shufflebag[0]];
	var _reload = _shufflebag[1];
	
	_weapon.ammo += _reload;
	_weapon.ammo = clamp(_weapon.ammo, 0, _weapon.ammoMax);
	
	return _shufflebag;
}


//SETUP AND SPAWNING



//STATES
setup_state_machine();

stateGame = new State();
stateGame.start = function()
{
	weaponActive = 0;
	
	if (weaponsMax > 0) weaponsEquipped[0] = instance_create_layer(obj_player.x, obj_player.y, "Weapons", weaponsMain[selected[0]][1]);
	if (weaponsMax > 1) weaponsEquipped[1] = instance_create_layer(obj_player.x, obj_player.y, "Weapons", weaponsEffect[selected[1]][1]);
	if (weaponsMax > 2) weaponsEquipped[2] = instance_create_layer(obj_player.x, obj_player.y, "Weapons", weaponsEffect[selected[2]][1]);
}
stateGame.run = function()
{
	if (weaponsMax == 0) exit;
	
	var mwUp = mouse_wheel_up();
	var mwDown = mouse_wheel_down();
	
	//switch
	var _switch = mwDown - mwUp;
	if (_switch != 0)
	{
		weaponsEquipped[weaponActive].active = false;
		
		weaponActive += _switch;
		weaponActive = loop(weaponActive, 0, weaponsMax - 1);
	
		weaponsEquipped[weaponActive].active = true;
	}
	
	if (keyboard_check_pressed(vk_anykey))
	{
		var _digit = string_digits(keyboard_lastchar)
		if (_digit != "") && (_digit <= weaponsMax) && (_digit != 0)
		{
			weaponsEquipped[weaponActive].active = false;
			weaponActive = _digit - 1;
			weaponsEquipped[weaponActive].active = true;
		}
	}
}
stateGame.drawGUI = function()
{
		//ammo in game
	var _size = 1;
	var _y = GUIheight * 0.7;
	for (var i = 1; i < weaponsMax; i++)
	{
		if (i == weaponActive) var _size = 2;
		//else var _size = 1;
		
		draw_text_simple(GUIwidth * 0.05, _y, $"{weaponsEquipped[i].ammo} / {weaponsEquipped[i].ammoMax}", { size : _size / 2, halign : fa_left, valign : fa_top, font : font_dmg });
		_y += 80 * _size;
	}
	if (instance_exists(obj_weaponPillow)) var _ammo = obj_weaponPillow.ammo;
	else var _ammo = 0;
	draw_text_simple(GUIwidth * 0.05, _y, $"pilo: {_ammo}", { size : _size / 2, halign : fa_left, valign : fa_top, font : font_dmg });
}


stateSelect = new State();
stateSelect.start = function()
{
	weaponsEquipped = [noone, noone, noone];
	modeSelect = 0;

	var _level = global.save.levels[get_level_id(global.roomTo)];
	
	if (_level.loadoutWeapons == 0)
	{
		weaponsMax = 0;
		room_goto(global.roomTo);
		exit;
	}
	else
	{
		weaponsMax = _level.loadoutWeapons;
	}
}
stateSelect.run = function()
{	
}
stateSelect.drawGUI = function()
{
	draw_text_simple(GUIwidth / 2, GUIheight * 0.1, "SELECT LOADOUT", { font : font_upheaval_scalable, size : fontscale * 12 });
	
	//draw buttons
	var _size = 2 * global.GUIScale;
	var _width = sprite_get_width(spr_buton)	* _size;
	var _height = sprite_get_height(spr_buton)	* _size;
	
	var _keyDown =	(keyboard_check_pressed(ord("S"))) ||	(keyboard_check_pressed(vk_down)) ||	mouse_wheel_down();
	var _keyUp =	(keyboard_check_pressed(ord("W"))) ||	(keyboard_check_pressed(vk_up))	||		mouse_wheel_up();
	
	var _selectionChange = 0;
	
	var _x = GUIwidth / 6 * (1 + 2 * modeSelect);
	
	var _y = GUIheight * 0.4;
	draw_sprite_simple(spr_buton, selected[modeSelect], _x, _y,		{ size : _size });
	if	((mouse_in_area_GUI(_x - _width / 2, _y - _height, _width, _height)) && (mouse_check_button_pressed(mb_left))) ||
		(_keyUp) _selectionChange++;
	
	var _y = GUIheight * 0.6;
	draw_sprite_simple(spr_buton, selected[modeSelect], _x, _y,		{ xscale : _size, yscale : -_size });
	if	((mouse_in_area_GUI(_x - _width / 2, _y, _width, _height)) && (mouse_check_button_pressed(mb_left))) ||
		(_keyDown) _selectionChange--;
	
	selected[modeSelect] += _selectionChange;
	selected[modeSelect] = loop(selected[modeSelect], 0, sprite_get_number(spriteWeapon[modeSelect]) - 1);
	
	if (modeSelect == 1)
	{
		while (!weaponsEffect[selected[modeSelect]][0])
		{
			selected[modeSelect] += _selectionChange;
			selected[modeSelect] = loop(selected[modeSelect], 0, sprite_get_number(spriteWeapon[modeSelect]) - 1);
			show_debug_message(selected[modeSelect])
		}
	}
	
	if (modeSelect == 2)
	{
		while (!weaponsEffect[selected[modeSelect]][0]) || (selected[modeSelect] == selected[modeSelect - 1])
		{
			selected[modeSelect] += _selectionChange;
			selected[modeSelect] = loop(selected[modeSelect], 0, sprite_get_number(spriteWeapon[modeSelect]) - 1);
			show_debug_message(selected[modeSelect])
		}
	}
	
	
	var _y = GUIheight * 0.9;
	var _size = 1 * global.GUIScale;
	var _width = sprite_get_width(spr_confrim)	* _size;
	var _height = sprite_get_height(spr_confrim)	* _size;
	draw_sprite_simple(spr_confrim, 0, _x, _y,		{ size : _size });
	if	((mouse_in_area_GUI(_x - _width / 2, _y - _height / 2, _width, _height)) && (mouse_check_button_pressed(mb_left))) ||
		(keyboard_check_pressed(vk_space)) 
	{
		modeSelect++;
		
		if (modeSelect == 2)
		if (selected[modeSelect - 1] == selected[modeSelect])
		{
			selected[modeSelect]++;
			while (!weaponsEffect[selected[modeSelect]][0])
			{
				selected[modeSelect]++;
				selected[modeSelect] = loop(selected[modeSelect], 0, sprite_get_number(spriteWeapon[modeSelect]) - 1);
			}
		}
	}
	
	if (modeSelect == weaponsMax) 
	{
		show_debug_message("weaponsMax")
		room_goto(global.roomTo);
	}
	
	
	//draw main
	draw_sprite_simple(spriteWeapon[0], selected[0], GUIwidth / 6, GUIheight / 2,		{ size : 6 * global.GUIScale });
	
	//draw effect
	if (weaponsMax > 1) 
	{
		draw_sprite_simple(spriteWeapon[1], selected[1], GUIwidth / 6 * 3, GUIheight / 2,	{ size : 6 * global.GUIScale });
	}
	else
	{
		draw_sprite_simple(spr_weaponMenuNone, 0, GUIwidth / 6 * 3, GUIheight / 2,	{ size : 6 * global.GUIScale });
	}
	
	if (weaponsMax > 2) 
	{
		draw_sprite_simple(spriteWeapon[2], selected[2], GUIwidth / 6 * 5, GUIheight / 2,	{ size : 6 * global.GUIScale });
	}
	else
	{
		draw_sprite_simple(spr_weaponMenuNone, 0, GUIwidth / 6 * 5, GUIheight / 2,	{ size : 6 * global.GUIScale });
	}
}