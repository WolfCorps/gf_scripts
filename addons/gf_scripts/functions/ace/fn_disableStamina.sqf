/*
    Name: GF_fnc_disableStamina

    Author(s):
        Dedmen

    Description:
        Ends ACE unconciousness of Player

    Parameters:
        1: OBJECT - The player to disable Stamina on

    Returns:
        Nothing

    Example:
        cursorTarget call GF_fnc_disableStamina; // Disables Stamina of cursorTarget
        call GF_fnc_disableStamina; // Disables Stamina of everyone
*/
params [["_unit",scriptNull,[objNull]]];


if (_unit isEqualTo scriptNull) exitWith {
    missionNamespace setVariable ["ace_advanced_fatigue_recoveryFactor",5,true];
    missionNamespace setVariable ["ace_advanced_fatigue_loadFactor",0.1,true];
};

if (!isNull _unit) then {
    [missionNamespace,["ace_advanced_fatigue_recoveryFactor",5]] remoteExec ["setVariable", _unit, false];
}
