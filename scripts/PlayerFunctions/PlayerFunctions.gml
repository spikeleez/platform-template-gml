function GetPlayerInputs()
{
	// All Player Inputs Here!
	keyRight = keyboard_check(ord("D")) or keyboard_check(vk_right);
	keyLeft = keyboard_check(ord("A")) or keyboard_check(vk_left);
	keyJumpPressed = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_space);
	keyJumpHold = keyboard_check(ord("W")) or keyboard_check(vk_space);
}

function PlayerJump()
{
	vsp = 0;
	vsp -= jumpHeight;
	
	jumpTimes += 1;
	jumpCount--;
	
	groundJumpBuffer = 0;
	
	Gummy(0.8, 1.2);
}

function KeyMovePressed()
{
	return ((keyRight xor keyLeft) != 0)
}

function PlayerUpdateMovement()
{
	var _moveHor = (keyRight - keyLeft) * spdMax;
	
	if (KeyMovePressed())
	{
		dir = point_direction(0,0,keyRight-keyLeft,0);
		spd = Approach(spd, spdMax, accel);
	}
	else
	{
		spd = Approach(spd, 0, deccel);
	}
	
	hsp = lengthdir_x(spd, dir);
}

