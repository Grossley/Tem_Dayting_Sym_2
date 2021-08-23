///scr_cutscene_main(cutsceneAction, cutsceneLength, cutsceneNumber)

//Move the character
if (global.cutscene[global.cutsceneNumber,0]=="move")
{
    var dir = point_direction(global.cutscene[global.cutsceneNumber,1].x,global.cutscene[global.cutsceneNumber,1].y,global.cutscene[global.cutsceneNumber,2],global.cutscene[global.cutsceneNumber,3])
    var movespeed = global.cutscene[global.cutsceneNumber,4]
    
    if (point_distance(global.cutscene[global.cutsceneNumber,1].x,global.cutscene[global.cutsceneNumber,1].y,global.cutscene[global.cutsceneNumber,2],global.cutscene[global.cutsceneNumber,3]) > global.cutscene[global.cutsceneNumber,4]+1)
    {
        global.cutscene[global.cutsceneNumber,1].x += lengthdir_x(movespeed,dir); //inear movement
        global.cutscene[global.cutsceneNumber,1].y += lengthdir_y(movespeed,dir);
        global.cutscene[global.cutsceneNumber,1].image_speed = 0.2 * global.cutscene[global.cutsceneNumber,4];
    }
    else
    {
        global.cutscene[global.cutsceneNumber,1].image_speed = 0;
        scr_cutscene_end()
    }
}

//Move the physics object
else if (global.cutscene[global.cutsceneNumber,0]=="pmove")
{   
    var dir = point_direction(global.cutscene[global.cutsceneNumber,1].x,global.cutscene[global.cutsceneNumber,1].y,global.cutscene[global.cutsceneNumber,2],global.cutscene[global.cutsceneNumber,3])
    var movespeed = global.cutscene[global.cutsceneNumber,4]
    
    if (point_distance(global.cutscene[global.cutsceneNumber,1].x,global.cutscene[global.cutsceneNumber,1].y,global.cutscene[global.cutsceneNumber,2],global.cutscene[global.cutsceneNumber,3]) > global.cutscene[global.cutsceneNumber,4]+1)
    {
        global.cutscene[global.cutsceneNumber,1].phy_position_x += lengthdir_x(movespeed,dir); //inear movement
        global.cutscene[global.cutsceneNumber,1].phy_position_y += lengthdir_y(movespeed,dir);
        global.cutscene[global.cutsceneNumber,1].image_speed = 0.2 * global.cutscene[global.cutsceneNumber,4];
    }
    else
    {
        global.cutscene[global.cutsceneNumber,1].image_speed = 0;
        scr_cutscene_end()
    }
}

//Move physical self
else if (global.cutscene[global.cutsceneNumber,0]=="pmoveself")
{   
    var dir = point_direction(x,y,global.cutscene[global.cutsceneNumber,1],global.cutscene[global.cutsceneNumber,2])
    var movespeed = global.cutscene[global.cutsceneNumber,3]
    
    if (point_distance(x,y,global.cutscene[global.cutsceneNumber,1],global.cutscene[global.cutsceneNumber,2]) > global.cutscene[global.cutsceneNumber,3]+1)
    {
        phy_position_x += lengthdir_x(movespeed,dir); //inear movement
        phy_position_y += lengthdir_y(movespeed,dir);
        image_speed = 0.2 * global.cutscene[global.cutsceneNumber,3];
    }
    else
    {
        image_speed = 0;
        scr_cutscene_end()
    }
}

//Wait
else if (global.cutscene[global.cutsceneNumber,0]=="wait")
{
    if (global.cutsceneWait <= (global.cutscene[global.cutsceneNumber,1] * 60))
    {
        global.cutsceneWait++;
    }
    else
    {
        scr_cutscene_end()
    }
}

//Animation Switch
else if (global.cutscene[global.cutsceneNumber,0]=="sprite")
{
    global.cutscene[global.cutsceneNumber,1].sprite_index = global.cutscene[global.cutsceneNumber,2]
    scr_cutscene_end()
}

///Stop the animation
else if(global.cutscene[global.cutsceneNumber,0]=="stop")
{
    global.cutscene[global.cutsceneNumber,1].image_speed = 0;
    global.cutscene[global.cutsceneNumber,1].image_index = 0;
    scr_cutscene_end()
}

//Play sound effect
else if (global.cutscene[global.cutsceneNumber,0]=="sound")
{
    if audio_group_is_loaded(audiogroup_rpg_sf)
    {
        audio_play_sound(global.cutscene[global.cutsceneNumber,1], 2, false);
        audio_sound_gain(global.cutscene[global.cutsceneNumber,1],global.sound_vol*0.5, 0);
    }
    scr_cutscene_end()
}

