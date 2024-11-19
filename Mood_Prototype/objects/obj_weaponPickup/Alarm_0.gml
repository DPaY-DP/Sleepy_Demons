if (type == "main") 
{
	sprite_index = spr_weaponPickupMain;
	
	var _length = array_length(obj_loadout.weaponsMain);
	for (var i = 0; i < _length; i++)
	{
		var _weapon = obj_loadout.weaponsMain[i][1];
		
		if (objectWeapon == _weapon) 
		{
			image_index = i;
			break;
		}
	}
}
else
{
	sprite_index = spr_weaponPickupEffect;
	
	var _length = array_length(obj_loadout.weaponsEffect);
	for (var i = 0; i < _length; i++)
	{
		var _weapon = obj_loadout.weaponsEffect[i][1];
		
		if (objectWeapon == _weapon) 
		{
			image_index = i;
			break;
		}
	}
}