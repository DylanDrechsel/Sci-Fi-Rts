// Draw Selection Box
if (selecting) {
    draw_set_color(c_white);
    draw_set_alpha(0.3);
    
    // Use min/max to ensure the rectangle is drawn correctly regardless of drag direction
    var _x1 = max(boxStartX, boxEndX);
    var _x2 = max(boxStartX, boxEndX);
    var _y1 = min(boxStartY, boxEndY);
    var _y2 = max(boxStartY, boxEndY);
    
    // Draw the rectangle using the corrected coordinates
    draw_rectangle(_x1, _y1, _x2, _y2, true);
    
    draw_set_alpha(1);
}
