// Inherit the parent event
event_inherited();

keyRight =						-1;
keyLeft =						-1;
keyJump =						-1;
isMoving =						0;

spdMax =						3;
accel =							0.38;
deccel =						0.22;

// Jump Properties
jumpCountMax =					2;
coyoteTimerMax =				12;
jumpHeight =					8;
doubleJumpBufferMax =			30;
cornerSize =					8;
groundJumpBufferMax =			30;
groundJumpBuffer =				0;
doubleJumpDelayMax =			12;

state = PlayerStateIdle;
