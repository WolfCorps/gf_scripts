#include "script_component.hpp"
#include "XEH_PREP.sqf"


if (isNil "GF_HandcuffLogTargets") then {GF_HandcuffLogTargets = [];};
if (isNil "GF_MarkerLogTargets") then {GF_MarkerLogTargets = [];};
GF_disableUnjam = false;
GF_isScreenShotMode = false;

//Serveronly
if (!isServer and !isDedicated) exitWith {
//client only



    [] spawn {

        while {true} do {
            {
            	if (
            		!(_x getVariable ["ACE_isUnconscious", false]) && 
            		{private _animation = animationState _x; _animation == "unconscious" || {_animation == "deadstate" || {_animation find "ace_medical_" != -1}}}
            	) then {
            		[_x, "AmovPpneMstpSnonWnonDnon", 2] call ace_common_fnc_doAnimation;
            	};
            } forEach allPlayers;
            sleep 5;
            
        };
    };

};

if (isNil "GF_Curators") then {GF_Curators = [];};

GF_CuratorSyncPFHRunning = false;