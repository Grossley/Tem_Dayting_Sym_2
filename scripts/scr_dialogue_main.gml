///scr_dialogue_main

// if "talk"
if play[frame,0] == "talk"
{
    //play bleep
    if string_length(text) > obj_date_textbox.charTotal
    {
        //char bleeps
        if bleeptimer <= 0
        {
            var ran = floor(random(5))
            //doctor bleep
            if obj_date_textbox.text_name == "Doctor Temmie"
            {
                audio_play_sound(snd_bleep_main, 9, false);
                switch(ran)
                {
                    case 0: audio_sound_pitch(snd_bleep_main, 0.7) break;
                    case 1: audio_sound_pitch(snd_bleep_main, 0.75) break;
                    case 2: audio_sound_pitch(snd_bleep_main, 0.8) break;
                    case 3: audio_sound_pitch(snd_bleep_main, 0.85) break;
                    case 4: audio_sound_pitch(snd_bleep_main, 0.9) break;
                }
                audio_sound_gain(snd_bleep_main,global.sound_vol, 0);
                bleeptimer = doctor_delay
            }
            //protagonist bleep
            else if obj_date_textbox.text_name == string(global.name) || obj_date_textbox.text_name == "Protagonist Tem"
            {
                audio_play_sound(snd_bleep_main, 9, false);
                switch(ran)
                {
                    case 0: audio_sound_pitch(snd_bleep_main, 0.6) break;
                    case 1: audio_sound_pitch(snd_bleep_main, 0.62) break;
                    case 2: audio_sound_pitch(snd_bleep_main, 0.64) break;
                    case 3: audio_sound_pitch(snd_bleep_main, 0.66) break;
                    case 4: audio_sound_pitch(snd_bleep_main, 0.68) break;
                }
                audio_sound_gain(snd_bleep_main,global.sound_vol, 0);
                bleeptimer = nurse_delay
            }
            //nurse bleep
            else if obj_date_textbox.text_name == "Nurse Temmie"
            {
                audio_play_sound(snd_bleep_main, 9, false);
                switch(ran)
                {
                    case 0: audio_sound_pitch(snd_bleep_main, 0.9) break;
                    case 1: audio_sound_pitch(snd_bleep_main, 0.95) break;
                    case 2: audio_sound_pitch(snd_bleep_main, 1) break;
                    case 3: audio_sound_pitch(snd_bleep_main, 1.05) break;
                    case 4: audio_sound_pitch(snd_bleep_main, 1.1) break;
                }
                audio_sound_gain(snd_bleep_main,global.sound_vol, 0);
                bleeptimer = protag_delay
            }
            //default bleep
            else
            {
                audio_play_sound(snd_bleep_main, 9, false);
                switch(ran)
                {
                    case 0: audio_sound_pitch(snd_bleep_main, 0.2) break;
                    case 1: audio_sound_pitch(snd_bleep_main, 0.25) break;
                    case 2: audio_sound_pitch(snd_bleep_main, 0.3) break;
                    case 3: audio_sound_pitch(snd_bleep_main, 0.35) break;
                    case 4: audio_sound_pitch(snd_bleep_main, 0.4) break;
                }
                audio_sound_gain(snd_bleep_main,global.sound_vol, 0);
                bleeptimer = 20
            }
        }
        else
        {
            bleeptimer--
        }
    }
    
    
    if string_pos("*name*", string(play[frame,1])) != 0
    {
        text = string_insert(string(global.name), string(play[frame,1]), string_pos("*name*", string(play[frame,1])));
        text = string_replace(text, "*name*", ""); 
    }
    else if obj_date_textbox.update == false || text != play[frame,1]
    {
        obj_date_textbox.update = true
        text = play[frame,1]
    }
    
    if mouse_check_button_pressed(mb_left)
    {
        if string_length(text) > obj_date_textbox.charTotal
        {
            obj_date_textbox.charTotal = string_length(text) + 1
        }
        else
        {
            scr_next_frame()
        }
    }
    else if skipTimer < 1 && keyboard_check(vk_control)
    {
        skipTimer = skip;
        scr_next_frame()
    }
}

if play[frame,0] == "fake talk"
{
    if !instance_exists(obj_fake)
    {
        instance_create(-50,-50,obj_fake)
    }
    else
    {
        obj_fake.text = play[obj_date_main.frame,1]
        obj_fake.name = play[obj_date_main.frame,2]
    }
    
    if mouse_check_button_pressed(mb_left) && instance_exists(obj_fake)
    {
        with(obj_fake)
        {
            instance_destroy()
        }
        scr_next_frame()
    }
}

