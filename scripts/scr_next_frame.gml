///scr_next_frame()
if array_height_2d(play) - 1 <  frame + 1
{
    show_debug_message("dating ends")
}
else
{
    bleeptimer = 0
    frame ++
    obj_date_textbox.charTotal = 0;
    obj_date_textbox.bleep = true
}
