event_inherited();


func = function()
{
	obj_main.mode = "settings";
	
	instance_create_depth(room_width * 0.94, room_height * 0.75, depth, obj_sliderSound, { nameGain : "SFX" });
	instance_create_depth(room_width * 0.94, room_height * 0.65, depth, obj_sliderSound, { nameGain : "Music" });
}