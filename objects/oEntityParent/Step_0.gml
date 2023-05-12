state();

UpdateFace();

onGround = place_meeting(x, y + 1, oWall);

vsp = clamp(vsp, -vspMax, vspMax);
hsp = clamp(hsp, -hspMax, hspMax);
jumpBuffer = clamp(jumpBuffer, 0, jumpBufferMax);
postJumpBuffer = clamp(postJumpBuffer, 0, postJumpBufferMax);

if (!onGround)
{
	vsp += gravForce;
}
