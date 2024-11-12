//SETUP
if (instance_number(id) > 1) instance_destroy();


//IMMUTABLE VALUES
weaponsMain =
[
	obj_weaponMainPistol,
	obj_weaponMainShotgun,
	obj_weaponMainRifle,
];

weaponsEffect =
[
	obj_weaponGluelauncher,
	obj_weaponBlackhole,
	obj_weaponMiniyum,
];

weaponsEquipped = [];


//GAME VALUES
modeSelect = 0;

selected = [0, 0, 0];
spriteWeapon = [spr_weaponMenuMain, spr_weaponMenuOther, spr_weaponMenuOther];

shufflebag = [];


//METHODS
reload = function()
{
	if (array_length(shufflebag) == 0)
	{
		with (weaponsEquipped[1])
		{
			array_push(other.shufflebag, [1, ammoBag]);
			array_push(other.shufflebag, [1, ammoBag]);
		}
		with (weaponsEquipped[2])
		{
			array_push(other.shufflebag, [2, ammoBag]);
			array_push(other.shufflebag, [2, ammoBag]);
		}
		
		array_shuffle(shufflebag)
	}
	
	var _reload = array_pop(shufflebag);
	
	weaponsEquipped[_reload[0]].ammo += _reload[1];
}


//STATES
setup_state_machine();

stateGame = new State();
stateGame.start = function()
{
	weaponActive = 0;
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
		weaponActive = loop(weaponActive, 0, 2);
	
		weaponsEquipped[weaponActive].active = true;
	}
	
	if (keyboard_check_pressed(vk_anykey))
	{
		var _digit = string_digits(keyboard_lastchar)
		if (_digit != "") && (_digit < 4) && (_digit != 0)
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
	var _y = GUIheight * 0.7;
	for (var i = 1; i < 3; i++)
	{
		if (i == weaponActive) var _size = 2;
		else var _size = 1;
		
		show_debug_message(weaponsEquipped[i].name)
		draw_text_simple(GUIwidth * 0.05, _y, $"{weaponsEquipped[i].ammo} / {weaponsEquipped[i].ammoMax}", { size : _size / 2, halign : fa_left, valign : fa_top, font : font_dmg });
		_y += 80 * _size;
	}
	if (instance_exists(obj_playerHand)) var _ammo = obj_playerHand.ammo;
	else var _ammo = 0;
	draw_text_simple(GUIwidth * 0.05, _y, $"pilo: {_ammo}", { size : _size / 2, halign : fa_left, valign : fa_top, font : font_dmg });
}


stateSelect = new State();
stateSelect.start = function()
{
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
	
	var _x = GUIwidth / 6 * (1 + 2 * modeSelect);
	
	var _y = GUIheight * 0.4;
	draw_sprite_simple(spr_buton, selected[modeSelect], _x, _y,		{ size : _size });
	if (mouse_in_area_GUI(_x - _width / 2, _y - _height, _width, _height)) && (mouse_check_button_pressed(mb_left)) selected[modeSelect]++;
	
	var _y = GUIheight * 0.6;
	draw_sprite_simple(spr_buton, selected[modeSelect], _x, _y,		{ xscale : _size, yscale : -_size });
	if	(mouse_in_area_GUI(_x - _width / 2, _y, _width, _height)) && (mouse_check_button_pressed(mb_left)) selected[modeSelect]--;
	
	selected[modeSelect] = loop(selected[modeSelect], 0, sprite_get_number(spriteWeapon[modeSelect]) - 1);
	
	
	var _y = GUIheight * 0.9;
	var _size = 1 * global.GUIScale;
	var _width = sprite_get_width(spr_confrim)	* _size;
	var _height = sprite_get_height(spr_confrim)	* _size;
	draw_sprite_simple(spr_confrim, 0, _x, _y,		{ size : _size });
	if	((mouse_in_area_GUI(_x - _width / 2, _y - _height / 2, _width, _height)) && (mouse_check_button_pressed(mb_left))) ||
		(keyboard_check_pressed(vk_space)) modeSelect++;
	
	if (modeSelect == 3) room_goto(global.roomTo);
	
	
	//draw main
	draw_sprite_simple(spriteWeapon[0], selected[0], GUIwidth / 6, GUIheight / 2,		{ size : 6 * global.GUIScale });
	draw_sprite_simple(spriteWeapon[1], selected[1], GUIwidth / 6 * 3, GUIheight / 2,	{ size : 6 * global.GUIScale });
	draw_sprite_simple(spriteWeapon[2], selected[2], GUIwidth / 6 * 5, GUIheight / 2,	{ size : 6 * global.GUIScale });
}