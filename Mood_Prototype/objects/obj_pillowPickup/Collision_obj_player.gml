if (instance_exists(obj_weaponPillow)) obj_weaponPillow.ammo++;
else instance_create_layer(obj_player.x, obj_player.y, "Weapons", obj_weaponPillow);

instance_destroy();