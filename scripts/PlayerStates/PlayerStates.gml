function PlayerStateIdle()
{
	// State Update
	sprite_index = sPlayer;
	
	// State Transition
	if (isMoving) SwitchState(PlayerStateWalk, true);
	else hsp = 0;
	
	if (keyJump && jumpCount > 0 && jumpBuffer > 0)
	{
		PlayerJump();
		SwitchState(PlayerStateJump, true);
	}
	
	if (!onGround) 
	{
		SwitchState(PlayerStateFall, true);
	}
	
	// State Debug
	show_debug_message("Idle State");
}

function PlayerStateWalk()
{
	// State Update
	sprite_index = sPlayer;
	
	PlayerUpdateMovement();
	
	// State Transition
	if (!isMoving)
	{
		if (abs(hsp) < 0.3) SwitchState(PlayerStateIdle, true);
	}
	
	if (keyJump && jumpCount > 0 && jumpBuffer > 0)
	{
		PlayerJump();
		SwitchState(PlayerStateJump, true);
	}
	
	if (!onGround) 
	{
		SwitchState(PlayerStateFall, true);
	}
	
	// State Debug
	show_debug_message("Walk State");
}

function PlayerStateJump() 
{
	// State Update
	sprite_index = sPlayer;
	
	PlayerUpdateMovement();
	
	// State Transition
	if (jumpCount > 0 && keyJump)
	{
		PlayerJump();
		SwitchState(PlayerStateDoubleJump, true);
	}
	
	if (vsp > 0)
	{
		SwitchState(PlayerStateFall, true);
	}
	
	// State Debug
	show_debug_message("Jump State");
}

function PlayerStateDoubleJump() 
{
	// State Update
	sprite_index = sPlayer;
	
	PlayerUpdateMovement();
	
	// State Transition
	if (vsp > 0) 
	{
		SwitchState(PlayerStateFall, true);
	}
	
	// State Debug
	show_debug_message("Double Jump State");
}

function PlayerStateFall() 
{
	// State Update
	sprite_index = sPlayer;
	
	PlayerUpdateMovement();
	if (jumpCount >= jumpCountMax) jumpBuffer--;
	else postJumpBuffer--;
	
	// State Transition
	if (jumpBuffer > 0 && keyJump && jumpCount > 0 && postJumpBuffer > 0)
	{
		PlayerJump();
		SwitchState(PlayerStateJump, true);
	}
	
	if (onGround)
	{
		jumpBuffer = jumpBufferMax;
		postJumpBuffer = postJumpBufferMax;
		SwitchState(PlayerStateIdle, true);
	}
	
	// State Debug
	show_debug_message("Fall State");
}

function PlayerStateWallSlide() {}

function PlayerStateDash() {}

function PlayerStateHurt() {}

function PlayerStateDie() {}

function PlayerStateFreeze() {}

function PlayerStateWin() {}

function PlayerStateKnockback() {}

function PlayerStateAttackA() {}

function PlayerStateAttackB() {}

function PlayerStateAttackC() {}

function PlayerStateAttackD() {}

function PlayerStateAttackE() {}

function PlayerStateDialog() {}

function PlayerStateFlying() {}

function PlayerStateFloating() {}

function PlayerStateNone() {}