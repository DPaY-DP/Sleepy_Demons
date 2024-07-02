image_index = irandom(image_number - 1);
rot = (3 + random(3)) * choose(1, -1); 

spd = 20;

timerAlive = 0;
timerDespawn = 60;

timerDraw = 0;

boundary = 200;

active = true;
if (damage = 0) active = false;

var _scale = 2;
if (!active) _scale = random_range(1, 1.5);

image_xscale = _scale;
image_yscale = _scale;