//stop sound effect
else if (global.cutscene[global.cutsceneNumber,0]=="stop sound")
{
    if audio_group_is_loaded(audiogroup_rpg_sf)
    {
        audio_group_stop_all(audiogroup_rpg_sf);
    }
    scr_cutscene_end()
}

//Display dialogue between characters
else if (global.cutscene[global.cutsceneNumber,0]=="talk" && global.cDial == false)
{
    text2 =  global.cutscene[global.cutsceneNumber,1]
    if string_pos("*name*", string(global.cutscene[global.cutsceneNumber,1])) != 0
    {
        text = string_insert(string(global.name), string(global.cutscene[global.cutsceneNumber,1]), string_pos("*name*", string(global.cutscene[global.cutsceneNumber,1])))
        text2 = string_replace(text, "*name*", ""); 
    }
    if string_pos("*time*", string(global.cutscene[global.cutsceneNumber,1])) != 0
    {
        
        var minute = floor(global.tsuntime/60);
        var seconds = ((global.tsuntime/60) - minute) * 60;    
    
        if global.tsuntime <= 60
        {
            text = string_insert(string(floor(global.tsuntime)), string(global.cutscene[global.cutsceneNumber,1]), string_pos("*time*", string(global.cutscene[global.cutsceneNumber,1])))
            text2 = string_replace(text, "*time*", ""); 
        }
        else if global.tsuntime > 60 && global.tsuntime < 120
        {
            text = string_insert(string(floor(minute)) + " minute and " + string(floor(seconds)), string(global.cutscene[global.cutsceneNumber,1]), string_pos("*time*", string(global.cutscene[global.cutsceneNumber,1])))
            text2 = string_replace(text, "*time*", ""); 
        }
        else
        {
            text = string_insert(string(floor(minute)) + " minutes and " + string(floor(seconds)), string(global.cutscene[global.cutsceneNumber,1]), string_pos("*time*", string(global.cutscene[global.cutsceneNumber,1])))
            text2 = string_replace(text, "*time*", ""); 
        }
    }
    
    scr_cutscene_dialogue(text2,0,0,global.cutscene[global.cutsceneNumber,2],global.cutscene[global.cutsceneNumber,3])
    global.cDial = true;
}

//Create a character
else if (global.cutscene[global.cutsceneNumber,0]=="create")
{
    instance_create(global.cutscene[global.cutsceneNumber,2],global.cutscene[global.cutsceneNumber,3],global.cutscene[global.cutsceneNumber,1])

    scr_cutscene_end()
}
//Destroy a charcacter
else if (global.cutscene[global.cutsceneNumber,0]=="destroy")
{   
    with (global.cutscene[global.cutsceneNumber,1])
    {
        instance_destroy()
    }   
    scr_cutscene_end() 
}
//Destroy a charcacter w/fade
else if (global.cutscene[global.cutsceneNumber,0]=="fadeout")
{
    if (global.cutscene[global.cutsceneNumber,1].image_alpha > 0)
    {
        global.cutscene[global.cutsceneNumber,1].image_alpha-=0.03   
    }
    else
    {
        with (global.cutscene[global.cutsceneNumber,1])
        {
            instance_destroy()
        }
        scr_cutscene_end()
    }
}

//Jump to a specific number
else if (global.cutscene[global.cutsceneNumber,0]=="jump")
{
    for (var p = 0; p < array_height_2d(global.cutscene); p++) 
    {
        if (string(global.cutscene[p,0]) == "label" && string(global.cutscene[p,1]) == global.cutscene[global.cutsceneNumber,1])
        {
            global.cutsceneNumber = p;
            break;
        }
        if (array_height_2d(global.cutscene)-1== p)
        {
            show_debug_message("ERROR: Could not find a label '" +string(global.cutscene[global.cutsceneNumber,1]) +"'")
            global.cutsceneNumber = 9999;
            break;
        }
    }
    scr_cutscene_end()
}

//Display choice
else if (global.cutscene[global.cutsceneNumber,0]=="choice2")
{   
    if !instance_exists(obj_choice2)
    {
        instance_create(0,0,obj_choice2)
    }
}

//Assign variable
else if (global.cutscene[global.cutsceneNumber,0]=="variable")
{   
    global.cutscene[global.cutsceneNumber,1] = global.cutscene[global.cutsceneNumber,2]
    scr_cutscene_end()
}

