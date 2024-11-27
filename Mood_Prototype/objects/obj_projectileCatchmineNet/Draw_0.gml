var _dist = 15;
var _dir = point_direction(x, y, owner.x, owner.y);
var _iterations = point_distance(owner.x, owner.y, x, y) / 15;

for (var i = 0; i < _iterations; i++)
{	
	draw_sprite_simple(spr_webSegment, 0, x + lengthdir_x(_dist * i, _dir), y + lengthdir_y(_dist * i, _dir));
}

draw_self();