event_inherited();


func = function()
{
	obj_main.mode = "settings";
	
	var _height1 = room_height * 0.7;
	var _height2 = _height1 - room_height * 0.1;
	
	instance_create_depth(room_width * 0.94, _height1, depth, obj_sliderSound, { nameGain : "SFX" });
	instance_create_depth(room_width * 0.94, _height2, depth, obj_sliderSound, { nameGain : "Music" });
}