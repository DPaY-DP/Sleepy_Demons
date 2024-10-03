if (!instance_exists(obj_player)) audio_listener_position(camX + camWidth / 2, camY + camHeight / 2, 0);
else audio_listener_position(obj_player.x, obj_player.y, 0);