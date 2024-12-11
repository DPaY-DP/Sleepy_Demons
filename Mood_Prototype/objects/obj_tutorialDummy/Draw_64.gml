if (room == room_tutorialShooting)
{
	var _size = fontscale * 6;

	draw_text_simple(GUIwidth * 0.41, GUIheight * 0.07, "Fire Main Weapon", { font : font_upheaval_scalable, size : _size, halign : fa_left, valign: fa_top, color : c_black });	
	draw_text_simple(GUIwidth * 0.41, GUIheight * 0.2, "Use Pillow (Melee)", { font : font_upheaval_scalable, size : _size, halign : fa_left, valign: fa_top, color : c_black });	
	draw_text_simple(GUIwidth * 0.41, GUIheight * 0.24, "hold to throw", { font : font_upheaval_scalable, size : _size / 2, halign : fa_left, valign: fa_top, color : c_black });
}

if (room == room_tutorialExecutie)
{
	var _size = fontscale * 6;

	draw_text_simple(GUIwidth * 0.5, GUIheight * 0.2, "When demons reach 0 HP,\nyou need to put them to sleep", { font : font_upheaval_scalable, size : _size, color : c_black });
}