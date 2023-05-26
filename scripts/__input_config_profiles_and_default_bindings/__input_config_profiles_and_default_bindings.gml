//Input defines the default profiles as a macro called 
//This macro is parsed when Input boots up and provides the baseline bindings for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The root struct called INPUT_DEFAULT_PROFILES contains the names of each default profile
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

INPUT_DEFAULT_PROFILES = {
    
    keyboard_and_mouse:
    {
		#region Axis
		// Movement - Axis
        axis_move_up:					[input_binding_key(vk_up),    input_binding_key("W")],
        axis_move_down:					[input_binding_key(vk_down),  input_binding_key("S")],
        axis_move_left:					[input_binding_key(vk_left),  input_binding_key("A")],
        axis_move_right:				[input_binding_key(vk_right), input_binding_key("D")],
		#endregion
		
		#region Actions
		// Actions
		action_jump:					[input_binding_key(vk_up), input_binding_key("W"), input_binding_key(vk_space)],
		action_jump_hold:				[input_binding_key(vk_up), input_binding_key("W"), input_binding_key(vk_space)],
		action_shoot:					input_binding_mouse_button(mb_left),
		
		// UI
        action_accept:					[input_binding_key(vk_space), input_binding_key(vk_enter)],
        action_cancel:					input_binding_key(vk_backspace),
        action_special:					input_binding_key(vk_shift),
        action_pause:					input_binding_key(vk_escape),
		#endregion
    },
    
    gamepad:
    {
		#region Axis
		// Movement - Axis
        axis_move_up:					[input_binding_gamepad_axis(gp_axislv, true),  input_binding_gamepad_button(gp_padu)],
        axis_move_down:					[input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
        axis_move_left:					[input_binding_gamepad_axis(gp_axislh, true),  input_binding_gamepad_button(gp_padl)],
        axis_move_right:				[input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
		#endregion
        
		#region Actions
		// Actions
		action_aim_up:					input_binding_gamepad_axis(gp_axisrv, true),
        action_aim_down:				input_binding_gamepad_axis(gp_axisrv, false),
        action_aim_left:				input_binding_gamepad_axis(gp_axisrh, true),
        action_aim_right:				input_binding_gamepad_axis(gp_axisrh, false),
        action_shoot:					[input_binding_gamepad_button(gp_shoulderlb), input_binding_gamepad_button(gp_shoulderrb)],
		
		// UI
        action_accept:					[input_binding_gamepad_button(gp_face1), input_binding_gamepad_button(gp_face3)],
        action_cancel:					input_binding_gamepad_button(gp_face2),
        action_special:					input_binding_gamepad_button(gp_face4),
		action_pause:					input_binding_gamepad_button(gp_start),
		#endregion
    },
    
};

//Sets the preferred behaviour for input_binding_get() when a player has no profile set
//This typically happens when hotswapping and the player hasn't pressed any buttons/keys/etc. yet
//
//Three options are available:
//  0 = Always return an empty binding if the player has no profile set
//  1 = Prefer INPUT_AUTO_PROFILE_FOR_KEYBOARD for bindings if on desktop OSs, and use gamepad bindings otherwise
//  2 = Prefer INPUT_AUTO_PROFILE_FOR_GAMEPAD for bindings
#macro INPUT_FALLBACK_PROFILE_BEHAVIOUR  1

//Names of the default profiles to use when automatically assigning profiles based on the source that a
//player is currently using. Default profiles for sources that you don't intend to use in your game do
//not need to be defined
#macro INPUT_AUTO_PROFILE_FOR_KEYBOARD     "keyboard_and_mouse"
#macro INPUT_AUTO_PROFILE_FOR_MOUSE        "keyboard_and_mouse"
#macro INPUT_AUTO_PROFILE_FOR_GAMEPAD      "gamepad"
#macro INPUT_AUTO_PROFILE_FOR_MIXED        "mixed"
#macro INPUT_AUTO_PROFILE_FOR_MULTIDEVICE  "multidevice"

//Toggles whether INPUT_KEYBOARD and INPUT_MOUSE should be considered a single source at all times
//For most PC games you'll want to tie the keyboard and mouse together but occasionally having them
//separated out is useful
#macro INPUT_ASSIGN_KEYBOARD_AND_MOUSE_TOGETHER  true

//Whether to allow default profiles (see below) to contain different verbs. Normally every profile
//should contain a reference to every verb, but for complex games this is inconvenient
#macro INPUT_ALLOW_ASSYMMETRIC_DEFAULT_PROFILES  true