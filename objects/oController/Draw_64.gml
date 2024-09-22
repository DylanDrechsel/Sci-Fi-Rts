// Draw Selection Box
if (selecting) {
	draw_set_color(c_white);
	draw_set_alpha(.3);
	draw_rectangle(boxStartX, boxStartX, boxEndX, boxEndY, false);
	draw_set_alpha(1);
}