//IMMUTABLE VALUES
name = "Blackhole";

intervalFirerate = 45;

rocketjump = 30;

ammoMax = 6;
ammoBag = 2;

ammoImage = enumWeaponEffect.BLACKHOLE;
ammoImageSize = 4;


//GAME VALUES
active = false;
canShoot = true;

timerFirerate = 0;

ammo = ammoMax;

identity = 0;


//METHODS
flick = function(_input)
{
	if (_input) return false
	return true
}


//STATES