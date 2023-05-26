function PlayerJump()
{
	vsp = 0;
	vsp -= jumpHeight;
	
	jumpTimes += 1;
	jumpCount--;
	
	groundJumpBuffer = 0;
	
	Gummy(0.8, 1.2);
	
	Vibrate(1, 200, 0);
}

function KeyMovePressed()
{
	return ((input_check("axis_move_right") xor input_check("axis_move_left")) != 0)
}

function PlayerUpdateMovement()
{
	var _keyRight = input_check("axis_move_right");
	var _keyLeft = input_check("axis_move_left");
	
	if (KeyMovePressed())
	{
		dir = point_direction(0,0,_keyRight-_keyLeft,0);
		spd = Approach(spd, spdMax, accel);
	}
	else
	{
		spd = Approach(spd, 0, deccel);
	}
	
	hsp = lengthdir_x(spd, dir);
}

