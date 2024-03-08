/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
/// @DnDVersion : 1
/// @DnDHash : 5E31B74F
/// @DnDArgument : "key" "ord("F")"
var l5E31B74F_0;
l5E31B74F_0 = keyboard_check_pressed(ord("F"));
if (l5E31B74F_0)
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 33C26AE9
	/// @DnDApplyTo : other
	/// @DnDParent : 5E31B74F
	with(other) instance_destroy();
}