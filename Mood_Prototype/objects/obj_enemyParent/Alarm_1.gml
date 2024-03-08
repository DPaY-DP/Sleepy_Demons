/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 7ADF6072
/// @DnDArgument : "code" "/// @description Vulnerable State End$(13_10)"
/// @description Vulnerable State End

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 720DFE52
/// @DnDComment : This Alarm activates when in $(13_10)executable state$(13_10)
/// @DnDArgument : "expr" "enemyHPMax / 2"
/// @DnDArgument : "var" "enemyHPCurrent"
enemyHPCurrent = enemyHPMax / 2;

/// @DnDAction : YoYo Games.Instances.Set_Sprite
/// @DnDVersion : 1
/// @DnDHash : 32485A1D
/// @DnDArgument : "spriteind" "spr_enemyDemonSmall"
/// @DnDSaveInfo : "spriteind" "spr_enemyDemonSmall"
sprite_index = spr_enemyDemonSmall;
image_index = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 65569E3C
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "executable"
executable = false;

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 07B79632
/// @DnDArgument : "steps" "3 * room_speed"
alarm_set(0, 3 * room_speed);