///Compare state
else if(global.cutscene[global.cutsceneNumber,0]=="if")
{
    if (global.cutscene[global.cutsceneNumber,1] == global.cutscene[global.cutsceneNumber,2])
    {
        global.cutsceneNumber = scr_find_label(global.cutscene[global.cutsceneNumber,3])
    }
    else
    {
        scr_cutscene_end()
    }
}

///Add Trigger
else if(global.cutscene[global.cutsceneNumber,0]=="add trigger")
{
    scr_addTriggerID(global.cutscene[global.cutsceneNumber,1]);
    scr_cutscene_end()
}

///Remove Trigger
else if(global.cutscene[global.cutsceneNumber,0]=="remove trigger")
{
    scr_add_trigger_ID(global.cutscene[global.cutsceneNumber,1]);
    scr_cutscene_end()
}

//Change Trigger state
else if(global.cutscene[global.cutsceneNumber,0]=="state")
{
    if scr_checkForState()
    {
        for (var i = 0; i < array_height_2d(global.triggerState); i++) 
        {
            if (string(global.triggerState[i,0]) == string(global.cutscene[global.cutsceneNumber,1]))
            {
                global.triggerState[i,1] = global.cutscene[global.cutsceneNumber,2];
                break;
            }
        }
    }
    else
    {
        var height = array_height_2d(global.triggerState)
        global.triggerState[height,0] = global.cutscene[global.cutsceneNumber,1];
        global.triggerState[height,1] = global.cutscene[global.cutsceneNumber,2];
    }
    //show_debug_message("regular: " + string(global.cutscene[global.cutsceneNumber,1]))
    for (var arr = 0; arr < array_height_2d(global.triggerState);arr++)
    {
        show_debug_message("array " + string(arr) + "  id:"  + string(global.triggerState[arr,0]) + ", state: " + string(global.triggerState[arr,1]))
    }
    scr_cutscene_end()  
}

//Put a label in place
else if(global.cutscene[global.cutsceneNumber,0]=="label")
{
    scr_cutscene_end()  
}

//End the cutscene prematurely
else if(global.cutscene[global.cutsceneNumber,0]=="end")
{
    global.cutsceneNumber = 9999;
    scr_cutscene_end()
}

//start the timer
else if(global.cutscene[global.cutsceneNumber,0]=="flower timer")
{
    global.flowerTimer = true;
    global.flowerTime = global.cutscene[global.cutsceneNumber,1]
    global.gotFlower = false
    scr_cutscene_end()
}

//stop timer
else if(global.cutscene[global.cutsceneNumber,0]=="stop flower timer")
{
    global.flowerTimer = false;
    scr_cutscene_end()
}

//get flower
else if(global.cutscene[global.cutsceneNumber,0]=="get flower")
{
    global.gotFlower = true
    scr_cutscene_end()
}

//if flower
else if(global.cutscene[global.cutsceneNumber,0]=="if flower")
{
    if global.gotFlower == true
    {
        for (var t = 0; t < array_height_2d(global.cutscene); t++) 
        {
            if (string(global.cutscene[t,0]) == "label" && string(global.cutscene[t,1]) == global.cutscene[global.cutsceneNumber,1])
            {
                global.cutsceneNumber = t;
                break;
            }
        }
    }
    scr_cutscene_end()
}
//if flowertimer
else if(global.cutscene[global.cutsceneNumber,0]=="if flower timer")
{
    if global.flowerTimer == true
    {
        for (var d = 0; d < array_height_2d(global.cutscene); d++) 
        {
            if (string(global.cutscene[d,0]) == "label" && string(global.cutscene[d,1]) == global.cutscene[global.cutsceneNumber,1])
            {
                global.cutsceneNumber = d;
                break;
            }
        }
    }
    scr_cutscene_end()
}

//Add an item to the inventory
else if(global.cutscene[global.cutsceneNumber,0]=="item get")
{
    global.inventory[array_length_1d(global.inventory)] = global.cutscene[global.cutsceneNumber,1]
    scr_cutscene_end()
}

//unblock
else if(global.cutscene[global.cutsceneNumber,0]=="unblock")
{
    global.block = false
    scr_cutscene_end()
}

//if coin
else if(global.cutscene[global.cutsceneNumber,0]=="coins")
{
    if global.cutscene[global.cutsceneNumber,1] <= global.coins && global.cutscene[global.cutsceneNumber,2] >= global.coins
    {
        for (var j = 0; j < array_height_2d(global.cutscene); j++) 
        {
            if (string(global.cutscene[j,0]) == "label" && string(global.cutscene[j,1]) == global.cutscene[global.cutsceneNumber,3])
            {
                global.cutsceneNumber = j;
                break;
            }
        }
        //show_debug_message(string(global.coins))
    }
    else
    {
        show_debug_message("N/A")
    }
    
    scr_cutscene_end()
}

