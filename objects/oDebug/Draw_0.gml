if (debugMode)
{
	var _color = c_lime;
	with (oPlayer)
	{
		draw_rectangle_color(bbox_left, bbox_top, bbox_right-1, bbox_bottom-1, _color, _color, _color, _color, true);
	}
}