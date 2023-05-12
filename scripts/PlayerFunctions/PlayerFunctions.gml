function GetPlayerInputs()
{
	// All Player Inputs Here!
	keyRight = keyboard_check(ord("D")) or keyboard_check(vk_right);
	keyLeft = keyboard_check(ord("A")) or keyboard_check(vk_left);
	keyJump = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_space);
}

function PlayerJump()
{
	vsp = 0;
	jumpCount--;
	vsp -= jumpHeight;
}

function PlayerUpdateMovement()
{
	var _moveHor = (keyRight - keyLeft) * spdMax;
	
	if (isMoving) hsp = Approach(hsp, _moveHor, accel);
	else hsp = Approach(hsp, 0, deccel);
}