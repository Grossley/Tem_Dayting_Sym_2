///scr_menu()
switch (mpos)
{
    case 0:
        room_goto(rm_platformer_title);
        break;
        
    case 1:
        room_goto(rm_vn_doctor);
        break;
        
    case 2:
        room_goto(rpg_intro);
        break;
        
    case 3:
        room_goto(rm_rpg_1)
        break;
        
    case 4:
        room_goto(rm_fight);
        break;
        
    case 5:
        room_goto(rm_temika);
        break;
        
    case 6:
        room_goto(rm_menu0);
        break;
        
    case 7:
        room_goto(rm_rpg_4)
        break;
        
    case 8:
        room_goto(rm_credits)
        break;
        
    case 9:
        global.rad_got = true;
        global.teach_got = true;
        global.tsun_got = true;
        room_goto(rm_ending)
        break;
        
    default:
        break;
}
global.debug_visibility = false
show_debug_overlay(false)
obj_Persistency.debug = true
