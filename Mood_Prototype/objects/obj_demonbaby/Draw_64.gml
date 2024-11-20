draw_self();

if(obj_blanket.x >= rangeBlanket)
{
	image_speed = 1;
	
	with (obj_blanket) switch_state(stateLocked);
}