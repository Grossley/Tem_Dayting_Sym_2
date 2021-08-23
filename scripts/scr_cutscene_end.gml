
//Next cutscene part
if (global.cutsceneLength > global.cutsceneNumber + 1)
{
    global.cutsceneNumber++;
    global.cutsceneWait = 0;
    global.textSkip = false
}

//End cutscene
else
{
    global.runCutscene = false;
    global.runDialogue = false;
    global.cDial = false;
    global.cutsceneWait = 0;
    global.cutsceneNumber = 0;
    obj_player.useObjectAsTarget = false;
    obj_player.dialogueDelay = 10;
    obj_player.player_x = obj_player.x;
    obj_player.player_y = obj_player.y;
    room_goto(room);
}
