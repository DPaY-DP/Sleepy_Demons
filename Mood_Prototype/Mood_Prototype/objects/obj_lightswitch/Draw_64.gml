draw_self();

if  (mouse_on_me_center_gui()) &&
	(mouse_check_button_pressed(mb_left)) &&
	(!turnedOn)
{
	image_index = 1;
	obj_managerMinigame.switchesActivated++;
	turnedOn = true;
}