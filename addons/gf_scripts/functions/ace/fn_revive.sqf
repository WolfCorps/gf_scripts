/*
    Name: GF_fnc_revive

    Author(s):
        Dedmen

    Description:
        Fully Heal Player like ACE FirstAid Kit

    Parameters:
        1: OBJECT - The Player to Heal or nil to heal everyone

    Returns:
        Nothing

    Example:
        cursorTarget call GF_fnc_revive; //Heals cursorTarget
        call GF_fnc_revive; //Heals everyone
*/
params [["_unit",scriptNull,[objNull]]];


if (_unit isEqualTo scriptNull) exitWith {
    ["ace_medical_treatmentAdvanced_fullHeal", [player, player]] call CBA_fnc_globalEvent; //Heal everyone
};

if (!isNull _unit) then {
    [_unit,_unit] call ace_medical_fnc_treatmentAdvanced_fullHeal;
}
