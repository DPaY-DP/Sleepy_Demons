draw_self();

if	(broken) && 
	(array_length(POIsBroken) == 0) &&
	(point_distance(x, y, obj_player.x, obj_player.y) < distInteract) &&
	(obj_player.inRoom == inRoom)
{
	draw_sprite_simple(spr_UI_button, 1, x, y, { size : 0.8 });
}