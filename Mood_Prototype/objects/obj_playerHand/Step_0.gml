if (animate) array_insert(shadows, 0, { x : x, y : y, angle : image_angle, image : image_index });

if (array_length(shadows) == shadowsMax) array_pop(shadows);

timerCooldown--;
if (!instance_exists(obj_managerMinigame)) && (obj_player.state.name != "Lock")
if (keyMelee) && (timerCooldown <= 0)
{
	audio_play_sound(snd_punch2, 0, 0);
	
	image_alpha = 1;
	
	obj_player.canMove = false;
	
	frame = 0;
	animate = true;
	
	dir = image_angle;
	
	timerCooldown = intervalCooldown;
}

if (animate)
{
	frame++;
	
	var _frameReal = floor(frame / 2);
	
	image_index = _frameReal;
	
	switch(_frameReal)
	{
		case 0:		obj_player.hvel -= lengthdir_x(1, dir);
					obj_player.vvel -= lengthdir_y(1, dir);
					
					obj_player.orientation += 5;
		break;
		
		case 1:		obj_player.hvel -= lengthdir_x(3, dir);
					obj_player.vvel -= lengthdir_y(3, dir);
					
					obj_player.orientation += 5;
		break;
		
		case 2:		obj_player.hvel -= lengthdir_x(5, dir);
					obj_player.vvel -= lengthdir_y(5, dir);
					
					obj_player.orientation += 5;
		break;
		
		case 3:		obj_player.hvel -= lengthdir_x(8, dir);
					obj_player.vvel -= lengthdir_y(8, dir);
					
					obj_player.orientation += 5;
		break;
		
		case 4:		
		break;
		
		case 5:		obj_player.hvel += lengthdir_x(30, dir);
					obj_player.vvel += lengthdir_y(30, dir);
					
					obj_player.orientation -= 20;
		break;
		
		case 6:		obj_player.hvel += lengthdir_x(15, dir);
					obj_player.vvel += lengthdir_y(15, dir);
					
					obj_player.orientation -= 5;
		break;
		
		case 7:		obj_player.hvel += lengthdir_x(7, dir);
					obj_player.vvel += lengthdir_y(7, dir);
		break;
		
		case 8:		obj_player.hvel += lengthdir_x(3, dir);
					obj_player.vvel += lengthdir_y(3, dir);
		break;
		
		case 9:		obj_player.hvel -= lengthdir_x(3, dir);
					obj_player.vvel -= lengthdir_y(3, dir);
		break;
		
		case 10:	obj_player.hvel -= lengthdir_x(3, dir);
					obj_player.vvel -= lengthdir_y(3, dir);
		break;
		
		case 11:	obj_player.hvel -= lengthdir_x(3, dir);
					obj_player.vvel -= lengthdir_y(3, dir);
		break;
	}
}