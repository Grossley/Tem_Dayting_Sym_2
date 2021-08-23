///scr_find_choice_label(labelName)
for (var a = 0; a < array_height_2d(global.cutscene); a++) 
{
    if (string(global.cutscene[a,0]) == "label" && string(global.cutscene[a,1]) == string(argument0))
    {
        return a;
        break;
    }
    if (array_height_2d(global.cutscene)-1== a)
    {
        show_debug_message("ERROR: Could not find a label '" +string(argument0) +"'")
        return 9999;
        break;
    }
}
scr_cutscene_end()
