///scr_checkForState()
for (var i = 0; i < array_height_2d(global.triggerState); i++) 
{
    if (string(global.triggerState[i,0]) == string(global.cutscene[global.cutsceneNumber,1]))
    {
        return true;
        break;
    }
}
