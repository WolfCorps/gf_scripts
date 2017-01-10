if (isNil "GF_HandcuffLogTargets") then {GF_HandcuffLogTargets = [];};
if (isNil "GF_MarkerLogTargets") then {GF_MarkerLogTargets = [];};

//Serveronly
if (!isServer and !isDedicated) exitWith {};

if (isNil "GF_Curators") then {GF_Curators = [];};

GF_CuratorSyncPFHRunning = false;
