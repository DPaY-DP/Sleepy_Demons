if (other.owner.hp == 0) || (!active) exit;

var _color = c_red;
instance_create_layer(other.owner.x, other.owner.y, "Overlay", obj_damageNumber, { damage : damage, color : _color });

other.owner.hvel += lengthdir_x(punch, image_angle);
other.owner.vvel += lengthdir_y(punch, image_angle);

other.owner.hp -= damage;

active = false;