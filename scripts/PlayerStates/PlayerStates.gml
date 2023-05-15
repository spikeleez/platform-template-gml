function PlayerStateIdle()
{
	// State Update
	sprite_index = sPlayer;
	
	// State Transition
	if (isMoving) SwitchState(PlayerStateWalk, true);
	else hsp = 0;
	
	if (keyJump && jumpCount > 0)
	{
		PlayerJump();
		SwitchState(PlayerStateJump, true);
	}
	
	if (IsInAir() && vsp > 0) 
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
	
	if (keyJump && jumpCount > 0)
	{
		PlayerJump();
		SwitchState(PlayerStateJump, true);
	}
	
	if (IsInAir() && vsp > 0) 
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
	if (keyJump && doubleJumpBuffer > 0 && jumpCount > 0 && doubleJumpDelay <= 0)
	{
		PlayerJump();
		SwitchState(PlayerStateDoubleJump, true);
	}
	
	if (keyJump) groundJumpBuffer = groundJumpBufferMax;
	
	if (vsp > 0) SwitchState(PlayerStateFall, true);
	
	// State Debug
	show_debug_message("Jump State");
}

function PlayerStateDoubleJump() 
{
	// State Update
	sprite_index = sPlayer;
	
	PlayerUpdateMovement();
	
	// State Transition
	if (vsp > 0) SwitchState(PlayerStateFall, true);
	
	// State Debug
	show_debug_message("Double Jump State");
}

function PlayerStateFall()
{
	// State Update
	sprite_index = sPlayer;
	
	PlayerUpdateMovement();
	
	if (keyJump) groundJumpBuffer = groundJumpBufferMax;
	
	// State Transition
	if (OnGround()) SwitchState(PlayerStateIdle, true);
	else
	{
		if (jumpTimes <= 0)
		{
			 coyoteTimer--;
			 if (keyJump && coyoteTimer > 0 && jumpCount > 0)
			 {
				 PlayerJump();
				SwitchState(PlayerStateJump, true); 
			 }
		}
		else
		{
			doubleJumpBuffer--;
			if (keyJump && doubleJumpBuffer > 0 && jumpCount > 0)
			{
				PlayerJump();
				SwitchState(PlayerStateDoubleJump, true);
			}
		}
	}
	
	// State Debug
	show_debug_message("Fall State");
}