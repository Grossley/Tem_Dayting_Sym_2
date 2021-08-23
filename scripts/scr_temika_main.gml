///scr_dialogue_main

// if "talk"
if play[frame,0] == "dialogue"
{
    obj_temika_textbox.text_name = play[frame,1]
    if obj_temika_textbox.bleep == true
    {
        obj_temika_textbox.bleep = false
        var ran = floor(random(5))
        if string_lower(play[frame,1]) == "temika"
        {
            audio_play_sound(snd_temika, 4, false);
            switch(ran)
            {
                case 0: audio_sound_pitch(snd_temika, 0.9) break;
                case 1: audio_sound_pitch(snd_temika, 0.95) break;
                case 2: audio_sound_pitch(snd_temika, 1) break;
                case 3: audio_sound_pitch(snd_temika, 1.05) break;
                case 4: audio_sound_pitch(snd_temika, 1.1) break;
            }
            audio_sound_gain(snd_temika,global.sound_vol*0.4, 0);
        }
        else if string_lower(play[frame,1]) == "temikato"
        {
            audio_play_sound(snd_temikato, 4, false);
            switch(ran)
            {
                case 0: audio_sound_pitch(snd_temikato, 0.9) break;
                case 1: audio_sound_pitch(snd_temikato, 0.95) break;
                case 2: audio_sound_pitch(snd_temikato, 1) break;
                case 3: audio_sound_pitch(snd_temikato, 1.05) break;
                case 4: audio_sound_pitch(snd_temikato, 1.1) break;
            }
            audio_sound_gain(snd_temikato,global.sound_vol*0.4, 0);
        }
        else if string_lower(play[frame,1]) == "temoko"
        {
            audio_play_sound(snd_temoko, 4, false);
            switch(ran)
            {
                case 0: audio_sound_pitch(snd_temoko, 0.9) break;
                case 1: audio_sound_pitch(snd_temoko, 0.95) break;
                case 2: audio_sound_pitch(snd_temoko, 1) break;
                case 3: audio_sound_pitch(snd_temoko, 1.05) break;
                case 4: audio_sound_pitch(snd_temoko, 1.1) break;
            }
            audio_sound_gain(snd_temoko,global.sound_vol*0.4, 0);
        }
        else if string_lower(play[frame,1]) == "temiru"
        {
            audio_play_sound(snd_temiru, 4, false);
            switch(ran)
            {
                case 0: audio_sound_pitch(snd_temiru, 0.8) break;
                case 1: audio_sound_pitch(snd_temiru, 0.9) break;
                case 2: audio_sound_pitch(snd_temiru, 1) break;
                case 3: audio_sound_pitch(snd_temiru, 1.1) break;
                case 4: audio_sound_pitch(snd_temiru, 1.2) break;
            }
            audio_sound_gain(snd_temiru,global.sound_vol*0.4, 0);
        }
        else if string_lower(play[frame,1]) == "temi"
        {
            audio_play_sound(snd_temi, 4, false);
            switch(ran)
            {
                case 0: audio_sound_pitch(snd_temi, 0.9) break;
                case 1: audio_sound_pitch(snd_temi, 0.95) break;
                case 2: audio_sound_pitch(snd_temi, 1) break;
                case 3: audio_sound_pitch(snd_temi, 1.05) break;
                case 4: audio_sound_pitch(snd_temi, 1.1) break;
            }
            audio_sound_gain(snd_temi,global.sound_vol*0.4, 0);
        }
        else if string_lower(play[frame,1]) == "everyone"
        {
            audio_play_sound(snd_temika, 4, false);
            audio_sound_gain(snd_temika,global.sound_vol*0.4, 0);
            audio_play_sound(snd_temiru, 4, false);
            audio_sound_gain(snd_temiru,global.sound_vol*0.4, 0);
            audio_play_sound(snd_temoko, 4, false);
            audio_sound_gain(snd_temoko,global.sound_vol*0.4, 0);
        }
        else
        {
            show_debug_message("something else")
        }
    }
    if string_pos("*name*", string(play[frame,2])) != 0
    {
        text = string_insert(string(global.name), string(play[frame,2]), string_pos("*name*", string(play[frame,2])));
        text = string_replace(text, "*name*", ""); 
    }
    else if obj_temika_textbox.update == false || text != play[frame,2]
    {
        obj_temika_textbox.update = true
        text = play[frame,2]
    }
    
    if mouse_check_button_pressed(mb_left)
    {
        if string_length(text) > obj_temika_textbox.charTotal
        {
            obj_temika_textbox.charTotal = string_length(text) + 1
        }
        else
        {
            scr_next_frame_temika()
        }
    }
    else if skipTimer < 1 && keyboard_check(vk_control)
    {
        skipTimer = skip;
        scr_next_frame_temika()
    }
}

