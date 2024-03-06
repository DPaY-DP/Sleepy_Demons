/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 72AFF310
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)if (instance_exists(player_near))$(13_10){$(13_10)	draw_self();$(13_10)	if(keyboard_check_pressed(ord("F"))){$(13_10)		instance_destroy();$(13_10)	}$(13_10)}"
/// @description Execute Code
if (instance_exists(player_near))
{
	draw_self();
	if(keyboard_check_pressed(ord("F"))){
		instance_destroy();
	}
}