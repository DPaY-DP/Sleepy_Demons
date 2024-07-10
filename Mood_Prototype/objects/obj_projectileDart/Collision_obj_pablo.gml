if (!active) exit;

active = false;

var _color = c_red;

instance_create_layer(other.x, other.y, "Overlay", obj_damageNumber, { damage : 0, color : _color });
other.get_slowed(160);

other.x += lengthdir_x(punch * 3, image_angle);
other.y += lengthdir_y(punch * 3, image_angle);