//get input
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


//draw self
draw_self();


//functionality
if	(mouse_in_area_GUI(x - sprite_width / 2, y - sprite_height / 2, sprite_width, sprite_height)) && 
	(mouse_check_button_pressed(mb_left)) && 
	(!obj_managerMinigame.holdingBoard) &&
	(!placed)
{
	picked = true;
	obj_managerMinigame.holdingBoard = true;
	
	offsetXPicked = x - _mouseX;
	offsetYPicked = y - _mouseY;
	
	droppable = false;
}

if (picked)
{
	x = _mouseX + offsetXPicked;
	y = _mouseY + offsetYPicked;
	
	if (mouse_check_button_pressed(mb_left)) && (droppable)
	{
		picked = false;
		obj_managerMinigame.holdingBoard = false;
		
		if	(place_meeting(x, y, obj_gametunnelBumperLeft)) &&
			(place_meeting(x, y, obj_gametunnelBumperRight)) &&
			(!place_meeting(x, y, obj_gameboard))
		{
			placed = true;
			image_blend = c_red;
		}
	}
	else droppable = true;
}

if (obj_managerMinigame.spawnedScrews)
{
	var _allNailed = true;
	var i = 0;
	repeat (4)
	{
		if (!myScrews[i].nailed)
		{
			_allNailed = false;
			break;
		}
		i++;
	}
	
	if (_allNailed) allNailed = true;
}