if (instance_exists(obj_playerHand)) obj_playerHand.ammo++;
else instance_create_layer(obj_player.x, obj_player.y, "Weapons", obj_playerHand);

instance_destroy();