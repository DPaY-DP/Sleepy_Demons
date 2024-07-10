if (!active) exit;

explode();

instance_create_layer(other.x, other.y, "Overlay", obj_damageNumber, { damage : damage * 2, color : c_red });