draw_self()
//draw_set_font(font_upheaval_credits)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

//idk why but when I do it like this, the names on other buttons change colour instead of the one I'm hovering over
//The frames of the buttons work as intended, problem only applies to the text that was drawn above
if (mouse_on_me()) 
{
	image_index = 1;
	
	if (mouse_check_button_pressed(mb_left)) held = true;
	
	if (held) 
	{
		image_index = 2;
		if (mouse_check_button_released(mb_left)) url_open("https://discord.gg/7FCdCB6g49");
	}
	
	if (!mouse_check_button(mb_left)) held = false;
}
else 
{
	image_index = 0;
	held = false;
}