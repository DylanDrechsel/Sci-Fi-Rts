function handleSelection() {
    // Start selection when the left mouse button is pressed
    if (mouse_check_button_pressed(mb_left)) {
        selecting = true;
        boxStartX = mouse_x;
        boxStartY = mouse_y;
    }
    
    // Update selection box while dragging
    if (selecting) {
        boxEndX = mouse_x;
        boxEndY = mouse_y;
    }
    
    // Only clear the selectedUnits array if Shift is NOT held
    if (mouse_check_button_released(mb_left)) {
        selecting = false;

        // Clear the selectedUnits array
		if (!keyboard_check(vk_lshift)) selectedUnits = [];
		

        // Loop through all units to check selection
        with (oUnitController) {
            // Check if the unit's position is within the selection box
            if (x >= min(boxStartX, boxEndX) && x <= max(boxStartX, boxEndX) &&
                y >= min(boxStartY, boxEndY) && y <= max(boxStartY, boxEndY)) {
                selected = true;

                // Add the selected unit to the selectedUnits array
                selectedUnits[array_length(selectedUnits)] = id;
            } else {
                // Only deselect the unit if it's not already in the selectedUnits array
                var _inSelectedArray = false;

                // Loop through the selectedUnits array to check if the unit's id is in the array
                for (var i = 0; i < array_length(selectedUnits); i++) {
                    if (selectedUnits[i] == id) {
                        _inSelectedArray = true;
                        break;
                    }
                }

                // Deselect only if not in the selectedUnits array
                if (!_inSelectedArray) {
                    selected = false;
                }
            }
        }
    }
}
