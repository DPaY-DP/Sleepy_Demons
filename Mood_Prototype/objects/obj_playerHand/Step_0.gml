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
		case 0:		obj_player.hvel -= lengthdir_x(force * 0.33, dir);
					obj_player.vvel -= lengthdir_y(force * 0.33, dir);
					
					obj_player.orientation += 5;
		break;
		
		case 1:		obj_player.hvel -= lengthdir_x(force, dir);
					obj_player.vvel -= lengthdir_y(force, dir);
					
					obj_player.orientation += 5;
		break;
		
		case 2:		obj_player.hvel -= lengthdir_x(force * 2, dir);
					obj_player.vvel -= lengthdir_y(force * 2, dir);
					
					obj_player.orientation += 5;
		break;
		
		case 3:		obj_player.hvel -= lengthdir_x(force * 3, dir);
					obj_player.vvel -= lengthdir_y(force * 3, dir);
					
					obj_player.orientation += 5;
		break;
		
		case 4:		
		break;
		
		case 5:		obj_player.hvel += lengthdir_x(force * 10, dir);
					obj_player.vvel += lengthdir_y(force * 10, dir);
					
					obj_player.orientation -= 20;
		break;
		
		case 6:		obj_player.hvel += lengthdir_x(force * 5, dir);
					obj_player.vvel += lengthdir_y(force * 5, dir);
					
					obj_player.orientation -= 5;
		break;
		
		case 7:		obj_player.hvel += lengthdir_x(force * 2, dir);
					obj_player.vvel += lengthdir_y(force * 2, dir);
		break;
		
		case 8:		obj_player.hvel += lengthdir_x(force, dir);
					obj_player.vvel += lengthdir_y(force, dir);
		break;
		
		case 9:		obj_player.hvel -= lengthdir_x(force, dir);
					obj_player.vvel -= lengthdir_y(force, dir);
		break;
		
		case 10:	obj_player.hvel -= lengthdir_x(force, dir);
					obj_player.vvel -= lengthdir_y(force, dir);
		break;
		
		case 11:	obj_player.hvel -= lengthdir_x(force, dir);
					obj_player.vvel -= lengthdir_y(force, dir);
		break;
	}
}