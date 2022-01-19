//diag_log [__FILE__, "CALLED"];


["76561198049878030"] call GF_fnc_startMarkerLog; //dedmen
[false,"76561198049878030"] call GF_fnc_logHandcuffs;

["76561198052867957"] call GF_fnc_startMarkerLog; //kirito
[false,"76561198052867957"] call GF_fnc_logHandcuffs;


if (isNil "GF_Teleporters") then {
	GF_Teleporters = [];
};

{
	_x params ["_object", "_locationName"];

	{
		_x params ["_object2", "_locationName2"];
		if !(_object isEqualTo _object2) then {
			_object addAction ["Teleport to "+_locationName2, "player setPosASL getPosASL (_this select 3);", _object2];
		}
	} forEach GF_Teleporters;

	_action = ["teleport_"+_locationName,"Teleport to "+_locationName,"", {
			params ["_target", "_player", "_params"];
			_player setPosASL getPosASL (_params);
		},
		{ 
			params ["_target", "_player", "_params"];
			!(_target isEqualTo _params);
		}, {}, _object
	] call ace_interact_menu_fnc_createAction;

	[(typeOf _object), 1, ["ACE_Actions"], _action] call ace_interact_menu_fnc_addActionToClass;
} forEach GF_Teleporters;