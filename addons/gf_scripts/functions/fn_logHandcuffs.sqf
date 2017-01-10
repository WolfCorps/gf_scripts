params ["_block","_player"];

if (isNil "GF_HandcuffFunctionReplaced") then {
	if (_block) then {
		ACE_captives_fnc_doApplyHandcuffs = {
			private ["_unit","_target"];     _unit =(_this) select 0; _target = (_this) select 1;
			playSound3D ["z\ace\addons\captives\sounds\cable_tie_zipping.ogg", objNull, false, (getPosASL _target), 1, 1, 10];
			[format ["Player %1 Handcuffed %2", name _unit,name _target],GF_HandcuffLogTargets] call GF_fnc_outputToSystemChat;
			// ["SetHandcuffed", [_target], [_target, true]] call ace_common_fnc_targetEvent;
			// _unit removeItem "ACE_CableTie";
		};
	} else {
		ACE_captives_fnc_doApplyHandcuffs = {
			private ["_unit","_target"];     _unit =(_this) select 0; _target = (_this) select 1;
			playSound3D ["z\ace\addons\captives\sounds\cable_tie_zipping.ogg", objNull, false, (getPosASL _target), 1, 1, 10];
			[format ["Player %1 Handcuffed %2", name _unit,name _target],GF_HandcuffLogTargets] call GF_fnc_outputToSystemChat;
			["SetHandcuffed", [_target], [_target, true]] call ace_common_fnc_targetEvent;
			_unit removeItem "ACE_CableTie";
		};
	};

	GF_HandcuffFunctionReplaced = true;
};

private _setPVEH = false;
if (_player isEqualType objNull) then {
	_setPVEH = !isNull _player && _player == player;
} else {
	if (_player isEqualType "string") then {
		_setPVEH = (_player == (getPlayerUID player));
	};
};

if (_setPVEH) then {
	if (player in GF_HandcuffLogTargets) exitWith {};
	GF_HandcuffLogTargets pushBackUnique player;
	publicVariable "GF_HandcuffLogTargets";
};
