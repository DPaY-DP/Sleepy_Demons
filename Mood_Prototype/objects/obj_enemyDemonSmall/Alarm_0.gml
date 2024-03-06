/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3A37BB2A
/// @DnDArgument : "expr" "-1"
/// @DnDArgument : "expr_relative" "1"
/// @DnDArgument : "var" "enemyHPCurrent"
enemyHPCurrent += -1;

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 336C67CA
/// @DnDArgument : "steps" "2 * room_speed"
alarm_set(0, 2 * room_speed);