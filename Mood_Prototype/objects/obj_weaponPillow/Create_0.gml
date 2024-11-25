mask_index = spr_moodGuyFistHitbox;
image_speed = 0;
image_index = 0;
image_alpha = 0;

intervalCooldown = 75;
timerCooldown = 0;

frame = 0;
animate = false;

damage = 10;
punch = 10;

active = true;
canShoot = true;


force = 1.25;

counterMeleeCharge = 0;

show_debug_message(global.save.levels[get_level_id(room)])
show_debug_message(global.save.levels[get_level_id(room)].loadoutPillows)
ammo = global.save.levels[get_level_id(room)].loadoutPillows;