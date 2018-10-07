params ["_music", ["_offset",0,[0]], ["_volume",1,[0]]];
//systemChat str ["Playing",_this];
diag_log ["Playing",_this];
0 fademusic _volume;
playmusic [_music,_offset];