//if reset position
if play[frame,0] == "reset position"
{
    play[frame,1].x = 0
    play[frame,1].y = 0 
    scr_next_frame_temika()
}

// if "blank"
else if play[frame,0] == "blank"
{
    text = ""
    obj_temika_textbox.text_name = ""
    scr_next_frame_temika()
}

else if play[frame,0] == "clouds"
{
    if instance_exists(obj_moving_clouds)
    {
        obj_moving_clouds.move = play[frame,1]
    }
    scr_next_frame_temika()
}

else if play[frame,0] == "bg char start"
{
    if play[frame,1] == true
    {
        for(pd = 0;pd < 6; pd++)
        {
            if (random(1.99) < 1)
            {
                with instance_create(random_range(-140,1420),random_range(520,560),obj_classtem)
                {
                    spd = random_range(0.5,3)
                    image_xscale = -1
                    image_alpha = 0 + (y-520)/240
                    if image_alpha < 0.05
                    {
                        image_alpha = 0.05
                    }
                    if image_alpha > 0.35
                    {
                        image_alpha = 0.35
                    }
                }
            }
            else
            {
                with instance_create(random_range(-140,1420),random_range(520,560),obj_classtem)
                {
                    spd = -random_range(0.5,3)
                    image_xscale = 1
                    image_alpha = 0 + (y-520)/240
                    if image_alpha < 0.05
                    {
                        image_alpha = 0.05
                    }
                    if image_alpha > 0.35
                    {
                        image_alpha = 0.35
                    }
                }
            }
        }
    }
    class_tems = play[frame,1];
    scr_next_frame_temika()
}

// if "choice2"
else if play[frame,0] == "choice2"
{
    obj_temika_textbox.text_name = ""
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
            text = obj_temika_main.play[obj_temika_main.frame,2]
            myLabel = obj_temika_main.play[obj_temika_main.frame,3]
        }
        with instance_create(640,325,obj_choice_button)
        {
            text = obj_temika_main.play[obj_temika_main.frame,4]
            myLabel = obj_temika_main.play[obj_temika_main.frame,5]
        }
    }
}

// if "choice3"
else if play[frame,0] == "choice3"
{
    obj_temika_textbox.text_name = ""
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
            text = obj_temika_main.play[obj_temika_main.frame,2]
            myLabel = obj_temika_main.play[obj_temika_main.frame,3]
        }
        with instance_create(640,250,obj_choice_button)
        {
            text = obj_temika_main.play[obj_temika_main.frame,4]
            myLabel = obj_temika_main.play[obj_temika_main.frame,5]
        }
        with instance_create(640,375,obj_choice_button)
        {
            text = obj_temika_main.play[obj_temika_main.frame,6]
            myLabel = obj_temika_main.play[obj_temika_main.frame,7]
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
    scr_next_frame_temika()
}

// if "sprite face"
else if play[frame,0] == "sprite face"
{
    if sprite_exists(play[frame,2]) && instance_exists(play[frame,1])
    {
        play[frame,1].face = play[frame,2]
    }
    scr_next_frame_temika()
}

// if "sprite effect"
else if play[frame,0] == "sprite effect"
{
    if sprite_exists(play[frame,2]) && instance_exists(play[frame,1])
    {
        play[frame,1].effect = play[frame,2]
    }
    scr_next_frame_temika()
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
        scr_next_frame_temika()
    }
    if mouse_check_button_pressed(mb_left) && getDistance == false && !keyboard_check(vk_control)
    {
        play[frame,1].x = play[frame,2]
        play[frame,1].y = play[frame,3]
        getDistance = true
        scr_next_frame_temika()
    }
    else if skipTimer < 1 && keyboard_check(vk_control) && !mouse_check_button(mb_left)
    {
        play[frame,1].x = play[frame,2]
        play[frame,1].y = play[frame,3]
        getDistance = true
        skipTimer = skip;
        scr_next_frame_temika()
    }
}

// if "label"
else if play[frame,0] == "label"
{
    scr_next_frame_temika()
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
    scr_next_frame_temika()
}

// if "background"
else if play[frame,0] == "background"
{
    if instance_exists(obj_bg_1)
    {
        obj_bg_1.background = play[frame,1]
        obj_bg_1.image_index = 0
    }
    if instance_exists(obj_bg_2)
    {
        obj_bg_2.background = play[frame,2]
    }
    if instance_exists(obj_bg_3)
    {
        obj_bg_3.background = play[frame,3]
    }
    
    if instance_exists(obj_bg_1) && instance_exists(obj_bg_2) && instance_exists(obj_bg_3)
    {
        scr_next_frame_temika()
    }
}

