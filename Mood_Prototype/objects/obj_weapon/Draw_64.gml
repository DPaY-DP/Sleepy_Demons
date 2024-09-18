var _numberWeapons = array_length(weaponsAvailable);
if (_numberWeapons > 0)
{
	show_debug_message("helo")
	var _weapon = weaponsAvailable[weaponEquipped];
	draw_text_simple(GUIwidth * 0.1, GUIheight * 0.9, _weapon.ammo, { halign : fa_left, valign : fa_bottom, font : font_upheaval_scalable, size : 5 * fontscale, color : c_white })
}