///scr_addTriggerID(ID)
for (var i = 0; i < array_length_1d(global.cutsceneID); i++) 
{
    if (string(global.cutsceneID[i]) == argument0)
    {
        global.cutsceneID[i] = 0;
    }
}
