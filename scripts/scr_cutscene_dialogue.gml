///scr_cutscene_dialogue("Text",x,y,portrait,"position")

use_key = false;
global.use = false;
global.dialogueEnd = false;
global.runDialogue = true;
global.textSkip = false;

txt = instance_create(argument1, argument2, obj_cutscene_text);
with (txt)
{
    padding = 16;
    maxlength = 186;
    text = argument0;
    spd = .3;
    font = fnt_dialogue_rpg;
    portrait = argument3
    position = argument4
    
    
    text_length = string_length(text);
    font_size = font_get_size(font);
    
    draw_set_font(font)
    
    text_width = string_width_ext(text, font_size+(font_size/2), maxlength);
    text_height = string_height_ext(text, font_size+(font_size/2), maxlength);
    
}
