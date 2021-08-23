///scr_checkTriggerID(ID)
for (var i = 0; i < array_length_1d(global.cutsceneID); i++) 
{
    if (string(global.cutsceneID[i]) == string(argument0))
    {
        instance_destroy()
    }
}
