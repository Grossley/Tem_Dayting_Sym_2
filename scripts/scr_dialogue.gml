//scr_dialogue("Text",speed,x,y)

use_key = false;
global.use = false;
global.dialogueEnd = false;
global.runDialogue = true;
global.textSkip = false

txt = instance_create(argument2, argument3, obj_text);
with (txt)
{
    padding = 16;
    maxlength = 385;
    text = argument0;
    spd = argument1;
    font = fnt_dialogues;
    
    text_length = string_length(text);
    font_size = font_get_size(font);
    
    draw_set_font(font)
    
    text_width = string_width_ext(text, font_size+(font_size/2), maxlength);
    text_height = string_height_ext(text, font_size+(font_size/2), maxlength);
    
}
