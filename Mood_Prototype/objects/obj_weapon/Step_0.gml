//active
if (!canShoot) exit;

//get input
var left = mouse_check_button_pressed(mb_left);
var left_held = mouse_check_button(mb_left);
var right = mouse_check_button_pressed(mb_right);

var weaNext = mouse_wheel_down() || keyboard_check_pressed(vk_space);
var weaPrev = mouse_wheel_up();

//weapons
var _numberWeapons = array_length(weaponsAvailable);
if (_numberWeapons > 0)
{
	//angle
	var _dir = point_direction(x, y, mouse_x, mouse_y);
	
	//timedown
	for (var i = 0; i < _numberWeapons; i++)
	{
		with (weaponsAvailable[i]) if (timerFirerate > 0) timerFirerate--;
	}
	
	if (instance_exists(obj_managerMinigame)) exit;
	
	//functionality
	var _weapon = weaponsAvailable[weaponEquipped];
	
	with (_weapon)
	{
		if (timerFirerate == 0)
		{
			//firing state
			if (other.fire)
			{
				if (timerDelay > 0) timerDelay--;
				else
				{
					if (timerBurst > 0) timerBurst--;
					else
					{
						if (sound.fire) audio_play_sound_at(sound.fire, other.x, other.y, 0, 100, 150, 1, 0, 0, sound.volume);
						repeat (blast) instance_create_depth(other.x, other.y, other.depth + 1, projectile, { image_angle : other.image_angle + random_range(-blastDeviance, blastDeviance), yBarrel : yBarrel, xBarrel : xBarrel });
						
						obj_player.hvel -= lengthdir_x(_weapon.recoil, other.image_angle);
						obj_player.vvel -= lengthdir_y(_weapon.recoil, other.image_angle);
					
						other.counterBurst++;
						if (other.counterBurst == burst)
						{
							other.counterBurst = 0;
							other.fire = false;
							timerFirerate = firerate;
							timerDelay = intervalDelay;
						}
					
						ammo--;
						timerBurst = intervalBurst;
					}
				}
				
				if (other.fire) exit;
			}
			
			if	((holdfire) && (keyPrimaryHeld)) ||
				(keyPrimary) 
			{
				if (ammo > 0)
				{
					other.fire = true;
					if (sound.delay) audio_play_sound_at(sound.delay, other.x, other.y, 0, 100, 150, 1, 0, 0, sound.volume);
				}
			}
		}
	}
	
	//switching
	var _switch = weaNext - weaPrev;
	if (_switch != 0)
	{
		weaponEquipped += _switch;
		
		if (weaponEquipped == _numberWeapons) weaponEquipped = 0;
		else if (weaponEquipped == -1) weaponEquipped = _numberWeapons - 1;
		weaponData = weaponsAvailable[weaponEquipped];
		
		timerFireRate = 0;
	}
}