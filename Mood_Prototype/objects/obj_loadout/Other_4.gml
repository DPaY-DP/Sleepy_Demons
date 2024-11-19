if (room == room_loadout) initialize_state(stateSelect);
else if (room == room_main) || (room == room_credits) instance_destroy();
else switch_state(stateGame);