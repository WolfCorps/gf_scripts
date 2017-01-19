/*
    Name: GF_fnc_finishUncon

    Author(s):
        Dedmen

    Description:
        Ends ACE unconciousness of Player

    Parameters:
        1: OBJECT - The Player to end unconciousness on or nil to end for everyone

    Returns:
        Nothing

    Example:
        cursorTarget call GF_fnc_finishUncon; // Finishes Unconciousness of cursorTarget
        call GF_fnc_finishUncon; // Finishes Unconciousness of everyone
*/
params [["_unit",scriptNull,[objNull]]];


if (_unit isEqualTo scriptNull) exitWith {
    [-1, {player setVariable ["ACE_isUnconscious", false, true]}] call CBA_fnc_globalExecute; // Wake up everyone
};

if (!isNull _unit) then {
    _unit setVariable ["ACE_isUnconscious", false, true];
}
