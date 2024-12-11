var _target = other.owner;

if (_target.hp == 0) exit;

var _damage = min(_target.hp + 1, 25);
var _punch = _damage * 2;

instance_create_layer(_target.x, _target.y, "Overlay", obj_damageNumber, { damage : _damage, color : c_red });

_target.hvel += lengthdir_x(_punch, dir);
_target.vvel += lengthdir_y(_punch, dir);

_target.hp -= _damage;

audio_play_sound_at(snd_punch, x, y, 0, 100, 150, 1, 0, 0, gainSFX, 0, 1.6 + random(0.1));

instance_destroy();