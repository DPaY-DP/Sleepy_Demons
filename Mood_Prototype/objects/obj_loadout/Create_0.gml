//SETUP
if (instance_number(id) > 1) instance_destroy();

global.loadoutLevel = room_shootingRange;


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

selectedMain = 0;

selected01 = 0;
selected02 = 1;

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
	var _y = GUIheight * 0.7;
	for (var i = 1; i < 3; i++)
	{
		if (i == weaponActive) var _size = 2;
		else var _size = 1;
		
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
	//get input
	var lmb = mouse_check_button_pressed(mb_left);
	var rmb = mouse_check_button_pressed(mb_right);
	var space = keyboard_check_pressed(vk_space);
	
	switch (modeSelect)
	{
		case 0:		if (lmb) selectedMain++;
					if (rmb) selectedMain--;
					selectedMain = loop(selectedMain, 0, sprite_get_number(spr_weaponMenuMain) - 1);
		break;
	
		case 1:		if (lmb) selected01++;
					if (rmb) selected01--;
					selected01 = loop(selected01, 0, sprite_get_number(spr_weaponMenuOther) - 1);
		break;
	
		case 2:		if (lmb) selected02++;
					if (rmb) selected02--;
					selected02 = loop(selected02, 0, sprite_get_number(spr_weaponMenuOther) - 1);
		break;
	}

	if (space) modeSelect++;
	
	if (modeSelect == 3) room_goto(global.loadoutLevel);
}
stateSelect.drawGUI = function()
{
	//draw main
	draw_sprite_simple(spr_weaponMenuMain, selectedMain, GUIwidth / 6, GUIheight / 2, { size : 4 });
	draw_sprite_simple(spr_weaponMenuOther, selected01, GUIwidth / 6 * 3, GUIheight / 2, { size : 4 });
	draw_sprite_simple(spr_weaponMenuOther, selected02, GUIwidth / 6 * 5, GUIheight / 2, { size : 4 });
}