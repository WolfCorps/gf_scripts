//diag_log [__FILE__, "CALLED"];

params ["_player"];

if (isDedicated) exitWith {};

if (isNil "GF_markerLog_Initiated") then {
    0 = 12 spawn GF_fnc_setMarkerEventHandlers;
    0 = 53 spawn GF_fnc_setMarkerEventHandlers;
    GF_markerLog_Initiated = true;
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
    if ((owner player) in GF_MarkerLogTargets) exitWith {};
    GF_MarkerLogTargets pushBackUnique player;
    publicVariable "GF_MarkerLogTargets";
};
