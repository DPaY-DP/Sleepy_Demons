if (animate) array_insert(shadows, 0, { x : x, y : y, angle : image_angle, image : image_index });

if (array_length(shadows) == shadowsMax) array_pop(shadows);

timerCooldown--;
if (!instance_exists(obj_managerMinigame)) && (obj_player.state.name != "Lock")

if (keyMelee) && (timerCooldown <= 0)
{
	if (counterMeleeCharge <= 30)
	{
		audio_play_sound_at(snd_punch2, x, y, 0, 100, 150, 1, 0, 0);
	
		image_alpha = 1;
	
		obj_player.canMove = false;
	
		frame = 0;
		animate = true;
	
		dir = image_angle;
	
		timerCooldown = intervalCooldown;
	}
	else
	{
		instance_create_depth(x, y, depth, obj_projectilePillow, { dir : obj_player.orientation })
		
		ammo--;
		if (ammo == 0) instance_destroy();
	}
}

if (keyMeleeHeld) counterMeleeCharge++;
else counterMeleeCharge = 0;

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

var _enemy = instance_place(x, y, obj_enemyHitbox);
if (_enemy != noone) && (_enemy.owner.hp > 0) && (active)
{
	var _damage = 10;
	var _color = c_red;
	if (_enemy.owner.slowed) 
	{
		_damage = 21;
		_color = c_yellow;
	}

	instance_create_layer(_enemy.owner.x, _enemy.owner.y, "Overlay", obj_damageNumber, { damage : _damage, color : _color });

	_enemy.owner.hvel += lengthdir_x(_damage / 2, image_angle);
	_enemy.owner.vvel += lengthdir_y(_damage / 2, image_angle);

	_enemy.owner.hp -= _damage;

	active = false;
}

var _tunnel = instance_place(x, y, obj_tunnel);
if (_tunnel != noone) && (active)
{
	with (_tunnel) toggle_sabotaged(true);

	ammo--;
	if (ammo == 0) instance_destroy();
}