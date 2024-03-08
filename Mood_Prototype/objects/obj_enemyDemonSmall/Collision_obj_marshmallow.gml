/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0C3615C5
/// @DnDArgument : "var" "vulnerable"
/// @DnDArgument : "value" "true"
if(vulnerable == true)
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1BF9B85F
	/// @DnDParent : 0C3615C5
	/// @DnDArgument : "var" "enemyHPCurrent"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "enemyHPMax"
	if(enemyHPCurrent < enemyHPMax)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 13D31008
		/// @DnDParent : 1BF9B85F
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "enemyHPCurrent"
		enemyHPCurrent += 1;
	}
}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 65EA523F
/// @DnDArgument : "var" "enemyHPCurrent"
/// @DnDArgument : "value" "enemyHPMax"
if(enemyHPCurrent == enemyHPMax)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 14184501
	/// @DnDParent : 65EA523F
	/// @DnDArgument : "expr" "true"
	/// @DnDArgument : "var" "executable"
	executable = true;

	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 08DC6C6E
	/// @DnDParent : 65EA523F
	/// @DnDArgument : "spriteind" "spr_enemyDemonSmallExecute"
	/// @DnDSaveInfo : "spriteind" "spr_enemyDemonSmallExecute"
	sprite_index = spr_enemyDemonSmallExecute;
	image_index = 0;

	/// @DnDAction : YoYo Games.Instances.Set_Alarm
	/// @DnDVersion : 1
	/// @DnDHash : 51545A67
	/// @DnDParent : 65EA523F
	/// @DnDArgument : "steps" "5 * room_speed"
	/// @DnDArgument : "alarm" "1"
	alarm_set(1, 5 * room_speed);
}

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 4017991E
/// @DnDApplyTo : other
with(other) instance_destroy();