//IMMUTABLE VALUES
intervalCooldown = 40;
intervalDespawn = 500;

damage = 10;
punch = 10;

force = 1.25;

limitLastCloud = 75;



//SETUP AND SPAWNING
mask_index = spr_moodGuyFistHitbox;
image_speed = 0;
image_index = 0;


//GAME VALUES
animatePunch = false;
animateRush = false;
timerCooldown = 0;
timerDespawn = intervalDespawn;
frame = 0;

lastCloud = limitLastCloud;

active = false;
punchReady = true;
canShoot = true;

counterMeleeCharge = 0;

ammo = global.save.levels[get_level_id(room)].loadoutPillows;


//METHODS











