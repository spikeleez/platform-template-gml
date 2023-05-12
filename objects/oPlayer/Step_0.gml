// get Player Inputs Every Frame
GetPlayerInputs();

// Inherit the parent event
event_inherited();

// Check If Player is Moving
isMoving = (keyRight xor keyLeft) != 0;