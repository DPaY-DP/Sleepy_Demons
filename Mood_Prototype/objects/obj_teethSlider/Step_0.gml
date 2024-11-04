/// @description Insert description here
// You can write your code in this editor

if mouse_check_button_pressed(mb_left) 
{
	var button_x = x+sprite_width*value_;
	var button_y = y;
	var button_radius = sprite_get_width(spr_brush);
	if point_in_circle(mouse_x,mouse_y, button_x, button_y, button_radius)
	{ selected_ = true;
	}
}

if !mouse_check_button(mb_left) {
	selected_ = false;
}

if selected_ {
	value_ = clamp((mouse_x-x)/sprite_width, 0, max_value_); //damit wir die momentane Breite des Sliders haben

}

if (value_ == 1 && brushed == 0)
{
	right_trigger = true;
	alarm_set(0,1);
}

if (value_ == 0 && right_trigger == true) alarm_set(1,1);
if (value_ == 1 && right_trigger == false && brushed == 1) alarm_set(2,1);
if (value_ == 1 && right_trigger == false && brushed == 2) alarm_set(3,1);
if (value_ == 0 && right_trigger == true && brushed == 3) instance_create_depth(xMouth-64, yMouth, -10, obj_teethAnimation);

switch (brushed)
{
	case 0:
		image_index = 0;
	break;
	
	case 1:
		image_index = 1;
	break;
	
	case 2:
		image_index = 2;
	break;
	
	case 3:
		image_index = 3;
	break;
} 


