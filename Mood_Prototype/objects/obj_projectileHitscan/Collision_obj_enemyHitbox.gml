var _id = other.owner;

if (_id.hp == 0) exit;

var _lengthHits = array_length(hits);
for (var i = 0; i < _lengthHits; i++)
{
	if (hits[i] == _id) exit;
}

array_push(hits, _id);

var _color = c_red;
instance_create_layer(other.owner.x, other.owner.y, "Overlay", obj_damageNumber, { damage : damage, color : _color });

other.owner.hvel += lengthdir_x(punch, image_angle);
other.owner.vvel += lengthdir_y(punch, image_angle);

other.owner.hp -= damage;