/*
params
1: OBJECT/STRING object that has "idPicture" set as variable OR Path to paa image
2: OBJECT targetPlayer
4: BOOL useHint true to use Hint OR false to use Rsc Display
5: OPTIONAL SCALAR size of picture. Default: 10
Returns
Nil

Example
[player,_target,true] call GF_fnc_displayImageOnPlayer;
["\ca\test.paa",_target,true] call GF_fnc_displayImageOnPlayer;
*/
private ["_image","_target","_useHint","_imagePath"];
_image = param [0,"",[objNull,""]];
_target = param [1,objNull,[objNull]];
_useHint = param [2,true,[false]];
_imgSize = param [3,10,[10]];

if (_image isEqualType objNull) then {
_imagePath = _image getVariable ["idPicture",""];
} else {
_imagePath = _image;
};

if (_useHint) then {
[_imagePath,_target,_imgSize] remoteExecCall ["GF_fnc_p_displayImageHint",_target];
} else {
[_imagePath,_target] remoteExecCall ["GF_fnc_p_displayImageRsc",_target];
};


