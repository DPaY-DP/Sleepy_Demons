draw_self();

if  (mouse_on_me_center_gui()) &&
	(mouse_check_button_pressed(mb_left)) &&
	(!turnedOn)
{
	image_index = 1;
	obj_managerMinigame.switchesActivated++;
	turnedOn = true;
}

draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.9, "Press Red", { size : 0.7, color : c_white, font : font_menu });