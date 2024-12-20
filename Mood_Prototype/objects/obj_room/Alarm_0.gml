//immutable values
	//get room points (for RandomTarget and other navmesh calculations)
points = [];

		//center point					will always be points[0]
xCenter = x + sprite_width / 2;
yCenter = y + sprite_height / 2;

var _centerpoint = 
{
	x : xCenter,
	y : yCenter,
}

array_push(points, _centerpoint);
centerpoint = _centerpoint;

		//corner points
var _cornerOffset = 32;

array_push(points, { x : x + sprite_width - _cornerOffset, y : y + sprite_height - _cornerOffset });
array_push(points, { x : x + _cornerOffset, y : y + sprite_height - _cornerOffset });
array_push(points, { x : x + sprite_width - _cornerOffset, y : y + _cornerOffset });
array_push(points, { x : x + _cornerOffset, y : y + _cornerOffset });

		//room entry points
var _length = array_length(doors);
for (var i = 0; i < _length; i++)
{
	array_push(points, doors[i].entrypoint);
}