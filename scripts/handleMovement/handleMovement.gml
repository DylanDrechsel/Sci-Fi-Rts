function handleMovement() {
    // Issue a movement command on right-click
	if (mouse_check_button_pressed(mb_right) && array_length(selectedUnits) > 0) {
	    var _xTarget = mouse_x;
	    var _yTarget = mouse_y;
    
	    // Pass the target position to each selected unit
	    for (var i = 0; i < array_length(selectedUnits); i++) {
	        var _unit = selectedUnits[i];
	        _unit.targetX = _xTarget;
	        _unit.targetY = _yTarget;
	    }
	}
}
