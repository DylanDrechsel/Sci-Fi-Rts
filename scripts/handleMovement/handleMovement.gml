function handleMovement() {
    // Grid formation variables
    var _gridSize = 32; // Distance between units in the grid
    var _unitsPerRow = 10; // Number of units per row in the formation
    var _row = 0; // Track rows for units
    
    // Issue a movement command on right-click
	if (mouse_check_button_pressed(mb_right) && array_length(selectedUnits) > 0) {
	    var _xTarget = mouse_x;
	    var _yTarget = mouse_y;
    
        // Loop through all selected units
        for (var i = 0; i < array_length(selectedUnits); i++) {
            var _unit = selectedUnits[i];
            
            // Calculate grid offset for each unit
            var _col = i % _unitsPerRow; // Determine which column the unit should be in
            _row = floor(i / _unitsPerRow); // Determine which row the unit is in
            
            // Set the target with offset for unit spacing
            var _offsetX = _col * _gridSize;
            var _offsetY = _row * _gridSize;
            
            // Assign new target position with offset
            _unit.targetX = _xTarget + _offsetX;
            _unit.targetY = _yTarget + _offsetY;
        }
	}
}
