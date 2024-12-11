//SETUP


//IMMUTABLE VALUES


//GAME VALUES
weaponsMax = 3;


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
	
	weaponsEquipped[0] = instance_create_layer(obj_player.x, obj_player.y, "Weapons", obj_weaponMainPistol);
	weaponsEquipped[1] = instance_create_layer(obj_player.x, obj_player.y, "Weapons", obj_weaponGluelauncherTutorial);
	weaponsEquipped[2] = instance_create_layer(obj_player.x, obj_player.y, "Weapons", obj_weaponBlackholeTutorial);
}
stateGame.run = function()
{	
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
	//tutorial messaging
	draw_text_simple(GUIwidth * 0.5, GUIheight * 0.75, "< your ammo",   { font : font_upheaval_scalable, size : fontscale * 8, halign : fa_center, valign: fa_top, color : c_black });
	draw_text_simple(GUIwidth * 0.5, GUIheight * 0.82, "reloads >", { font : font_upheaval_scalable, size : fontscale * 8, halign : fa_center, valign: fa_top, color : c_black });
	
	
	if (weaponActive == 0) 
	{
		if (instance_exists(obj_weaponPillow))
		{
			var _y = GUIheight * 0.9;
			var _offset = 10 * global.GUIScale;
		
			for(var i = 0; i < obj_weaponPillow.ammo; i++)
			{				
				var _x = GUIwidth * 0.05 + i * sprite_get_width(spr_pillow) * global.GUIScale + _offset;
				draw_sprite_simple(spr_pillow, 0, _x, _y, {color : c_dkgray, xscale : 1.1 * global.GUIScale, yscale : 1.1 * global.GUIScale});
				draw_sprite_simple(spr_pillow, 0, _x, _y,{xscale : global.GUIScale, yscale : global.GUIScale});
			}
		}
		exit;
	}
	
		//ammo in game
	var _weapon = weaponsEquipped[weaponActive];
	
	var _ammo = _weapon.ammo;
	var _ammoMax = _weapon.ammoMax;
	
	var _image = _weapon.ammoImage;
	var _sizeAmmo = _weapon.ammoImageSize;
	var _spaceAmmo = 0;
	
	var _widthAmmo = 4.5 * _sizeAmmo * global.GUIScale;
	var _abacusSpace = 10 * global.GUIScale;
	var _abacusOffset = 12 * global.GUIScale + _widthAmmo / 2;
	
	var _width = 150 * global.GUIScale;      //_widthAmmo * _ammoMax + _abacusSpace;
	var _abacusSize = (_width + _abacusSpace) / sprite_get_width(spr_abacus);
	
	var _x = GUIwidth * 0.05;
	var _y = GUIheight * 0.9;

	var _rows = 1;
	var _ammoPerRow = _ammoMax;
	var _fullWidth = _ammoMax * _widthAmmo + _abacusSpace + _abacusOffset * 2;
	if (_width < _fullWidth) 
	{
		_rows = ceil(_fullWidth / _width);
		_ammoPerRow = ceil(_ammoMax / _rows);
	}
	
	var _spent = array_create(_rows, 0);
	for (var i = 0; i < _rows; i++)
	{
		draw_sprite_simple(spr_abacus, 0, _x, _y, { xscale : _abacusSize });
		
		for (var l = 0; l < _ammoPerRow; l++)
		{
			show_debug_message(i * _ammoPerRow + l)
			
			if (i * _ammoPerRow + l >= _ammoMax) break;
			
			if (i * _ammoPerRow + l < _ammo)
			{	
				draw_sprite_simple(spr_looseAmmo, _image, _x + _abacusSpace + _width - _abacusOffset - (_widthAmmo + _spaceAmmo) * l, _y, { angle : 90, size : _sizeAmmo });
			}
			else
			{
				draw_sprite_simple(spr_looseAmmo, _image, _abacusOffset + _x + _widthAmmo * _spent[i], _y, { angle : 90, size : _sizeAmmo, color : c_grey });				
				_spent[i]++;
				
				show_debug_message(_spent[i])
			}
		}
	
		_y -= GUIheight * 0.04;
	}
}