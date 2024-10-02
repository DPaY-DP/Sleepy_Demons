var _numberWeapons = array_length(weaponsAvailable);
if (_numberWeapons > 0)
{
	var _weapon = weaponsAvailable[weaponEquipped];
	var _inc = 20;
	
	var _size = 4;
	
	if (_weapon.ammo != infinity)
	for (var i = 0; i < _weapon.ammo; i++)
	{
		if (_weapon.number == 1) || (_weapon.number == 4)
		{
			_size = 3;
			_inc = 8;
		}
		
		if (_weapon.number == 2) || (_weapon.number == 3)
		{
			_size = 6;
			_inc = 36;
		}
		
		draw_sprite_simple(spr_bulletUI, _weapon.number, GUIwidth * 0.1, GUIheight * 0.9 - _inc * i, { size : _size });
	}
}