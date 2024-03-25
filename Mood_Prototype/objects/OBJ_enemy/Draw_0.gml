draw_self();

draw_rectangle(x + -5, y + -40, x + enemyHPMax+5, y + -20, 1);
draw_rectangle_colour(x + 0, y + -35, x + enemyHPCurrent, y + -25, $FF05E1FF & $FFFFFF, $FFFFFF & $FFFFFF, $FFFFFF & $FFFFFF, $FF05E1FF & $FFFFFF, 0);

if(!executable)
{
	if (distance_to_object(obj_player) < rangeDetection)
	{
		var _dirPlayer = point_direction(x, y, obj_player.x, obj_player.y);
	
		var _newX = x + lengthdir_x(spd, _dirPlayer + 180);
		var _newY = y + lengthdir_y(spd, _dirPlayer + 180);
		
		if (!place_meeting(_newX, y, OBJ_collider)) x = _newX;
		if (!place_meeting(x, _newY, OBJ_collider)) y = _newY;
	}
	
	if (vulnerable) image_index = 1;
	
	if (enemyHPCurrent == enemyHPMax)
	{
		executable = true;
		image_index = 2;
	}
	
	//if (enemyHPCurrent > 0) enemyHPCurrent -= 0.1;
}
else
{
	if (distance_to_object(obj_player) < rangeDetection)
	{
		var _dirPlayer = point_direction(x, y, obj_player.x, obj_player.y);
	
		var _newX = x + lengthdir_x(spd / 2, _dirPlayer + 180);
		var _newY = y + lengthdir_y(spd / 2, _dirPlayer + 180);
		
		if (!place_meeting(_newX, y, OBJ_collider)) x = _newX;
		if (!place_meeting(x, _newY, OBJ_collider)) y = _newY;
	}
	
	if (point_distance(x, y, obj_player.x, obj_player.y) <= rangeFinisher)
	{
		draw_sprite(spr_UI_finisher, 0, x, y);
		if (keyboard_check_pressed(ord("F"))) instance_destroy();
	}
}