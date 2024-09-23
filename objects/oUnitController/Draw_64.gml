event_inherited();
draw_self();

// Highlight the unit if it's selected
if (selected) {
    draw_set_color(c_yellow);  // Highlight color
    draw_rectangle(x - 16, y - 16, x + 16, y + 16, true);  // Draw outline around unit
}

