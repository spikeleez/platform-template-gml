function MakeCollision()
{
	var _col = instance_place(x + hsp, y, oWall);
	
	if (_col)
	{
		if (hsp > 0) x = _col.bbox_left + (x - bbox_right);
		if (hsp < 0) x = _col.bbox_right + (x - bbox_left);
		hsp = 0;
	}
	x += hsp;
	
	_col = instance_place(x, y + vsp, oWall);
	
	if (_col)
	{
		if (vsp > 0) y = _col.bbox_top + (y - bbox_bottom);
		if (vsp < 0) y = _col.bbox_bottom + (y - bbox_top);
		vsp = 0;
		
		jumpCount = jumpCountMax;
		jumpBuffer = jumpBufferMax;
	}
	y += vsp;
}

function UpdateFace()
{
	if (hsp != 0) image_xscale = sign(hsp);
}