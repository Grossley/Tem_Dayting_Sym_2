///scr_move_state

var running = 0.85;
var norSpeed = 0.5;

scr_get_input();

if (run_key){
    state = scr_run_state;
    rspd = running;
}
else{
    rspd = norSpeed;
}

//Get direction
dir = point_direction(0, 0, xaxis, yaxis);

//Get length
if (xaxis==0 && yaxis==0){
    len=0;
} else{
    len=spd;
}

//Get hspd and vspd
hspd = lengthdir_x(len,dir);
vspd = lengthdir_y(len,dir);

//Move
phy_position_x += hspd * rspd;
phy_position_y += vspd * rspd;

//Control the sprite
image_speed = .6 * (rspd)
if (len == 0) image_index = 0;


//Vertical sprites
if (vspd > 0){
    sprite_index = spr_player_down;
}else if (vspd < 0){
    sprite_index = spr_player_up;
}

//Horizontal sprites
if (hspd > 0){
    sprite_index = spr_player_right;
}else if (hspd < 0){
    sprite_index = spr_player_left;
}
