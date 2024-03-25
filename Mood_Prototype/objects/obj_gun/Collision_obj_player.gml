var _data = weapondata[image_index];

with (other)
{
	if (array_length(weaponsAvailable) == 0)
	{
		weaponEquipped = 0;
		weaponData = _data;
	}
	array_push(weaponsAvailable, _data);
}

instance_destroy();