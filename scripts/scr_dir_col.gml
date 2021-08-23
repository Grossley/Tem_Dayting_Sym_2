///scr_dir_col(object)

objectCollide = argument0

if (facing == "up")
{
    if (collision_point( x, y-15, objectCollide, false, false))
    {
        return true;
    }
    else
    {
        return false;
    }
}
else if (facing == "down")
{
    if (collision_point( x, y+15, objectCollide, false, false))
    {
        return true;
    }
    else
    {
        return false;
    }
}
else if (facing == "left")
{
    if (collision_point( x-15, y-5, objectCollide, false, false))
    { 
        return true;
    }
    else
    {
        return false;
    }
}
else if (facing == "right")
{
    if (collision_point( x+15, y-5, objectCollide, false, false))
    {
        return true;
    }
    else
    {
        return false;
    }
}
else
{
    return false;
}
