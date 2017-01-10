/*
params
1: STRING path to PAA
2: OBJECT targetPlayer //to make sure he is what he should be
3: OPTIONAL SCALAR size of picture. Default: 10

Returns
Nil

Example
["\ca\test.paa",_target] remoteExecCall ["GF_fnc_p_displayImageHint",_target];
*/
private ["_imagePath","_target","_image","_txt","_imgSize"];
_imagePath = param [0,"",[""]];
_target = param [1,objNull,[objNull]];
_imgSize = param [2,10,[10]];


//#TODO check if _target == player
_image = parseText format["<img size='%1' image='%2'/>",_imgSize,_imagePath];
_txt = composeText [_image,parseText "<br />  "];
hint  _txt;
