handleSelection();
if (mouse_check_button_pressed(mb_right)) {
	var _xTarget = mouse_x;
	var _yTarget = mouse_y;
	handleMovement(_xTarget, _yTarget);
}