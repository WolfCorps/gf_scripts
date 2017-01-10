/*
params
1: STRING path to PAA
2: OBJECT targetPlayer //to make sure he is what he should be

Returns
Nil

Example
["\ca\test.paa",_target] remoteExecCall ["GF_fnc_p_displayImageRsc",_target];
*/
private ["_imagePath","_target","_image","_txt"];
_imagePath = param [0,"",[""]];
_target = param [1,objNull,[objNull]];
//_separator1 = parseText "<br />------------------------<br />";
//#TODO check if _target == player
_image = _imagePath;//"\ca\ui\textures\aus_flag.paa";

_txt = composeText [image _image];//,"Heading Text",_separator1,"Content"

hint  _txt;