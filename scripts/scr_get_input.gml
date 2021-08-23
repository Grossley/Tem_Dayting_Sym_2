///scr_get_input
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
down_key = keyboard_check(vk_down);
up_key = keyboard_check(vk_up);
use_key = keyboard_check(ord('Z'));
run_key = keyboard_check(ord('X'));

//Get the axis
xaxis = (right_key - left_key);
yaxis = (down_key - up_key);

//Check for gamepad input
if(gamepad_is_connected(0)){
    gamepad_set_axis_deadzone(0,.35);
    xaxis = gamepad_axis_value(0, gp_axislh);
    yaxis = gamepad_axis_value(0, gp_axislv);
    use_key_pad = gamepad_button_check(0, gp_face1);
    run_key_pad = gamepad_button_check(0, gp_face1);
}