//Temika
else if(global.cutscene[global.cutsceneNumber,0]=="temika")
{
    with(obj_player)
    {
        instance_destroy()
    }
    with(obj_black_bars)
    {
        instance_destroy()
    }
    room_goto(rm_temika)
}

//Interview
else if(global.cutscene[global.cutsceneNumber,0]=="ending")
{
    if obj_player.targetRoom != rm_ending
    {
        obj_player.player_x = 365
        obj_player.player_y = 208
        obj_player.targetRoom = rm_ending
    }
}

else if(global.cutscene[global.cutsceneNumber,0]=="credits")
{
    room_goto(rm_credits)
}

else if(global.cutscene[global.cutsceneNumber,0]=="menu bg")
{
    global.true_end = true

    scr_cutscene_end()
}

else if(global.cutscene[global.cutsceneNumber,0]=="flip")
{
    if global.cutscene[global.cutsceneNumber,1].image_xscale == 1
    {
        global.cutscene[global.cutsceneNumber,1].image_xscale = -1
    }
    else if global.cutscene[global.cutsceneNumber,1].image_xscale == -1
    {
        global.cutscene[global.cutsceneNumber,1].image_xscale = 1
    }
    scr_cutscene_end()
}

else if(global.cutscene[global.cutsceneNumber,0]=="flip2")
{
    global.cutscene[global.cutsceneNumber,1].scal = global.cutscene[global.cutsceneNumber,2]
    scr_cutscene_end()
}

//Check if the item is in the inventory
else if(global.cutscene[global.cutsceneNumber,0]=="if item")
{
    for (var z = 0; z < array_length_1d(global.inventory); z++) 
    {
        if (global.inventory[z] == string(global.cutscene[global.cutsceneNumber,1]))
        {
            //Remove object from the inventory
            global.inventory[z] = 0;
            
            for (var p = 0; p < array_height_2d(global.cutscene); p++) 
            {
                if (string(global.cutscene[p,0]) == "label" && string(global.cutscene[p,1]) == global.cutscene[global.cutsceneNumber,2])
                {
                    global.cutsceneNumber = p;
                    break;
                }
                if (array_height_2d(global.cutscene)-1== p)
                {
                    show_debug_message("ERROR: Could not find a label '" +string(global.cutscene[global.cutsceneNumber,2]) +"'")
                    global.cutsceneNumber = 9999;
                    break;
                }
            }
            break;
        }
    }
    scr_cutscene_end()
}

//Change rad state
else if(global.cutscene[global.cutsceneNumber,0]=="rad state")
{
    global.rad_state = global.cutscene[global.cutsceneNumber,1]
    scr_cutscene_end()
}

//Change teach state
else if(global.cutscene[global.cutsceneNumber,0]=="teach state")
{
    global.teach_state = global.cutscene[global.cutsceneNumber,1]
    scr_cutscene_end()
}

//if rad state
else if(global.cutscene[global.cutsceneNumber,0]=="if rad state")
{
    if global.rad_state == global.cutscene[global.cutsceneNumber,1]
    {
        for (var j = 0; j < array_height_2d(global.cutscene); j++) 
        {
            if (string(global.cutscene[j,0]) == "label" && string(global.cutscene[j,1]) == global.cutscene[global.cutsceneNumber,2])
            {
                global.cutsceneNumber = j;
                break;
            }
        }   
    }
    scr_cutscene_end()
}

//if teach state
else if(global.cutscene[global.cutsceneNumber,0]=="if teach state")
{
    if global.teach_state == global.cutscene[global.cutsceneNumber,1]
    {
        for (var j = 0; j < array_height_2d(global.cutscene); j++) 
        {
            if (string(global.cutscene[j,0]) == "label" && string(global.cutscene[j,1]) == global.cutscene[global.cutsceneNumber,2])
            {
                global.cutsceneNumber = j;
                break;
            }
        }   
    }
    scr_cutscene_end()
}

