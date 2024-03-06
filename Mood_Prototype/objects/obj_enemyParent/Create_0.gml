/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 65D725AF
/// @DnDArgument : "steps" "1 * room_speed"
alarm_set(0, 1 * room_speed);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 454F5A69
/// @DnDArgument : "expr" "true"
/// @DnDArgument : "var" "vulnerable"
vulnerable = true;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 481E57BF
/// @DnDArgument : "expr" "10"
/// @DnDArgument : "var" "enemyHPMax"
enemyHPMax = 10;