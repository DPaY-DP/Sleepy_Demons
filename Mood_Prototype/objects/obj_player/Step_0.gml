//get inputs
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));

x += (right - left) * spd;
y += (down - up) * spd;

// simple weapon holding
weaponObject.x = x;
weaponObject.y = y;
weaponObject.image_angle = point_direction(x,y,mouse_x,mouse_y);