// if "blank"
else if play[frame,0] == "blank"
{
    text = ""
    obj_date_textbox.text_name = ""
    scr_next_frame()
}

// if "choice2"
else if play[frame,0] == "choice2"
{
    obj_date_textbox.text_name = ""
    if string_pos("*name*", string(play[frame,1])) != 0
    {
        text = string_insert(string(global.name), string(play[frame,1]), string_pos("*name*", string(play[frame,1])));
        text = string_replace(text, "*name*", ""); 
    }
    else
    {
        text = play[frame,1]
    }
    
    if !instance_exists(obj_choice_button)
    {
        with instance_create(640,175,obj_choice_button)
        {
            text = obj_date_main.play[obj_date_main.frame,2]
            myLabel = obj_date_main.play[obj_date_main.frame,3]
        }
        with instance_create(640,325,obj_choice_button)
        {
            text = obj_date_main.play[obj_date_main.frame,4]
            myLabel = obj_date_main.play[obj_date_main.frame,5]
        }
    }
}

// if "choice3"
else if play[frame,0] == "choice3"
{
    obj_date_textbox.text_name = ""
    if string_pos("*name*", string(play[frame,1])) != 0
    {
        text = string_insert(string(global.name), string(play[frame,1]), string_pos("*name*", string(play[frame,1])));
        text = string_replace(text, "*name*", ""); 
    }
    else
    {
        text = play[frame,1]
    }
    
    if !instance_exists(obj_choice_button)
    {
        with instance_create(640,125,obj_choice_button)
        {
            text = obj_date_main.play[obj_date_main.frame,2]
            myLabel = obj_date_main.play[obj_date_main.frame,3]
        }
        with instance_create(640,250,obj_choice_button)
        {
            text = obj_date_main.play[obj_date_main.frame,4]
            myLabel = obj_date_main.play[obj_date_main.frame,5]
        }
        with instance_create(640,375,obj_choice_button)
        {
            text = obj_date_main.play[obj_date_main.frame,6]
            myLabel = obj_date_main.play[obj_date_main.frame,7]
        }
    }
}

// if "choice2 fake"
else if play[frame,0] == "choice2 fake"
{
    if !instance_exists(obj_fake)
    {
        instance_create(-50,-50,obj_fake)
    }
    else
    {
        obj_fake.name = ""
    }
    if string_pos("*name*", string(play[frame,1])) != 0
    {
        text = string_insert(string(global.name), string(play[frame,1]), string_pos("*name*", string(play[frame,1])));
        text = string_replace(text, "*name*", ""); 
    }
    else
    {
        text = play[frame,1]
    }
    
    if !instance_exists(obj_choice_fake)
    {
        with instance_create(640,175,obj_choice_fake)
        {
            text = obj_date_main.play[obj_date_main.frame,2]
            myLabel = obj_date_main.play[obj_date_main.frame,3]
        }
        with instance_create(640,325,obj_choice_fake)
        {
            text = obj_date_main.play[obj_date_main.frame,4]
            myLabel = obj_date_main.play[obj_date_main.frame,5]
        }
    }
}

// if "choices fake"
else if play[frame,0] == "choices fake"
{
    if !instance_exists(obj_fake)
    {
        instance_create(-50,-50,obj_fake)
    }
    else
    {
        obj_fake.name = ""
    }
    if string_pos("*name*", string(play[frame,1])) != 0
    {
        text = string_insert(string(global.name), string(play[frame,1]), string_pos("*name*", string(play[frame,1])));
        text = string_replace(text, "*name*", ""); 
    }
    else
    {
        text = play[frame,1]
    }
    
    if !instance_exists(obj_choice_fake)
    {
        with instance_create(55,200,obj_choice_fake)
        {
            text = obj_date_main.play[obj_date_main.frame,3]
            myLabel = obj_date_main.play[obj_date_main.frame,2]
        }
        with instance_create(360,175,obj_choice_fake)
        {
            text = obj_date_main.play[obj_date_main.frame,4]
            myLabel = obj_date_main.play[obj_date_main.frame,2]
        }
        with instance_create(640,325,obj_choice_fake)
        {
            text = obj_date_main.play[obj_date_main.frame,5]
            myLabel = obj_date_main.play[obj_date_main.frame,2]
        }
    }
}

// if "sprite"
else if play[frame,0] == "sprite"
{
    if sprite_exists(play[frame,2]) && instance_exists(play[frame,1])
    {
        play[frame,1].sprite_index = play[frame,2]
    }
    scr_next_frame()
}

