/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var _distanceToTarget = point_distance(x, y, targetX, targetY);

// Only move if the unit hasn't reached the target
if (_distanceToTarget > spd) {
    var _direction = point_direction(x, y, targetX, targetY);
    x += lengthdir_x(spd, _direction);
    y += lengthdir_y(spd, _direction);
} else {
    // Snap the unit to the target when close enough
    x = targetX;
    y = targetY;
}


