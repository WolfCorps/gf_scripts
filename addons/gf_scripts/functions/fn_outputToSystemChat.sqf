// ["text",targetObject] call GF_fnc_outputToSystemChat;

params ["_message","_target"];

["GF_SystemChat", [_message, _target] call CBA_fnc_targetEvent;