// if "sprite face"
else if play[frame,0] == "sprite face"
{
    if sprite_exists(play[frame,2]) && instance_exists(play[frame,1])
    {
        play[frame,1].face = play[frame,2]
    }
    scr_next_frame()
}

// if "sprite effect"
else if play[frame,0] == "sprite effect"
{
    if sprite_exists(play[frame,2]) && instance_exists(play[frame,1])
    {
        play[frame,1].effect = play[frame,2]
    }
    scr_next_frame()
}

// if "move linear"
else if play[frame,0] == "move linear"
{
    if getDistance == true
    {
        dir = point_direction(play[frame,1].x, play[frame,1].y, play[frame,2], play[frame,3]);
        spd = (point_distance(play[frame,1].x, play[frame,1].y , play[frame,2], play[frame,3]) / play[frame,4]) / 60
        getDistance = false
    }
    
    if point_distance(play[frame,1].x, play[frame,1].y , play[frame,2], play[frame,3]) > spd
    {
        play[frame,1].x += lengthdir_x(spd, dir)
        play[frame,1].y += lengthdir_y(spd, dir)
    }
    else
    {
        play[frame,1].x = play[frame,2]
        play[frame,1].y = play[frame,3]
        getDistance = true
        skipTimer = skip;
        scr_next_frame()
    }
    if mouse_check_button_pressed(mb_left) && getDistance == false && !keyboard_check(vk_control)
    {
        play[frame,1].x = play[frame,2]
        play[frame,1].y = play[frame,3]
        getDistance = true
        scr_next_frame()
    }
    else if skipTimer < 1 && keyboard_check(vk_control) && !mouse_check_button(mb_left)
    {
        play[frame,1].x = play[frame,2]
        play[frame,1].y = play[frame,3]
        getDistance = true
        skipTimer = skip;
        scr_next_frame()
    }
}

// if "label"
else if play[frame,0] == "label"
{
    scr_next_frame()
}

// if "jump"
else if play[frame,0] == "jump"
{
    for(i=0 ;i<=array_height_2d(play)-1 ;i++)
    {
        if play[i,0] == "label" && play[i,1] == play[frame,1]
        {
            frame = i;
            break;
        }
    }
    scr_next_frame()
}

// if "background"
else if play[frame,0] == "bg"
{
    background = play[frame,1]
    scr_next_frame()
}

// if "background fade in"
else if play[frame,0] == "bg fade in"
{
    if fade != "in" 
    { 
        background = background2
        background2 = play[frame,1];
        bg2alpha = 0;
        alpharate = 1 / (play[frame,2] * 60)
        fade = "in"
        text = ""
    }
}

// if "background fade out"
else if play[frame,0] == "bg fade out"
{
    if fade != "out"
    { 
        background = background2
        background2 = play[frame,1];
        bg2alpha = 1;
        alpharate = 1 / (play[frame,2] * 60)
        fade = "out"
        text = ""
    }
}

// if "dialogue name"
else if play[frame,0] == "name"
{
    if string(play[frame,1]) == "*name*"
    {
        obj_date_textbox.text_name = string(global.name)
        scr_next_frame()
    }
    else
    {
        obj_date_textbox.text_name = play[frame,1]
        scr_next_frame()
    }
}

// if "dialogue speed"
else if play[frame,0] == "spd"
{
    obj_date_textbox.text_speed = play[frame,1]
    scr_next_frame()
}

// if "create"
else if play[frame,0] == "create"
{
    if !instance_exists(play[frame,1])
    {
        instance_create(play[frame,2], play[frame,3], play[frame,1])
    }
    scr_next_frame()
}

// if "animate"
else if play[frame,0] == "animate"
{
    play[frame,1].assign = 0;
    play[frame,1].frame = 0;
    if play[frame,2] == "clipboard"
    {
        with (play[frame,1])
        {
            animation_clipboard()
        }
    }
    else if play[frame,2] == "facein"
    {
        with (play[frame,1])
        {
            animation_face_fadein()
        }
    }
    else if play[frame,2] == "faceout"
    {
        with (play[frame,1])
        {
            animation_face_fadeout()
        }
    }
    else if play[frame,2] == "diploma"
    {
        with (play[frame,1])
        {
            animation_show_diploma()
        }
    }
    else if play[frame,2] == "back"
    {
        with (play[frame,1])
        {
            animation_back_to_middle()
        }
    }
    else if play[frame,2] == "console down"
    {
        with (play[frame,1])
        {
            animation_console_down()
        }
    }
    else if play[frame,2] == "run"
    {
        with (play[frame,1])
        {
            animation_run()
        }
    }
    play[frame,1].startAnimation = true;
    
    
    scr_next_frame()
}

