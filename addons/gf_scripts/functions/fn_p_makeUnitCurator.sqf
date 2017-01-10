//called via remoteExec
//_this == [target,executor,onlyDelete];
params ["_targetPlayer","_executor",["_onlyDelete",false]];

if (_targetPlayer getVariable ["dedmenfnc_HasCurator",false]) then {
    [format["Player %1 already has Curator deleting current Curator...",name _targetPlayer],_executor] call GF_fnc_outputToSystemChat;

    GF_Curators = GF_Curators - [(_targetPlayer getVariable ["dedmenfnc_Curator",objNull])];
    deleteVehicle _targetPlayer getVariable ["dedmenfnc_Curator",objNull];
    _targetPlayer setVariable ["dedmenfnc_Curator",nil];
    _targetPlayer setVariable ["dedmenfnc_HasCurator",false];
};

if (_onlyDelete) exitWith {};

if (!(_targetPlayer getVariable ["dedmenfnc_HasCurator",false])) then {
    [format["Creating Curator for Player %1",_targetPlayer],_executor] call GF_fnc_outputToSystemChat;

    if (isNil "GF_logicGroup") then {
    	GF_logicGroup = creategroup sideLogic;
    };
    _curator = GF_logicGroup createunit["ModuleCurator_F", [0, 90, 90], [], 0.5, "NONE"];	//Logic Server
    _curator setVariable ["showNotification",false];

    _curator addEventHandler ["CuratorObjectDoubleClicked", {_this spawn MCC_fnc_curatorInitLine}];
    _curator addEventHandler ["CuratorObjectPlaced", {if (local (_this select 1)) then {missionNamespace setVariable ["MCC_curatorMouseOver",curatorMouseOver]}}];

    unassignCurator _curator;
    _cfg = (configFile >> "CfgPatches");
    _newAddons = [];
    for "_i" from 0 to((count _cfg) - 1) do {
        _name = configName(_cfg select _i);
        _newAddons pushBack _name;
    };
    //diag_log(str _newAddons);
    if (count _newAddons > 0) then {_curator addCuratorAddons _newAddons};

    _curator setcuratorcoef["place", 0];
    _curator setcuratorcoef["delete", 0];

    GF_Curators pushBack _curator;

    if (!GF_CuratorSyncPFHRunning) then {
        [{
            {
                _x addCuratorEditableObjects[(allMissionObjects "All"), true];
            } forEach GF_Curators;
        },2 /*2 seconds*/] call CBA_fnc_addPerFrameHandler;
    };

    _targetPlayer setVariable ["dedmenfnc_Curator",_curator];
    _targetPlayer setVariable ["dedmenfnc_HasCurator",true];


};

unassignCurator _curator;
//sleep 0.4;
_targetPlayer assignCurator _curator;

[format["Assigned Curator to Player %1",_targetPlayer],_executor] call GF_fnc_outputToSystemChat;