// if fade
else if play[frame,0] == "fade"
{
    if obj_temika_fade.fadein != play[frame,1]
    {
        obj_temika_fade.fadein = play[frame,1]
        obj_temika_fade.amount = play[frame,2]
        obj_temika_fade.color = play[frame,3]
    }
    if obj_temika_fade.fadein == true && obj_temika_fade.alpha <= 0
    {
        scr_next_frame_temika()
    }
    else if obj_temika_fade.fadein == false && obj_temika_fade.alpha >= 1
    {
        scr_next_frame_temika()
    }
    
    if skipTimer < 1 && keyboard_check(vk_control) && !mouse_check_button(mb_left)
    {
        if obj_temika_fade.fadein == true
        {
            obj_temika_fade.alpha = 0
        }
        else if obj_temika_fade.fadein == false
        {
            obj_temika_fade.alpha = 1
        }
        skipTimer = skip;
        scr_next_frame_temika()
    }
}

// if "dialogue name"
else if play[frame,0] == "name"
{
    if string(play[frame,1]) == "*name*"
    {
        obj_temika_textbox.text_name = string(global.name)
        scr_next_frame_temika()
    }
    else
    {
        obj_temika_textbox.text_name = play[frame,1]
        scr_next_frame_temika()
    }
}

// if "dialogue speed"
else if play[frame,0] == "spd"
{
    obj_temika_textbox.text_speed = play[frame,1]
    scr_next_frame_temika()
}

// if "create"
else if play[frame,0] == "create"
{
    if !instance_exists(play[frame,1])
    {
        instance_create(play[frame,2], play[frame,3], play[frame,1])
    }
    scr_next_frame_temika()
}

// if "animate"
else if play[frame,0] == "animation"
{
    play[frame,1].assign = 0;
    play[frame,1].frame = 0;
    with (play[frame,1])
    {
        script_execute(obj_temika_main.play[obj_temika_main.frame,2])
    }
    
    play[frame,1].startAnimation = true;
    
    
    scr_next_frame_temika()
}

// if "destroy"
else if play[frame,0] == "destroy"
{
    if instance_exists(play[frame,1])
    {
        with(play[frame,1])
        {
            instance_destroy()
        }
    }
    scr_next_frame_temika()
}

// if "wait"
else if play[frame,0] == "wait"
{
    if setTimer == true
    {
        obj_temika_textbox.update = false
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
        scr_next_frame_temika()
    }
    
    if mouse_check_button_pressed(mb_left)
    {
        setTimer = true
        scr_next_frame_temika()
    }
    else if skipTimer < 1 && keyboard_check(vk_control)
    {
        setTimer = true
        scr_next_frame_temika()
    }
}

// if "name input"
else if play[frame,0] == "name input"
{
    if obj_temika_textbox.nameInput == false
    {
        keyboard_string = ""
        text = "What's your name?"
        obj_temika_textbox.nameInput = true
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
    scr_next_frame_temika()
}

else if play[frame,0] == "draw"
{
    obj_temika_textbox.update = play[frame,1]
    scr_next_frame_temika() 
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
    scr_next_frame_temika() 
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
    scr_next_frame_temika() 
}
else if play[frame,0] == "music play"
{
    if audio_group_is_loaded(audiogroup_temika_music)
    {
        audio_group_stop_all(audiogroup_temika_music)
        audio_play_sound(play[frame,1], play[frame,2], play[frame,3]);
    }
    else
    {
        show_debug_message("Can't play sound, audiogroup is not loaded")
    }
    scr_next_frame_temika() 
}

else if play[frame,0] == "audio fade"
{
    audio_group_set_gain(audiogroup_temika_music, play[frame,1]*global.music_vol, play[frame,2]);
    scr_next_frame_temika()
}
else if play[frame,0] == "sprite speed"
{
    play[frame,1].image_speed = play[frame,2]
    scr_next_frame_temika()
}
else if play[frame,0] == "sprite state"
{
    play[frame,1].state = play[frame,2]
    scr_next_frame_temika()
}
else if play[frame,0] == "zero opacity"
{
    play[frame,1].image_alpha = 0
    scr_next_frame_temika()
}
else if play[frame,0] == "sprite size"
{
    play[frame,1].size = play[frame,2]
    scr_next_frame_temika()
}
else if play[frame,0] == "turn"
{
    play[frame,1].dir = play[frame,2]
    scr_next_frame_temika()
}
