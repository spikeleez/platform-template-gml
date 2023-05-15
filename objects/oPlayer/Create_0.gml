// Inherit the parent event
event_inherited();

GetPlayerInputs();

spdMax =						2.5;
accel =							0.3;
deccel =						0.2;

// Jump Properties
jumpCountMax =					2;
coyoteTimerMax =				12;
jumpHeight =					8;
doubleJumpBufferMax =			30;
cornerSize =					8;
groundJumpBufferMax =			30;
groundJumpBuffer =				0;
doubleJumpDelayMax =			12;
jumpHoldFramesMax =				10;

state = PlayerStateIdle;
