//Delete Save file
ini_open(global.saveName);

ini_section_delete("Game");
ini_section_delete("Platformer");
ini_section_delete("Doctor");
ini_section_delete("RPG");

//Settings sliders
global.music_vol = ini_read_real("Settings","music",1)
global.sound_vol = ini_read_real("Settings","sound",1)
global.fov = ini_read_real("Settings","fov",230)

//Room
global.true_end = ini_read_real("Game","true end",false)
global.currentRoom = ini_read_real("Game","room",rm_menu0)
global.currentMenu = ini_read_real("Game","menu",rm_menu0)

//Platform crash
global.crash = ini_read_real("Platformer","crash",false)
global.crashTimer = ini_read_real("Platformer","crashTimer",120)
global.music_load = ini_read_real("Platformer","music_load",1)

//VN doctor
global.name = ini_read_string("Doctor","name","")
global.alternative = ini_read_real("Doctor","alternative",0)
global.delay = ini_read_real("Doctor","delay",0)

//Coins
global.coins = ini_read_real("Platformer","coins",0)

//Debug
global.debug_visibility = false;

//RPG variables
global.runDialogue = false;
global.cutsceneNumber = 0;
global.runCutscene = false;
global.textSkip = false
global.cDial = false;
global.ID = 0;
global.targetObject = 0;
global.flowerTimer = ini_read_real("RPG","flowerTimer",false)
global.flowerTime = ini_read_real("RPG","flowerTime",75)
global.gotFlower = ini_read_real("RPG","gotFlower",false)
global.block = ini_read_real("RPG","block",true)

global.tsun_sprite = ini_read_real("RPG","tsun_sprite",spr_tsun)
global.teach_sprite = ini_read_real("RPG","teach_sprite",spr_teach)
global.rich_sprite = ini_read_real("RPG","rich_sprite",spr_teach)
global.shy_sprite = ini_read_real("RPG","shy_sprite",spr_teach)
global.ticket_booth = ini_read_real("RPG","ticket_booth",spr_ticket_booth)

global.tsun_got = ini_read_real("RPG","tsun_got",false)
global.teach_got = ini_read_real("RPG","teach_got",false)
global.rad_got = ini_read_real("RPG","rad_got",false)

global.rad_state = ini_read_real("RPG","rad_state",0)
global.teach_state = ini_read_real("RPG","teach_state",0)
global.temika_state = ini_read_real("RPG","temika_state",0)

global.tsuntime = ini_read_real("RPG","tsuntime",-1)

ini_close()
