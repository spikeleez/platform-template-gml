state();

UpdateFace();

tempGround = place_meeting(x, y + 1, oWall);

vsp = clamp(vsp, -vspMax, vspMax);
hsp = clamp(hsp, -hspMax, hspMax);
coyoteTimer = clamp(coyoteTimer, 0, coyoteTimerMax);
doubleJumpBuffer = clamp(doubleJumpBuffer, 0, doubleJumpBufferMax);

if (groundJumpBuffer > 0) groundJumpBuffer--;
if (doubleJumpDelay > 0 && jumpTimes > 0) doubleJumpDelay--;

if (!OnGround()) vsp += gravForce;
