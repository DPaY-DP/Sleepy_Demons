draw_self()

if(mouse_check_button(mb_left)) && instance_position(mouse_x, mouse_y, self) && drawline = 0{
	dragging = true
	start_connect = 1

}

if (dragging = true) && drawline = 0
{
	draw_line_width_color(x, y, 
	x + lengthdir_x(_dist, point_direction(x, y, mouse_x, mouse_y)), 
	y + lengthdir_y(_dist, point_direction(x, y, mouse_x, mouse_y)), 
	20,cablecolor,cablecolor);
}

if (mouse_check_button_released(mb_left))

{
	dragging = false
}

if (dragging = true ) && instance_position(mouse_x,mouse_y, obj_cable_color)
{
	
	dragging = false
	drawline = 1
	global.number_of_cables += 1;
}

if drawline = 1
{
	draw_line_width_color(self.x, self.y,obj_cable_color.x, obj_cable_color.y,20,cablecolor, cablecolor)
}


