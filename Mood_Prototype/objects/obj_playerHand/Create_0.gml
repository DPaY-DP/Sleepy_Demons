shadows = [];
shadowsMax = 8;

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

force = 1.25;

counterMeleeCharge = 0;

ammo = 1;

//remove from level 0
if (room == room_00Executie) instance_destroy();