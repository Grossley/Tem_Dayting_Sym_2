//Save file
ini_open(global.saveName);

//Settings
ini_write_real("Settings","music",global.music_vol)
ini_write_real("Settings","sound",global.sound_vol)
ini_write_real("Settings","fov",global.fov)

//Room
ini_write_real("Game","true end",global.true_end)
ini_write_real("Game","room",global.currentRoom)
ini_write_real("Game","menu",global.currentMenu)

//Platform crash
ini_write_real("Platformer","crash",global.crash)
ini_write_real("Platformer","crashTimer",global.crashTimer)
ini_write_real("Platformer","music_load",global.music_load)
ini_write_real("Platformer","coins",global.coins)

//VN doctor
ini_write_string("Doctor","name",global.name)
ini_write_real("Doctor","alternative",global.alternative)
ini_write_real("Doctor","delay",global.delay)


//RPG variables
ini_write_real("RPG","flowerTime",global.flowerTime)
ini_write_real("RPG","gotFlower",global.gotFlower)
ini_write_real("RPG","block",global.block)

ini_write_real("RPG","tsun_sprite",global.tsun_sprite)
ini_write_real("RPG","teach_sprite",global.teach_sprite)
ini_write_real("RPG","rich_sprite",global.rich_sprite)
ini_write_real("RPG","shy_sprite",global.shy_sprite)
ini_write_real("RPG","ticket_booth",global.ticket_booth)

ini_write_real("RPG","tsun_got",global.tsun_got)
ini_write_real("RPG","teach_got",global.teach_got)
ini_write_real("RPG","rad_got",global.rad_got)

ini_write_real("RPG","rad_state",global.rad_state)
ini_write_real("RPG","teach_state",global.teach_state)
ini_write_real("RPG","temika_state",global.temika_state)

ini_write_real("RPG","tsuntime",global.tsuntime)

//RPG arrays
//ini_write_real("RPG","cutsceneID",global.cutsceneID)
//ini_write_real("RPG","triggerState",global.triggerState)

ini_close()
