// Inherit the parent event
event_inherited();

draw_text(20, 20, "HSP: " + string(hsp));
draw_text(20, 40, "VSP: " + string(vsp));
draw_text(20, 60, "Jump Count: " + string(jumpCount));
draw_text(20, 80, "Jump Times: " + string(jumpTimes));
draw_text(20, 100, "Coyote Time: " + string(coyoteTimer));
draw_text(20, 120, "Double Jump Buffer: " + string(doubleJumpBuffer));
draw_text(20, 140, "Double Jump Delay: " + string(doubleJumpDelay));
draw_text(20, 160, "Ground Buffer Timer: " + string(groundJumpBuffer));
draw_text(20, 180, "On Ground: " + string(OnGround()));
draw_text(20, 200, "In Air: " + string(IsInAir()));
draw_text(20, 220, "Jump Hold Frames: " + string(jumpHoldFrames));


