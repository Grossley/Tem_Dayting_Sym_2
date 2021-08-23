// if "sprite"
if play[frame,0] == "sprite"
{
    sprite_index = play[frame,1]
    frame ++;
}
else if play[frame,0] == "sprite face"
{
    if sprite_exists(play[frame,1])
    {
        face = play[frame,1]
    }
    frame++
}

// if "move linear"
else if play[frame,0] == "move linear"
{
    if getDistance2 == true
    {
        spd = (point_distance(x ,y ,play[frame,1] ,play[frame,2]) / play[frame,3]) / 60
        getDistance2 = false
    }
    var dir2 = point_direction(x, y, play[frame,1], play[frame,2])
    
    if point_distance(x, y , play[frame,1], play[frame,2]) > spd
    {
        x += lengthdir_x(spd, dir2)
        y += lengthdir_y(spd, dir2)
    }
    else
    {
        getDistance2 = true
        frame ++;
    }
}

// if "destroy"
else if play[frame,0] == "destroy"
{
    instance_destroy()
    frame ++;
}

//if "sound"
else if play[frame,0] == "sound"
{
    frame ++;
}

//if "pattern"
else if play[frame,0] == "pattern"
{
    frame ++;
}

//if "wait"
else if play[frame,0] == "wait"
{
    if setTimer == true
    {
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
        frame++
    }
}

//if "loop"
else if play[frame,0] == "loop"
{
    frame = 0;
}

//if "stop"
else if play[frame,0] == "stop"
{
    startAnimation = false;
    frame = 0;
}

//if "fadein"
else if play[frame,0] == "fadein"
{
    if image_alpha < 1
    {
        image_alpha += play[frame,1];
    }
    else
    {
        frame++
    }
}

//if "fadeout"
else if play[frame,0] == "fadeout"
{
    if image_alpha > 0
    {
        image_alpha -= play[frame,1];
    }
    else
    {
        frame++
    }
}

//turn
else if play[frame,0] == "turn"
{
    dir = play[frame,1]
    frame++
}
