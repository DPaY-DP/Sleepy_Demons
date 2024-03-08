/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 692FB029
/// @DnDArgument : "var" "executable"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "true"
if(!(executable == true))
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4164C26A
	/// @DnDParent : 692FB029
	/// @DnDArgument : "var" "distance_to_object(obj_mood_guy)"
	/// @DnDArgument : "op" "3"
	/// @DnDArgument : "value" "200"
	if(distance_to_object(obj_mood_guy) <= 200)
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 39D3B7B4
		/// @DnDInput : 4
		/// @DnDParent : 4164C26A
		/// @DnDArgument : "var" "playerDirection"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "function" "point_direction"
		/// @DnDArgument : "arg" "x"
		/// @DnDArgument : "arg_1" "y"
		/// @DnDArgument : "arg_2" "obj_mood_guy.x"
		/// @DnDArgument : "arg_3" "obj_mood_guy.y"
		var playerDirection = point_direction(x, y, obj_mood_guy.x, obj_mood_guy.y);
	
		/// @DnDAction : YoYo Games.Movement.Set_Direction_Free
		/// @DnDVersion : 1
		/// @DnDHash : 0C6BDA06
		/// @DnDParent : 4164C26A
		/// @DnDArgument : "direction" "playerDirection+180"
		direction = playerDirection+180;
	
		/// @DnDAction : YoYo Games.Movement.Set_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 3CC4DEC0
		/// @DnDParent : 4164C26A
		/// @DnDArgument : "speed" "1.5"
		speed = 1.5;
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Rotate
		/// @DnDVersion : 1
		/// @DnDHash : 4F6FFDE6
		/// @DnDParent : 4164C26A
		/// @DnDArgument : "angle" "playerDirection+90"
		image_angle = playerDirection+90;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 6B334A32
	/// @DnDParent : 692FB029
	else
	{
		/// @DnDAction : YoYo Games.Movement.Set_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 027E70E4
		/// @DnDParent : 6B334A32
		speed = 0;
	
		/// @DnDAction : YoYo Games.Instances.Set_Alarm
		/// @DnDVersion : 1
		/// @DnDHash : 5164B31B
		/// @DnDParent : 6B334A32
		/// @DnDArgument : "steps" "1"
		/// @DnDArgument : "alarm" "2"
		alarm_set(2, 1);
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 115CF5DA
else
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 6CCA0545
	/// @DnDParent : 115CF5DA
	speed = 0;
}