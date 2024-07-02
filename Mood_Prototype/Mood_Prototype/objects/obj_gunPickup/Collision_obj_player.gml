var _data = weaponData[type];

if (array_length(other.weaponsAvailable) == 0) 
{
	other.weaponData = _data;
	other.weaponEquipped = 0;
}
array_push(other.weaponsAvailable, _data);

instance_destroy();