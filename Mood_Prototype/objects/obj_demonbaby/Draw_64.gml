draw_self();

if(obj_blanket.x >= rangeBlanket)
{
	image_speed = 4;
	
	with (obj_blanket) switch_state(stateLocked);
}