//diag_log __FILE__;
//systemChat str (__FILE__);
//hint str (__FILE__);
[
"GF",  //_modName	Name of the registering mod [String]
"MusicSelectorKey", //_actionId	Id of the key action.  [String]
"Music Selector Menu", // _displayName	Pretty name, or an array of strings for the pretty name and a tool tip [String]
{""},//_downCode	Code for down event, empty string for no code.  [Code]
{[]call GF_fnc_createMusicDisplay},//_upCode	Code for up event, empty string for no code.  [Code]
[0x3C, [false, true, false]],//_defaultKeybind	The keybinding data in the format [DIK, [shift, ctrl, alt]] [Array]
 false//_holdKey	Will the key fire every frame while down [Bool]
 ] call cba_fnc_addKeybind; 