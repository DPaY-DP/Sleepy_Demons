event_inherited();
instance_deactivate_layer("Walls_Player_vertical");
instance_deactivate_layer("Walls_Player");
player_here = function()
{
if global.playerHere == -1
{
if place_meeting(x, y, obj_player)
{
	instance_activate_layer("Walls_Player_vertical");
}
else instance_deactivate_layer("Walls_Player_vertical");
}
}