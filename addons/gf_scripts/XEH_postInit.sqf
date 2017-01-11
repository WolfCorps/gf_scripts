
["GF_AddonCheck", {
    _configs = "true" configClasses (configFile >> "CfgPatches");

    ["GF_AddonCheckServer", [_configs, name player]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;






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



["GF_AddonCheckServer", {
    params ["_configs","_playername"];
    _trimmedConfigs = _configs - ("true" configClasses (configFile >> "CfgPatches"));
    [str _trimmedConfigs, str ["Loaded extra addons",_playername], [false, true, false]] call CBA_fnc_debug;
}] call CBA_fnc_addEventHandler;
