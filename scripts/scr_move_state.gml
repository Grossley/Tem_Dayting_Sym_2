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
image_speed = .15 * (rspd)
if (len == 0) image_index = 0;


//Vertical sprites
if (vspd > 0){
    facing = "down"
}else if (vspd < 0){
    facing = "up"
}

//Horizontal sprites
if (hspd > 0){
    facing = "right"
    if(room == rm_rpg_3to4)
    {
        sprite_index = spr_swim_right;
    }
    else
    {
        sprite_index = spr_player_right;
    }
}else if (hspd < 0){
    facing = "left"
    if(room == rm_rpg_3to4)
    {
        sprite_index = spr_swim_left;
    }
    else
    {
        sprite_index = spr_player_left;
    }
}
