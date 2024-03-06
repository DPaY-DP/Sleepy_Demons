/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
/// @DnDVersion : 1
/// @DnDHash : 72FA56ED
/// @DnDArgument : "key" "ord("F")"
var l72FA56ED_0;
l72FA56ED_0 = keyboard_check_pressed(ord("F"));
if (l72FA56ED_0)
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 7E2666CC
	/// @DnDParent : 72FA56ED
	instance_destroy();
}