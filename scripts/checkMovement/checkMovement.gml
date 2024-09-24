function checkMovement() {
    // Calculate distance to target
    var _distanceToTarget = point_distance(x, y, targetX, targetY);
    
    // Only move if the unit hasn't reached the target
    if (_distanceToTarget > spd) {
        var _direction = point_direction(x, y, targetX, targetY);
        
        // Move towards the target
        x += lengthdir_x(spd, _direction);
        y += lengthdir_y(spd, _direction);
    } else {
        // Snap the unit to the target when close enough
        x = targetX;
        y = targetY;
    }
    
    // Separation logic to avoid unit overlap  
    // Loop through other units to apply separation
    with (oUnitController) {
        if (id != other.id) {  // Ensure we're not checking against itself
            var _distanceToOtherUnit = point_distance(x, y, other.x, other.y);
            
            // If the unit is within the separation radius, apply a push force
            if (_distanceToOtherUnit < separationRadius) {
                var _pushDirection = point_direction(x, y, other.x, other.y);
                
                // Apply a small push in the opposite direction
                x += lengthdir_x(pushForce, _pushDirection + 180);
                y += lengthdir_y(pushForce, _pushDirection + 180);
            }
        }
    }
}
