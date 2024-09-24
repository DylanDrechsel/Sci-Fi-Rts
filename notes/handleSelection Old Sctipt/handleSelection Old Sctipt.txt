function handleMovement() {
    // Grid formation variables
    var _gridSize = 32; // Distance between units in the grid
    var _unitsPerRow = 10; // Number of units per row in the formation

    // Track rows for unit types
    var _rowBuilder = 0; // Track rows for builder units
    var _rowVehicle = 0; // Track rows for vehicle units
    var _rowGround = 0; // Track rows for ground units

    // Issue a movement command on right-click
    if (mouse_check_button_pressed(mb_right) && array_length(selectedUnits) > 0) {
        var _xTarget = mouse_x;
        var _yTarget = mouse_y;

        // Loop through all selected units
        for (var i = 0; i < array_length(selectedUnits); i++) {
            var _unit = selectedUnits[i];

            var _col = 0; // Column variable to hold calculated offset
            var _offsetX = 0; // X offset for spacing
            var _offsetY = 0; // Y offset for spacing

            // Check unit type and assign target position accordingly
            if (_unit.unitType == "Builder") {
                _col = _rowBuilder % _unitsPerRow;  // Determine column for builder units
                _offsetX = _col * _gridSize;
                _offsetY = floor(_rowBuilder / _unitsPerRow) * _gridSize;
                _rowBuilder++;  // Move to the next unit position in the grid
            } 
            else if (_unit.unitType == "Vehicle") {
                _col = _rowVehicle % _unitsPerRow;  // Determine column for vehicle units
                _offsetX = _col * _gridSize;
                _offsetY = floor(_rowVehicle / _unitsPerRow) * _gridSize + (_gridSize * 2);  // Offset vehicles row further down
                _rowVehicle++;  // Move to the next unit position in the grid
            } 
            else if (_unit.unitType == "Ground") {
                _col = _rowGround % _unitsPerRow;  // Determine column for ground units
                _offsetX = _col * _gridSize;
                _offsetY = floor(_rowGround / _unitsPerRow) * _gridSize + (_gridSize * 4);  // Offset ground row even further down
                _rowGround++;  // Move to the next unit position in the grid
            }

            // Assign new target position with offset
            _unit.targetX = _xTarget + _offsetX;
            _unit.targetY = _yTarget + _offsetY; // Adjusted to use calculated row
        }
    }
}
