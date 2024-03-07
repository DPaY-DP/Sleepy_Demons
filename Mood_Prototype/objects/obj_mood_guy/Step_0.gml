/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 2103F140
/// @DnDArgument : "key" "ord("A")"
var l2103F140_0;
l2103F140_0 = keyboard_check(ord("A"));
if (l2103F140_0)
{
	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
	/// @DnDVersion : 1
	/// @DnDHash : 603FA96C
	/// @DnDParent : 2103F140
	/// @DnDArgument : "value" "-2"
	/// @DnDArgument : "value_relative" "1"
	x += -2;
}

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 6279EB7C
/// @DnDArgument : "key" "ord("D")"
var l6279EB7C_0;
l6279EB7C_0 = keyboard_check(ord("D"));
if (l6279EB7C_0)
{
	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
	/// @DnDVersion : 1
	/// @DnDHash : 3E746BAC
	/// @DnDParent : 6279EB7C
	/// @DnDArgument : "value" "2"
	/// @DnDArgument : "value_relative" "1"
	x += 2;
}

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 62BB605A
/// @DnDArgument : "key" "ord("W")"
var l62BB605A_0;
l62BB605A_0 = keyboard_check(ord("W"));
if (l62BB605A_0)
{
	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
	/// @DnDVersion : 1
	/// @DnDHash : 1558B506
	/// @DnDParent : 62BB605A
	/// @DnDArgument : "value" "-2"
	/// @DnDArgument : "value_relative" "1"
	/// @DnDArgument : "instvar" "1"
	y += -2;
}

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 5D4AB96D
/// @DnDArgument : "key" "ord("S")"
var l5D4AB96D_0;
l5D4AB96D_0 = keyboard_check(ord("S"));
if (l5D4AB96D_0)
{
	/// @DnDAction : YoYo Games.Instances.Set_Instance_Var
	/// @DnDVersion : 1
	/// @DnDHash : 3BCECA15
	/// @DnDParent : 5D4AB96D
	/// @DnDArgument : "value" "2"
	/// @DnDArgument : "value_relative" "1"
	/// @DnDArgument : "instvar" "1"
	y += 2;
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 010F783B
/// @DnDArgument : "code" "/// @description Execute Code$(13_10)// makes the player turn the direction of the cursor $(13_10)    if x-50 < mouse_x$(13_10)    {$(13_10)        image_xscale = 1$(13_10)    }else if x+50 > mouse_x$(13_10)    {$(13_10)        image_xscale = -1$(13_10)    }"
/// @description Execute Code
// makes the player turn the direction of the cursor 
    if x-50 < mouse_x
    {
        image_xscale = 1
    }else if x+50 > mouse_x
    {
        image_xscale = -1
    }