///scr_music_management()

//unload all
if audio_group_is_loaded(audiogroup_menu_music) && argument0 != audiogroup_menu_music
{
    audio_group_unload(audiogroup_menu_music);
    audio_group_unload(audiogroup_menu_sf);
}
if audio_group_is_loaded(audiogroup_vn_music) && argument0 != audiogroup_vn_music
{
    audio_group_unload(audiogroup_vn_music);
    audio_group_unload(audiogroup_vn_sf);
}
if audio_group_is_loaded(audiogroup_platformer_music) && argument0 != audiogroup_platformer_music
{
    audio_group_unload(audiogroup_platformer_music);
    audio_group_unload(audiogroup_platformer_sf);
}
if audio_group_is_loaded(audiogroup_rpg_music) && argument0 != audiogroup_rpg_music
{
    audio_group_unload(audiogroup_rpg_music);
    audio_group_unload(audiogroup_rpg_sf);
}
if audio_group_is_loaded(audiogroup_temika_music) && argument0 != audiogroup_temika_music
{
    audio_group_unload(audiogroup_temika_music);
    audio_group_unload(audiogroup_temika_sf);
}


//load this
if !audio_group_is_loaded(argument0)
{
    audio_group_set_gain(audiogroup_platformer_music, 0.4, 0);
    audio_group_load(argument0);
    audio_group_load(argument1);
}
