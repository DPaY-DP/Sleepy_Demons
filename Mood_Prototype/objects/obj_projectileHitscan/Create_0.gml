width = 0;
width_factor = 0.75;
width_max = 10;

timerAlive = -1;

size = 2;

image_xscale = size * 1;
image_yscale = size * 0.25;

hits = [];

check_collision = function()
{			
	hits = ds_list_create();
	instance_place_list(x, y, OBJ_enemy, hits, true);
	show_debug_message(hits)
	hits = list_to_array(hits);
					
	show_debug_message(hits)
					
	var _lengthHits = array_length(hits);					
	for (var i = 0; i < _lengthHits; i++)
	{
		var _id = hits[i];

		if (_id.hp == 0) exit;

		var _damage = floor(damage + (damage * 0.5) * i);

		var _color = c_red;
		instance_create_layer(_id.x, _id.y, "Overlay", obj_damageNumber, { damage : _damage, color : _color });

		_id.hvel += lengthdir_x(punch, image_angle);
		_id.vvel += lengthdir_y(punch, image_angle);

		_id.hp -= _damage;
	}
}