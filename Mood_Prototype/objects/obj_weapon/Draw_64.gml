var _numberWeapons = array_length(weaponsAvailable);
if (_numberWeapons > 0)
{
	var _weapon = weaponsAvailable[weaponEquipped];
	draw_text_simple(room_width * 0.1, room_height * 0.9, _weapon.ammo, { halign : fa_left, valign : fa_bottom, font : font_upheaval_scalable, size : 5 * fontscale })
}