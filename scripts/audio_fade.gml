///audio_fade(0to1volume,timeinseconds)

play[assign,0] = "audio fade";
play[assign,1] = argument0;
play[assign,2] = argument1 * 100;

assign ++
