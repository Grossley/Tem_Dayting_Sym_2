///scr_find_label(string)
for (var o = 0; o < array_height_2d(global.cutscene); o++) 
{
    if (string(global.cutscene[o,0]) == "label" && string(global.cutscene[o,1]) == argument0)
    {
        return o;
        break;
    }
    if (array_height_2d(global.cutscene)-1== o)
    {
        show_debug_message("ERROR: Could not find a label '" +argument0 +"'")
        global.cutsceneNumber = 9999
        scr_cutscene_end()
        break;
    }
}