//if night
else if(global.cutscene[global.cutsceneNumber,0]=="if night")
{
    var dat = (date_get_day_of_year(date_current_datetime()) - (date_get_hour_of_year(date_current_datetime()) /24 ))
    var cor = (1 - dat) * 24
    
    if !(cor >= 6 && cor <= 22) //night
    {
        for (var j = 0; j < array_height_2d(global.cutscene); j++) 
        {
            if (string(global.cutscene[j,0]) == "label" && string(global.cutscene[j,1]) == global.cutscene[global.cutsceneNumber,1])
            {
                global.cutsceneNumber = j;
                break;
            }
        }  
    }
    else //day
    {
        for (var j = 0; j < array_height_2d(global.cutscene); j++) 
        {
            if (string(global.cutscene[j,0]) == "label" && string(global.cutscene[j,1]) == global.cutscene[global.cutsceneNumber,2])
            {
                global.cutsceneNumber = j;
                break;
            }
        }  
    }
    scr_cutscene_end()
}

//get team member
else if(global.cutscene[global.cutsceneNumber,0]=="get")
{
    if global.cutscene[global.cutsceneNumber,1] == "rad"
    {
        global.rad_got = true
    }
    else if global.cutscene[global.cutsceneNumber,1] == "tsun" 
    {
        global.tsun_got = true
    }
    else if global.cutscene[global.cutsceneNumber,1] == "teach" 
    {
        global.teach_got = true
    }
    scr_cutscene_end()
}

else if(global.cutscene[global.cutsceneNumber,0]=="if got")
{
    if global.cutscene[global.cutsceneNumber,1] == "rad"
    {
        if global.rad_got == true
        {
            for (var j = 0; j < array_height_2d(global.cutscene); j++) 
            {
                if (string(global.cutscene[j,0]) == "label" && string(global.cutscene[j,1]) == global.cutscene[global.cutsceneNumber,2])
                {
                    global.cutsceneNumber = j;
                    break;
                }
            } 
        }
    }
    else if global.cutscene[global.cutsceneNumber,1] == "tsun" 
    {   
        if global.tsun_got == true
        {
            for (var j = 0; j < array_height_2d(global.cutscene); j++) 
            {
                if (string(global.cutscene[j,0]) == "label" && string(global.cutscene[j,1]) == global.cutscene[global.cutsceneNumber,2])
                {
                    global.cutsceneNumber = j;
                    break;
                }
            } 
        }
    }
    else if global.cutscene[global.cutsceneNumber,1] == "teach" 
    {
        if global.teach_got = true
        {
            for (var j = 0; j < array_height_2d(global.cutscene); j++) 
            {
                if (string(global.cutscene[j,0]) == "label" && string(global.cutscene[j,1]) == global.cutscene[global.cutsceneNumber,2])
                {
                    global.cutsceneNumber = j;
                    break;
                }
            } 
        }
    }
    scr_cutscene_end()
}

else if(global.cutscene[global.cutsceneNumber,0]=="if not")
{
    if global.cutscene[global.cutsceneNumber,1] == "rad"
    {
        if global.rad_got == false
        {
            for (var j = 0; j < array_height_2d(global.cutscene); j++) 
            {
                if (string(global.cutscene[j,0]) == "label" && string(global.cutscene[j,1]) == global.cutscene[global.cutsceneNumber,2])
                {
                    global.cutsceneNumber = j;
                    break;
                }
            } 
        }
    }
    else if global.cutscene[global.cutsceneNumber,1] == "tsun" 
    {   
        if global.tsun_got == false
        {
            for (var j = 0; j < array_height_2d(global.cutscene); j++) 
            {
                if (string(global.cutscene[j,0]) == "label" && string(global.cutscene[j,1]) == global.cutscene[global.cutsceneNumber,2])
                {
                    global.cutsceneNumber = j;
                    break;
                }
            } 
        }
    }
    else if global.cutscene[global.cutsceneNumber,1] == "teach" 
    {
        if global.teach_got = false
        {
            for (var j = 0; j < array_height_2d(global.cutscene); j++) 
            {
                if (string(global.cutscene[j,0]) == "label" && string(global.cutscene[j,1]) == global.cutscene[global.cutsceneNumber,2])
                {
                    global.cutsceneNumber = j;
                    break;
                }
            } 
        }
    }
    scr_cutscene_end()
}

else if (global.cutscene[global.cutsceneNumber,0]=="talk fade")
{
    obj_black_bars.transition = global.cutscene[global.cutsceneNumber,1]
    scr_cutscene_end()
}

else if (global.cutscene[global.cutsceneNumber,0]=="tsun start")
{
    global.tsuntime = 0
    scr_cutscene_end()
}

else if (global.cutscene[global.cutsceneNumber,0]=="tsun end")
{
    global.tsuntime = -1
    scr_cutscene_end()
}
