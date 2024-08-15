//camera

	#macro cam view_camera[0]
	#macro camWidth camera_get_view_width(cam)
	#macro camHeight camera_get_view_height(cam)
	
	#macro surface application_surface

	#macro camX camera_get_view_x(cam)
	#macro camY camera_get_view_y(cam)

	#macro GUIwidth display_get_gui_width()
	#macro GUIheight display_get_gui_height()

	#macro windowWidth window_get_width()
	#macro windowHeight window_get_height()


//Fonts

	#macro fontscale global.GUIScale * 64 / 1000 
	

//Game

	#macro keyMelee keyboard_check_pressed(ord("V")) || keyboard_check_pressed(ord("C"))

	#macro keyPrimary mouse_check_button_pressed(mb_left)
	#macro keyPrimaryHeld mouse_check_button(mb_left)
	#macro keySecondary mouse_check_button_pressed(mb_right)
	#macro keySecondaryHeld mouse_check_button(mb_right)
	
	#macro keyInteractHold keyboard_check(ord("E"))
	#macro keyInteractTap keyboard_check_pressed(ord("F"))// || keyboard_check_pressed(ord("Q"))