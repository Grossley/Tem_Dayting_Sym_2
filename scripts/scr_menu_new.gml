///scr_menu()
switch (mpos)
{
    case 0:
        room_goto(rm_beach);
        break;
    
    case 1:
        game_end();
        break;
        
    default:
        break;
}
