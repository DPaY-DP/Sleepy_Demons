draw_self();
imageScale = clickedTimes * 0.1;
image_xscale = 1 + imageScale;
image_yscale = 1 + imageScale;

if(clickedTimes == clickedGoal)
{
	image_speed = 1;
	fastclickwon = true
}

draw_text_color(GUIwidth / 2, GUIheight / 1.25, "Remaining: "+string(clickedGoal-clickedTimes),c_black,c_black,c_black,c_black,1);

if(image_index == 4)
{
	image_speed = 0;
}


if(mouse_check_button_pressed(mb_left)) && instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), self)
{
	if(clickedTimes < clickedGoal) clickedTimes++;
}