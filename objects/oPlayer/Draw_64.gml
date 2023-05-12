// Inherit the parent event
event_inherited();

draw_text(20, 20, "HSP: " + string(hsp));
draw_text(20, 40, "VSP: " + string(vsp));
draw_text(20, 60, "Jump Count: " + string(jumpCount));
draw_text(20, 80, "Coyote Time: " + string(jumpBuffer));
draw_text(20, 100, "Post Jump Buffer: " + string(postJumpBuffer));

