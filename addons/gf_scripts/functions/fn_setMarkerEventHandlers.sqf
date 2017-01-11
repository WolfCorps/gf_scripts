scopeName "func";
waitUntil {
    if (
        _this == 53 && getClientState == "BRIEFING READ"
    ) then {
        breakOut "func";
    };
    !isNull findDisplay _this
};

findDisplay _this displayAddEventHandler [
    "KeyDown", {
        params ["_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];


        if (_dikCode != 211) exitWith {false};

        _mrknames = allMapMarkers;
        _mrkdetails = [];
        {
            _mrkdetails pushBack (
                _x call GF_fnc_getMarkerInfo
            );
            true;
        } count _mrknames;

        [_mrknames,_mrkdetails] spawn {
            params ["_mrknames","_mrkdetails"];
            uisleep 0.2;

            GF_MarkerLog_PVEH = [
                "DELETED",
                name player,
                getplayerUID player
            ];

            {
                _i = _mrknames find _x;
                if (_i > -1) then {
                    GF_MarkerLog_PVEH pushBackUnique (_mrkdetails select _i);
                };
                true;
            } count (_mrknames - allMapMarkers);

            if (count GF_MarkerLog_PVEH > 3) then {
                [format ["Marker %1 by %2 - %3", GF_MarkerLog_PVEH select 0, GF_MarkerLog_PVEH select 1, (GF_MarkerLog_PVEH select 3) select 1]   ,GF_MarkerLogTargets] call GF_fnc_outputToSystemChat;
            };

        };

        false
    }
];

/*
findDisplay _this displayAddEventHandler [
    "ChildDestroyed", {
        params ["_display", "_childControl", "_exitCode"];
        diag_log ["ChildDestroyed",_this,(ctrlIdd _childControl),((ctrlIdd _childControl) != 54 || _exitCode != 1)];
        if ((ctrlIdd _childControl) != 54 || _exitCode != 1) exitWith {};

        [] spawn {

            uisleep 0.2;

            GF_MarkerLog_PVEH = [
                "PLACED",
                name player,
                getplayerUID player
            ];

            {
                GF_MarkerLog_PVEH pushBack (
                    _x call GF_fnc_getMarkerInfo
                );
            } count (allMapMarkers - GF_AllMarkers);
            diag_log [GF_MarkerLog_PVEH,(allMapMarkers - GF_AllMarkers)];
            if (count GF_MarkerLog_PVEH > 3) then {
                [format ["Marker %1 by %2 - %3", GF_MarkerLog_PVEH select 0, GF_MarkerLog_PVEH select 1, (GF_MarkerLog_PVEH select 3) select 1]   ,GF_MarkerLogTargets] call GF_fnc_outputToSystemChat;
            };

        };
    }
];

findDisplay _this displayCtrl 51 ctrlAddEventHandler [
    "MouseButtonDblClick", {

        0 spawn {
    		uiSleep 0.1;
            //diag_log "MouseButtonDblClick Added";
            if (isNull (findDisplay 54)) exitWith {};
            ((findDisplay 54) displayCtrl 1) buttonSetAction "GF_AllMarkers = allMapMarkers";
            //diag_log [(buttonAction ((findDisplay 54) displayCtrl 1)),((findDisplay 54) displayCtrl 1),(findDisplay 54)];
    	};



    }
];
*/
