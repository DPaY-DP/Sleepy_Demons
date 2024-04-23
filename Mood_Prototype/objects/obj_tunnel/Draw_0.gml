draw_self();

if (distance_to_object(obj_player) < distInteract) && (!sabotaged)
{
	draw_sprite_simple(spr_UI_button, 2, xCenter, yCenter, { size : 1 });
	
	if ((keyboard_check_pressed(ord("Q"))) && (!instance_exists(obj_managerMinigame))) 
	instance_create_layer(x, y, "Overlay", obj_managerMinigame, { game : "tunnel", tunnel : id });
}
else image_index = 0;

if (sabotaged) draw_sprite_simple(spr_tunnelCross, 1, xCenter, yCenter, { size : 2 });