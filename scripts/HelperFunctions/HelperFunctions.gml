function Approach(a, b, amount)
{
	if (a < b)
	{
		a += amount;
		if (a > b)
			return b;
	}
	else
	{
		a -= amount;
		if (a < b)
			return b;
	}
	return a;
}

/// @function SwitchState(state, [forceResetImageIndex]);
function SwitchState(_state, _forceResetImageIndex = false)
{
	if (_forceResetImageIndex) image_index = 0;
	state = _state;
}