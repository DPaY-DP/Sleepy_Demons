/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 506792E8
/// @DnDArgument : "code" "/// @description HP Reduction Tick$(13_10)"
/// @description HP Reduction Tick

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 1FD31E86
/// @DnDArgument : "var" "executable"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "true"
if(!(executable == true))
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5136E86A
	/// @DnDParent : 1FD31E86
	/// @DnDArgument : "var" "enemyHPCurrent"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "op" "3"
	if(!(enemyHPCurrent <= 0))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3A37BB2A
		/// @DnDParent : 5136E86A
		/// @DnDArgument : "expr" "-1"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "enemyHPCurrent"
		enemyHPCurrent += -1;
	}
}

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 336C67CA
/// @DnDArgument : "steps" "2 * room_speed"
alarm_set(0, 2 * room_speed);