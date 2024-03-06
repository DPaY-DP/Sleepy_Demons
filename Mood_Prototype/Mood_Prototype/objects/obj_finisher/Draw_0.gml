/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 48BD385B
/// @DnDArgument : "expr" "instance_nearest(x,y,obj_mood_guy)"
/// @DnDArgument : "var" "draw_me"
draw_me = instance_nearest(x,y,obj_mood_guy);

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 64060F44
/// @DnDArgument : "var" "draw_me"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "noone"
if(!(draw_me == noone))
{
	/// @DnDAction : YoYo Games.Common.Execute_Code
	/// @DnDVersion : 1
	/// @DnDHash : 5FBAA566
	/// @DnDParent : 64060F44
	/// @DnDArgument : "code" "/// @description Self$(13_10)if(point_distance(x,y,draw_me.x,draw_me.y) <=range+55)$(13_10){$(13_10)	draw_self();$(13_10)	player_near = draw_me;$(13_10)	instance_create_depth(x,y,0,obj_kill_demon);$(13_10)}$(13_10)"
	/// @description Self
	if(point_distance(x,y,draw_me.x,draw_me.y) <=range+55)
	{
		draw_self();
		player_near = draw_me;
		instance_create_depth(x,y,0,obj_kill_demon);
	}
}