/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 07914467
draw_self();

/// @DnDAction : YoYo Games.Drawing.Draw_Rectangle
/// @DnDVersion : 1
/// @DnDHash : 4C2C38BB
/// @DnDArgument : "x1" "-5"
/// @DnDArgument : "x1_relative" "1"
/// @DnDArgument : "y1" "-40"
/// @DnDArgument : "y1_relative" "1"
/// @DnDArgument : "x2" "enemyHPMax+5"
/// @DnDArgument : "x2_relative" "1"
/// @DnDArgument : "y2" "-20"
/// @DnDArgument : "y2_relative" "1"
draw_rectangle(x + -5, y + -40, x + enemyHPMax+5, y + -20, 1);

/// @DnDAction : YoYo Games.Drawing.Draw_Gradient_Rect
/// @DnDVersion : 1
/// @DnDHash : 5147CB58
/// @DnDArgument : "x1_relative" "1"
/// @DnDArgument : "y1" "-35"
/// @DnDArgument : "y1_relative" "1"
/// @DnDArgument : "x2" "enemyHPCurrent"
/// @DnDArgument : "x2_relative" "1"
/// @DnDArgument : "y2" "-25"
/// @DnDArgument : "y2_relative" "1"
/// @DnDArgument : "col1" "$FF05E1FF"
/// @DnDArgument : "col3" "$FF05E1FF"
/// @DnDArgument : "fill" "1"
draw_rectangle_colour(x + 0, y + -35, x + enemyHPCurrent, y + -25, $FF05E1FF & $FFFFFF, $FFFFFF & $FFFFFF, $FFFFFF & $FFFFFF, $FF05E1FF & $FFFFFF, 0);