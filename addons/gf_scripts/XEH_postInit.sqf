



["GF_SystemChat", {
    params ["_message"];
    systemChat _message;
}] call CBA_fnc_addEventHandler;

["GF_MakeUnitMCC", {
    params ["_target","_causer"];

    mcc_missionmaker = (name _target);
    mcc_loginmissionmaker = true;
}] call CBA_fnc_addEventHandler;



//Serveronly
if (!isServer and !isDedicated) exitWith {};


["GF_MakeUnitCurator", {
    params ["_target","_causer"];
    [_target,_causer] call GF_fnc_p_makeUnitCurator;

}] call CBA_fnc_addEventHandler;
