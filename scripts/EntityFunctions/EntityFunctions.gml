function MakeCollision()
{
	#region Horizontal Collision
	var _col = instance_place(x + hsp, y, oCollision);
	
	if (_col)
	{
		// Check Right Collision
		if (hsp > 0) x = _col.bbox_left + (x - bbox_right);
		
		// Check Left Collision
		if (hsp < 0) x = _col.bbox_right + (x - bbox_left);
		
		hsp = 0;
	}
	x += hsp;
	#endregion
	
	#region Vertical Collision
	_col = instance_place(x, y + vsp, oCollision);
	
	if (_col)
	{
		// Check Bottom Collision
		if (vsp > 0)
		{
			y = _col.bbox_top + (y - bbox_bottom);
			vsp = 0;
		}
		
		// Check Top Collision
		if (vsp < 0)
		{
			var _stopCollision = true;
			
			// Check corner - left
			for (var i = 0; i < cornerSize; i++)
			{
				var _free = !place_meeting(x - i, y + vsp, oCollision);
				if (_free)
				{
					x -= i;
					_stopCollision = false;
					break;
				}
			}
			
			// Check corner - right
			for (var i = 0; i < cornerSize; i++)
			{
				var _free = !place_meeting(x + i, y + vsp, oCollision);
				if (_free)
				{
					x += i;
					_stopCollision = false;
					break;
				}
			}
			
			if (_stopCollision)
			{
				y = _col.bbox_bottom + (y - bbox_top);	
				vsp = 0
			}
		}
	}
	y += vsp;
	#endregion
}

function UpdateFace()
{
	if (hsp != 0) image_xscale = sign(hsp);
}

function OnGround()
{
	if (place_meeting(x, y+1, oCollision))
	{
		if (!input_check_pressed("action_jump"))
		{
			jumpTimes = 0;
			jumpCount = jumpCountMax;
			coyoteTimer = coyoteTimerMax;
			doubleJumpBuffer = doubleJumpBufferMax;
			doubleJumpDelay = doubleJumpDelayMax;
		}
		
		return true;
	}
	else
	{
		return false;
	}
}

function IsInAir()
{
	if (!OnGround()) return true; else return false;
}

function CanGummy()
{
	xscale = lerp(xscale, 1, 0.2);
	yscale = lerp(yscale, 1, 0.2);
}

/// @function Gummy(xscale, yscale);
function Gummy(_xscale, _yscale)
{
	xscale = _xscale;
	yscale = _yscale;
}