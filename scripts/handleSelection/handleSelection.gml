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
    
    // End selection when the left mouse button is released
    if (mouse_check_button_released(mb_left)) {
        selecting = false;

        // Clear the selectedUnits array
        selectedUnits = [];

        // Loop through all units to check selection
        with (oUnitController) {
            // Check if the unit's position is within the selection box
            if (x >= min(boxStartX, boxEndX) && x <= max(boxStartX, boxEndX) &&
                y >= min(boxStartY, boxEndY) && y <= max(boxStartY, boxEndY)) {
                selected = true;

                // Add the selected unit to the selectedUnits array
                selectedUnits[array_length(selectedUnits)] = id;
            } else {
                // Deselect if not inside the box
                selected = false;
            }
        }
    }
}
