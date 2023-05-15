function PlayerStateIdle()
{
	// State Update
	sprite_index = sPlayer;
	
	// State Transition
	if (KeyMovePressed()) SwitchState(PlayerStateWalk, true);
	else hsp = 0;
	
	if (keyJumpPressed && jumpCount > 0)
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
	if (!KeyMovePressed())
	{
		if (abs(hsp) < 0.3) SwitchState(PlayerStateIdle, true);
	}
	
	if (keyJumpPressed && jumpCount > 0)
	{
		PlayerJump();
		SwitchState(PlayerStateJump, true);
	}
	
	if (IsInAir() && vsp > 0) SwitchState(PlayerStateFall, true);
	
	// State Debug
	show_debug_message("Walk State");
}

function PlayerStateJump() 
{
	// State Update
	sprite_index = sPlayer;
	
	PlayerUpdateMovement();
	
	if (!keyJumpHold && vsp < 0) vsp = max(vsp, -jumpHeight * 0.5);
	
	if (keyJumpPressed) groundJumpBuffer = groundJumpBufferMax;
	
	// State Transition
	if (keyJumpPressed && doubleJumpBuffer > 0 && jumpCount > 0 && doubleJumpDelay <= 0)
	{
		PlayerJump();
		SwitchState(PlayerStateDoubleJump, true);
	}
	
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
	
	if (keyJumpPressed) groundJumpBuffer = groundJumpBufferMax;
	
	// State Transition
	if (OnGround()) SwitchState(PlayerStateIdle, true);
	else
	{
		if (jumpTimes <= 0)
		{
			 coyoteTimer--;
			 if (keyJumpPressed && coyoteTimer > 0 && jumpCount > 0)
			 {
				 PlayerJump();
				SwitchState(PlayerStateJump, true); 
			 }
		}
		else
		{
			doubleJumpBuffer--;
			if (keyJumpPressed && doubleJumpBuffer > 0 && jumpCount > 0)
			{
				PlayerJump();
				SwitchState(PlayerStateDoubleJump, true);
			}
		}
	}
	
	// State Debug
	show_debug_message("Fall State");
}