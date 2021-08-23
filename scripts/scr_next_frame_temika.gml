///scr_next_frame_trial()
if array_height_2d(play) - 1 <  frame + 1
{
    show_debug_message("end")
}
else
{
    bleeptimer = 0
    frame ++
    obj_temika_textbox.charTotal = 0;
    obj_temika_textbox.bleep = true;
    text = ""
}
