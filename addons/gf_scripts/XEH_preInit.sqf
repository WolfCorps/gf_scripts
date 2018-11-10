#include "script_component.hpp"
#include "XEH_PREP.sqf"


if (isNil "GF_HandcuffLogTargets") then {GF_HandcuffLogTargets = [];};
if (isNil "GF_MarkerLogTargets") then {GF_MarkerLogTargets = [];};
GF_disableUnjam = false;
GF_isScreenShotMode = false;
//Serveronly
if (!isServer and !isDedicated) exitWith {};

if (isNil "GF_Curators") then {GF_Curators = [];};

GF_CuratorSyncPFHRunning = false;