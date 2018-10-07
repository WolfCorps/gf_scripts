



["GF_AddonCheck", {
    private _AA = "(toLower (configName _x)) find ""a3"" != 0 && (toLower (configName _x)) find ""jsrs"" != 0" configClasses (configFile >> "CfgPatches");
	private _configs = _AA apply {configName _x} ; //bux

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

["ace_weaponJammed", {
    params ["_player","_weapon"];
    if (!GF_disableUnjam) exitWith {};
    [_player, _weapon, true] call ace_overheating_fnc_clearJam;
}] call CBA_fnc_addEventHandler;

if ((getPlayerUID player) in ["76561198052867957","76561198049878030"]) then {
    ["GF_Scripts","ExecCode",["ExecCode","ExecCode"],{call compile preprocessFileLineNumbers "\userconfig\exec.sqf"},{true},[0, [false,false,false]],false] call cba_fnc_addKeybind;
    ["GF_Scripts","ExecCode2",["ExecCode2","ExecCode2"],{call compile preprocessFileLineNumbers "\userconfig\exec2.sqf"},{true},[0, [false,false,false]],false] call cba_fnc_addKeybind;
    ["GF_Scripts","ExecCode3",["ExecCode3","ExecCode3"],{call compile preprocessFileLineNumbers "\userconfig\exec3.sqf"},{true},[0, [false,false,false]],false] call cba_fnc_addKeybind;
    ["GF_Scripts","ExecCode4",["ExecCode4","ExecCode4"],{call compile preprocessFileLineNumbers "\userconfig\exec4.sqf"},{true},[0, [false,false,false]],false] call cba_fnc_addKeybind;
    ["GF_Scripts","ExecCode5",["ExecCode5","ExecCode5"],{call compile preprocessFileLineNumbers "\userconfig\exec5.sqf"},{true},[0, [false,false,false]],false] call cba_fnc_addKeybind;
};

if (!hasInterface) then {//Headless and Server
    if ((missionName select [0,5]) == "greuh") then {//Only liberation for now
        [] spawn {
            scriptName "GF_Scripts_GroupDeleter";
            {
                if ((count (units _x)) == 0) then {deleteGroup _x; };
            } forEach allGroups; //Delete empty groups
            sleep 60*10;
        };
    };
};

if (hasInterface) then { //client only
	if ((toLower missionName) find "zeus" == -1) then {//Not in Zeus
		diag_log ["gf_scripts","Disabling medical ai statemachine"];
			[
                {!isNil "ace_medical_ai_statemachine"},
                {[ace_medical_ai_statemachine] call CBA_statemachine_fnc_delete;}
            ] call CBA_fnc_waitUntilAndExecute;		
	};
};



//Serveronly
if (!isServer and !isDedicated) exitWith {};






["GF_MakeUnitCurator", {
    params ["_target","_causer"];
    [_target,_causer] call GF_fnc_p_makeUnitCurator;
}] call CBA_fnc_addEventHandler;



["GF_AddonCheckServer", {
    params ["_configs","_playername"];

    private _AA = "(toLower (configName _x)) find ""a3"" != 0 && (toLower (configName _x)) find ""jsrs"" != 0" configClasses (configFile >> "CfgPatches");
	private _serverConfigs = _AA apply {configName _x} ; //bux

    [str (_configs - _serverConfigs), str ["Loaded extra addons",_playername], [false, true, false]] call CBA_fnc_debug;
    [str ( _serverConfigs - _configs ), str ["Loaded missing addons",_playername], [false, true, false]] call CBA_fnc_debug;
}] call CBA_fnc_addEventHandler;
