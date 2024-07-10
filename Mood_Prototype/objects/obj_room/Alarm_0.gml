//immutable values
	//get room points (for randomWalk and other navmesh calculations)
points = [];

		//room entry points
var _length = array_length(doors);
for (var i = 0; i < _length; i++)
{
	array_push(points, doors[i].entrypoint);
}

		//center point
xCenter = x + sprite_width / 2;
yCenter = y + sprite_height / 2;

array_push(points, { x : xCenter, y : yCenter });

		//corner points
var _cornerOffset = 32;

array_push(points, { x : x + sprite_width - _cornerOffset, y : y + sprite_height - _cornerOffset });
array_push(points, { x : x + _cornerOffset, y : y + sprite_height - _cornerOffset });
array_push(points, { x : x + sprite_width - _cornerOffset, y : y + _cornerOffset });
array_push(points, { x : x + _cornerOffset, y : y + _cornerOffset });

			//debug
var _length = array_length(points);
for (var i = 0; i < _length; i++)
{
	instance_create_layer(points[i].x, points[i].y, "Debug", obj_debugdot, { image_blend : c_fuchsia });
}	