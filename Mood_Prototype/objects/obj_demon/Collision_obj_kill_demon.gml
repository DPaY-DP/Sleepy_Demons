/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
/// @DnDVersion : 1
/// @DnDHash : 48B64197
/// @DnDArgument : "key" "ord("F")"
var l48B64197_0;
l48B64197_0 = keyboard_check_pressed(ord("F"));
if (l48B64197_0)
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 61261D66
	/// @DnDParent : 48B64197
	instance_destroy();
}