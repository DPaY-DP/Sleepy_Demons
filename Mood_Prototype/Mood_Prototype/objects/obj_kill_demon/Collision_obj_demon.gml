/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
/// @DnDVersion : 1
/// @DnDHash : 4D9B0AB6
/// @DnDArgument : "key" "ord("F")"
var l4D9B0AB6_0;
l4D9B0AB6_0 = keyboard_check_pressed(ord("F"));
if (l4D9B0AB6_0)
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 355E45E2
	/// @DnDApplyTo : other
	/// @DnDParent : 4D9B0AB6
	with(other) instance_destroy();
}