// if "destroy"
else if play[frame,0] == "destroy"
{
    with(play[frame,1])
    {
        instance_destroy()
    }
    scr_next_frame()
}

// if "wait"
else if play[frame,0] == "wait"
{
    if setTimer == true
    {
        obj_date_textbox.update = false
        timer = play[frame,1] 
        setTimer = false;
    }
    
    if timer > 0
    {
        timer --
    }
    else
    {
        setTimer = true
        scr_next_frame()
    }
    
    if mouse_check_button_pressed(mb_left)
    {
        setTimer = true
        scr_next_frame()
    }
    else if skipTimer < 1 && keyboard_check(vk_control)
    {
        setTimer = true
        scr_next_frame()
    }
}

// if "name input"
else if play[frame,0] == "name input"
{
    if obj_date_textbox.nameInput == false
    {
        keyboard_string = ""
        text = "What's your name?  #Press [ENTER] to confirm."
        obj_date_textbox.nameInput = true
    }
}

// if "compare name"
else if play[frame,0] == "compare name"
{
    if string(string_lower(global.name)) == string(play[frame,1])
    {
        for(m=0 ;m<=array_height_2d(play)-1 ;m++)
        {
            if play[m,0] == "label" && string(play[m,1]) == string(play[frame,2])
            {
                frame = m;
                break;
            }
        }
    }
    scr_next_frame()
} 

else if play[frame,0] == "draw"
{
    obj_date_textbox.update = play[frame,1]
    scr_next_frame() 
}
else if play[frame,0] == "room"
{
    if room_exists(play[frame,1])
    {
        room_goto(play[frame,1])
    }
}
else if play[frame,0] == "alternate"
{
    global.alternative = play[frame,1]
    scr_next_frame() 
}
else if play[frame,0] == "jump alternate"
{
    if global.alternative == 1
    {
        for(z=0 ;z<=array_height_2d(play)-1 ;z++)
        {
            if play[z,0] == "label" && play[z,1] == "alternative"
            {
                frame = z;
                break;
            }
        }
    }
    else if global.alternative == 2
    {
        for(z=0 ;z<=array_height_2d(play)-1 ;z++)
        {
            if play[z,0] == "label" && play[z,1] == "alternative2"
            {
                frame = z;
                break;
            }
        }
    }
    scr_next_frame() 
}
else if play[frame,0] == "music play"
{
    if audio_group_is_loaded(audiogroup_vn_music)
    {
        
        audio_group_stop_all(audiogroup_vn_music)
        audio_play_sound(play[frame,1], play[frame,2], play[frame,3]);
    }
    else
    {
        show_debug_message("Can't play music, audiogroup is not loaded")
    }
    scr_next_frame() 
}
else if play[frame,0] == "music play fake"
{
    if audio_group_is_loaded(audiogroup_platformer_music)
    {
        audio_group_stop_all(audiogroup_platformer_music)
        audio_play_sound(play[frame,1], play[frame,2], play[frame,3]);
    }
    else
    {
        show_debug_message("Can't play music, audiogroup is not loaded")
    }
    scr_next_frame() 
}
else if play[frame,0] == "sound play"
{
    if audio_group_is_loaded(audiogroup_vn_sf)
    {
        audio_group_set_gain(audiogroup_vn_sf, 0.3 * global.sound_vol, 0);
        audio_play_sound(play[frame,1], 8, false);
    }
    else
    {
        show_debug_message("Can't play sound effect, audiogroup is not loaded")
    }
    scr_next_frame()
}
else if play[frame,0] == "audio fade"
{
    audio_group_set_gain(audiogroup_vn_music, play[frame,1]*global.music_vol, play[frame,2]);
    scr_next_frame()
}
else if play[frame,0] == "audio fake"
{
    audio_group_set_gain(audiogroup_platformer_music, play[frame,1]*global.music_vol, play[frame,2]);
    scr_next_frame()
}
else if play[frame,0] == "sprite speed"
{
    play[frame,1].image_speed = play[frame,2]
    scr_next_frame()
}
else if play[frame,0] == "sprite state"
{
    play[frame,1].state = play[frame,2]
    scr_next_frame()
}
else if play[frame,0] == "zero opacity"
{
    play[frame,1].image_alpha = 0
    scr_next_frame()
}
else if play[frame,0] == "sprite size"
{
    play[frame,1].size = play[frame,2]
    scr_next_frame()
}
else if play[frame,0] == "turn"
{
    play[frame,1].dir = play[frame,2]
    scr_next_frame()
}
