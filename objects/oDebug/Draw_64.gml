var _guiWidth = display_get_gui_width();
var _guiHeight = display_get_gui_height();

font_enable_sdf(font, true);
draw_set_font(font);

if (debugMode)
{
	var _string = oPlayer.stateName;
	var _stringWidth = string_width(_string);
	var _stringHeight = string_height(_string);
	
	draw_set_color(c_black);
	draw_set_alpha(0.7);
	draw_rectangle(_guiWidth - 170, _guiHeight - 50, _guiWidth - 10, _guiHeight - 10, false);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(_guiWidth - 160, _guiHeight - 42, _string);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	with (oPlayer)
	{
		draw_set_color(c_black);
		draw_set_alpha(0.7);
		draw_rectangle(10, 10, 250, 250, false);
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_text(20, 40, "HSP: " + string(hsp));
		draw_text(20, 60, "VSP: " + string(vsp));
		draw_text(20, 80, "Jump Count: " + string(jumpCount));
		draw_text(20, 100, "Jump Times: " + string(jumpTimes));
		draw_text(20, 120, "Coyote Time: " + string(coyoteTimer));
		draw_text(20, 140, "Double Jump Buffer: " + string(doubleJumpBuffer));
		draw_text(20, 160, "Double Jump Delay: " + string(doubleJumpDelay));
		draw_text(20, 180, "Ground Buffer Timer: " + string(groundJumpBuffer));
		draw_text(20, 200, "On Ground: " + string(OnGround()));
		draw_text(20, 220, "In Air: " + string(IsInAir()));
	}
}
draw_text(20, 20, "Show/Hide Debug: TAB");

draw_set_font(-1);
draw_set_color(c_white);
draw_set_alpha(1);