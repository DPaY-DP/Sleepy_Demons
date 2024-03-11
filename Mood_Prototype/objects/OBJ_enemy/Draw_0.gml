draw_self();

draw_rectangle(x + -5, y + -40, x + enemyHPMax+5, y + -20, 1);
draw_rectangle_colour(x + 0, y + -35, x + enemyHPCurrent, y + -25, $FF05E1FF & $FFFFFF, $FFFFFF & $FFFFFF, $FFFFFF & $FFFFFF, $FF05E1FF & $FFFFFF, 0);

if(!executable)
{
	if(distance_to_object(obj_player) < 200)
	{
		var _dirPlayer = point_direction(x, y, obj_player.x, obj_player.y);
	
		x += lengthdir_x(1.5, _dirPlayer + 180);
		y += lengthdir_y(1.5, _dirPlayer + 180);
	}
	
	if (vulnerable) image_index = 1;
	
	if(enemyHPCurrent == enemyHPMax)
	{
		executable = true;
		image_index = 2;
	}
	
	//if (enemyHPCurrent > 0) enemyHPCurrent -= 0.1;
}
else
{
	speed = 0;
	
	if(point_distance(x, y, obj_player.x, obj_player.y) <= rangeFinisher)
	{
		draw_sprite(spr_UI_finisher, 0, x, y);
		if (keyboard_check_pressed(ord("F"))) instance_destroy();
	}
}