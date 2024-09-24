function handleMovement() {
    // Grid formation variables
    var _gridSize = 32;  // Distance between units in the grid
    var _unitsPerRow = 10;  // Number of units per row in the formation

    // Issue a movement command on right-click
    if (mouse_check_button_pressed(mb_right) && array_length(selectedUnits) > 0) {
        var _xTarget = mouse_x;
        var _yTarget = mouse_y;

        // Track the current row and column
        var _rowCount = 0;  // Row count to determine row/column

        // Loop through all selected units
        for (var i = 0; i < array_length(selectedUnits); i++) {
            var _unit = selectedUnits[i];

            // Calculate the column and row for this unit
            var _col = _rowCount % _unitsPerRow;  // Column number (0 to 9)
            var _row = floor(_rowCount / _unitsPerRow);  // Row number

            // Calculate the position offset
            var _offsetX = _col * _gridSize;  // X offset based on column
            var _offsetY = _row * _gridSize;  // Y offset based on row

            // Increment the row count for the next unit
            _rowCount++;

            // Assign the target position with the offset
            _unit.targetX = _xTarget + _offsetX;
            _unit.targetY = _yTarget + _offsetY;
        }
    }
}
