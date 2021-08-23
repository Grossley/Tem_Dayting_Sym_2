///scr_run_state

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

state = scr_move_state;

