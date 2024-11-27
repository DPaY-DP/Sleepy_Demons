//unequip
if (weaponActive != obj_loadout.weaponActive) instance_destroy();

timerDespawn--;
if (timerDespawn <= 0) && (!keyMeleeHeld) && (!keyMelee) && (!animatePunch) && (!animateRush) instance_destroy();


//function
timerCooldown--;
if (!instance_exists(obj_managerMinigame)) && (obj_player.state.name != "Lock")
if (keyMelee) && (timerCooldown <= 0) && (active)
{
	if (counterMeleeCharge <= 30)
	{
		audio_play_sound_at(snd_punch, x, y, 0, 100, 150, 1, 0, 0, gainSFX);
	
		frame = 0;
		animatePunch = true;
	
		dir = image_angle;
	
		timerCooldown = intervalCooldown;
	}
	else
	{
		audio_play_sound_at(snd_punch, x, y, 0, 100, 150, 1, 0, 0, gainSFX);
	
		frame = 0;
		animateRush = true;
	
		dir = image_angle;
	
		timerCooldown = intervalCooldown;
	}
}



//activate (let go of melee)
if (keyMelee) active = true;
if (!active) exit;


if (keyMeleeHeld) counterMeleeCharge++;
else counterMeleeCharge = 0;

if (animatePunch)
{
	frame++;
	
	image_index = frame;
	
	switch(frame)
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
	
	lastCloud--;
}

if (animateRush)
{
	frame++;
	
	switch(frame)
	{
		case 0:		obj_player.hvel -= lengthdir_x(force * 0.33, dir);
					obj_player.vvel -= lengthdir_y(force * 0.33, dir);
					
					obj_player.orientation += 5;
					
					image_index++;
		break;
		
		case 1:		obj_player.hvel -= lengthdir_x(force, dir);
					obj_player.vvel -= lengthdir_y(force, dir);
					
					obj_player.orientation += 5;
					
					image_index++;
		break;
		
		case 2:		obj_player.hvel -= lengthdir_x(force * 2, dir);
					obj_player.vvel -= lengthdir_y(force * 2, dir);
					
					obj_player.orientation += 5;
					
					image_index++;
		break;
		
		case 3:		obj_player.hvel -= lengthdir_x(force * 3, dir);
					obj_player.vvel -= lengthdir_y(force * 3, dir);
					
					obj_player.orientation += 5;
					
					image_index++;
		break;
		
		case 4:		image_index++;
		break;
		
		case 5:		obj_player.hvel += lengthdir_x(force * 10, dir);
					obj_player.vvel += lengthdir_y(force * 10, dir);
					
					obj_player.orientation -= 20;
					
					image_index++;
		break;
		
		case 6:		obj_player.hvel += lengthdir_x(force * 10, dir);
					obj_player.vvel += lengthdir_y(force * 10, dir);
		break;
		
		case 7:		obj_player.hvel += lengthdir_x(force * 10, dir);
					obj_player.vvel += lengthdir_y(force * 10, dir);
		break;
		
		case 8:		obj_player.hvel += lengthdir_x(force * 10, dir);
					obj_player.vvel += lengthdir_y(force * 10, dir);
		break;
		
		case 9:		obj_player.hvel += lengthdir_x(force * 10, dir);
					obj_player.vvel += lengthdir_y(force * 10, dir);
		break;
		
		case 10:	obj_player.hvel += lengthdir_x(force * 10, dir);
					obj_player.vvel += lengthdir_y(force * 10, dir);
		break;
		
		case 11:	obj_player.hvel += lengthdir_x(force * 10, dir);
					obj_player.vvel += lengthdir_y(force * 10, dir);
		break;
		
		case 12:	obj_player.hvel += lengthdir_x(force * 2, dir);
					obj_player.vvel += lengthdir_y(force * 2, dir);
		break;
		
		case 13:	obj_player.hvel += lengthdir_x(force, dir);
					obj_player.vvel += lengthdir_y(force, dir);
		break;
		
		case 14:	obj_player.hvel -= lengthdir_x(force, dir);
					obj_player.vvel -= lengthdir_y(force, dir);
		break;
		
		case 15:	obj_player.hvel -= lengthdir_x(force, dir);
					obj_player.vvel -= lengthdir_y(force, dir);
					
					image_index += 2;
		break;
		
		case 16:	obj_player.hvel -= lengthdir_x(force, dir);
					obj_player.vvel -= lengthdir_y(force, dir);
					
					image_index += 2;
		break;
		
		case 17:	image_index += 2;
		break;
	}
	
	lastCloud--;
}

var _enemy = instance_place(x, y, obj_enemyHitbox);
if (_enemy != noone) && (_enemy.owner.hp > 0) && (punchReady)
{
	var _damage = 10;
	var _color = c_red;

	instance_create_layer(_enemy.owner.x, _enemy.owner.y, "Overlay", obj_damageNumber, { damage : _damage, color : _color });

	_enemy.owner.hvel += lengthdir_x(_damage / 2, image_angle);
	_enemy.owner.vvel += lengthdir_y(_damage / 2, image_angle);

	_enemy.owner.hp -= _damage;

	punchReady = false;
}

var _enemy = instance_place(x, y, obj_pillowFort);
if (_enemy != noone) && (active)
{
	var _damage = 10;
	var _color = c_red;

	instance_create_layer(_enemy.x, _enemy.y, "Overlay", obj_damageNumber, { damage : _damage, color : _color });

	_enemy.hp -= _damage;

	active = false;
}

lastCloud--;
if (irandom(limitLastCloud) > lastCloud) 
{
	instance_create_depth(x, y, depth, obj_projectileStinkbombEffect, { image_angle : image_angle, dur : 0.5 });
	lastCloud = limitLastCloud
}

