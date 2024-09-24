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
    // Only apply separation if very close
    with (oUnitController) {
        if (id != other.id) {  // Ensure we're not checking against itself
            var _distanceToOtherUnit = point_distance(x, y, other.x, other.y);
            
            // Apply a push force only if within a small range to avoid constant pushing
            if (_distanceToOtherUnit < separationRadius * 0.75) {
                var _pushDirection = point_direction(x, y, other.x, other.y);
                
                // Apply a moderate push in the opposite direction
                x += lengthdir_x(pushForce * 0.25, _pushDirection + 180);
                y += lengthdir_y(pushForce * 0.25, _pushDirection + 180);
            }
        }
    }
}
