if (other.state.name != "Walk") exit;

var _dir = point_direction(x, y, other.x, other.y);

hvel -= lengthdir_x(1.5, _dir);
vvel -= lengthdir_y(1.5, _dir);