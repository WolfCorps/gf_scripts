/*
    Name: gf_fnc_screenShotMode
    Author(s):
        Dedmen
    Description:
        Enables/Disables ScreenShot mode.
    Parameters:
        BOOL: enabled
		BOOL: userCanDisable
    Returns:
        Nothing
    Example:
        [true,true] call gf_fnc_screenShotMode;
*/


params ["_enabled","_userCanDisable"];

if (!hasInterface || (GF_isScreenShotMode && _enabled)) exitWith {};

GF_isScreenShotMode = _enabled;
["GF_screenShotMode", [GF_isScreenShotMode]] call CBA_fnc_localEvent;
if (!_enabled) exitWith {};



disableSerialization;


private _display = findDisplay 46 createDisplay "RscDisplayEmpty";
if (_userCanDisable) then {_display displayAddEventHandler ["KeyDown", {_this select 1 != 0x01}];};

[{
	(_this select 0) params ["_display", "_shownHUD"];

	if ({_x} count shownHUD > 0) then {
		(_this select 0) set [1, shownHUD];
		showHUD (shownHUD apply {false});
	}; 

	if (isNull _display || !GF_isScreenShotMode) then {
		showHUD _shownHUD;
		(_this select 1) call CBA_fnc_removePerFrameHandler;

		GF_isScreenShotMode = false;
		["GF_screenShotMode", [GF_isScreenShotMode]] call CBA_fnc_localEvent;
		if (!isNull _display) then {_display closeDisplay 1;};
	};
}, 0.2, [_display, shownHUD]] call CBA_fnc_addPerFrameHandler;