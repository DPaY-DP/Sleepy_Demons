timerAlive = 0;
timerDespawn = 60;

timerDraw = 0;

xStart = x;
yStart = y;

boundary = 200;

active = true;

drawExplosion = false;

timerExplode = 45;
segmentExplode = timerExplode / 3;

audioExplosion = undefined;

explode = function()
{	
	audioExplosion = audio_play_sound(snd_acidExplosion, 0, 0);
	
	image_alpha = 0;
	spd = 0;
	
	drawExplosion = true;
	active = false;
	
	instance_create_depth(x, y, depth, obj_effectLingering, { area : area, length : length });
}