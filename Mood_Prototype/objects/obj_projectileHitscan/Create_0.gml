width = 0;
width_factor = 0.75;
width_max = 10;

timerAlive = -1;

size = 2;

image_xscale = size * 1;
image_yscale = size * 0.25;

hits = [];


		
damage = 12;
punch = 120;

check_collision = function()
{			
	hits = ds_list_create();
	instance_place_list(x, y, obj_enemyHitbox, hits, true);
	hits = list_to_array(hits);
					
	var _lengthHits = array_length(hits);					
	for (var i = 0; i < _lengthHits; i++)
	{
		var _id = hits[i].owner;

		if (_id.hp == 0) exit;

		var _damage = floor(damage + (damage * 0.5) * i);

		var _color = c_red;
		instance_create_layer(_id.x, _id.y, "Overlay", obj_damageNumber, { damage : _damage, color : _color });

		_id.hvel += lengthdir_x(punch, image_angle);
		_id.vvel += lengthdir_y(punch, image_angle);

		_id.hp -= _damage;
	}
}


var _dirBarrel = point_direction(0, 32, xBarrel, yBarrel);
var _distBarrel = point_distance(0, 32, xBarrel, yBarrel);
								
x = obj_weapon.x + lengthdir_x(_distBarrel, _dirBarrel + obj_weapon.image_angle);
y = obj_weapon.y + lengthdir_y(_distBarrel, _dirBarrel + obj_weapon.image_angle);