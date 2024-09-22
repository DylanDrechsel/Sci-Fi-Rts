// Move the selected units towards the target position (xTarget, yTarget)
function handleMovement(xTarget, yTarget) {
    for (var i = 0; i < array_length(selectedUnits); i++) {
        var _unit = selectedUnits[i];

        // Calculate direction to move towards the target
        var _direction = point_direction(_unit.x, _unit.y, xTarget, yTarget);
        
        // Use the unit's own speed
        var _speed = _unit.spd;

        // Move towards target using the unit's speed
        _unit.x += lengthdir_x(_speed, _direction);
        _unit.y += lengthdir_y(_speed, _direction);

        // Optional: Stop the unit when it's close enough to the target
        if (point_distance(_unit.x, _unit.y, xTarget, yTarget) < _speed) {
            _unit.x = xTarget;
            _unit.y = yTarget;
        }
    }
}
