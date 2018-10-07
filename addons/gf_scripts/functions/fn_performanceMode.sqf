/*
    Name: gf_fnc_performanceMode
    Author(s):
        Dedmen
    Description:
        Enables/Disables performance (High FPS) mode.
    Parameters:
        BOOL: enabled
		BOOL: userCanDisable
    Returns:
        Nothing
    Example:
        [true,true] call gf_fnc_performanceMode;
*/


params ["_enabled","_userCanDisable"];


if (!_enabled || !hasInterface) exitWith {["GF_disablePerformanceMode", []] call CBA_fnc_localEvent;}; 

[true,_userCanDisable] call gf_fnc_screenShotMode;

["GF_disablePerformanceMode", {
	_thisArgs params ["_objectView","_viewDist"];
	setObjectViewDistance _objectView;
	setViewDistance _viewDist;
	[_thisType, _thisId] call CBA_fnc_removeEventHandler;
	[false,true] call gf_fnc_screenShotMode;
}, [getObjectViewDistance,viewDistance]] call CBA_fnc_addEventHandlerArgs;

["GF_screenShotMode", {
	_thisArgs params ["_objectView","_viewDist"];
	_this params ["_screenShotModeEnabled"];
	if (!_screenShotModeEnabled) then {
		[_thisType, _thisId] call CBA_fnc_removeEventHandler;
		["GF_disablePerformanceMode", [_this]] call CBA_fnc_localEvent;
	};
}, []] call CBA_fnc_addEventHandlerArgs;

setObjectViewDistance [1,1];
setViewDistance 1;