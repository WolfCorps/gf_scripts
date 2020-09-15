/*
	Author: 
		Killzone_Kid

	Description:
		Returns true if debug console is allowed in current context

	Parameter(s):
		NONE

	Returns:
		BOOLEAN
*/

// == 3DEN MODE ==

if (is3DEN || is3DENMultiplayer) exitWith {true}; // allowed in 3DEN or 3DEN test server (host only)

// == SP MODE ==

if (!isMultiplayer) exitWith
{ 
	allDisplays find findDisplay 313 in [0, 1] // 3DEN preview
	||
	{allDisplays find findDisplay 26 in [0, 1]} // 2DEN
	||
	{(configFile >> "enableDebugConsole") call {isArray _this || {isNumber _this && {getNumber _this >= 1}}}} // allowed by mod
};

// == MP MODE ==

// Get debug console permission from config: mission param > description.ext > Eden attribute > mod config
// 0 - not allowed
// 1 - allowed for server host and logged in admin
// 2 - allowed always
// [<uid1>, <uid2>, <uid3>...] - same as 1 + whitelist

private _fnc_getConfigValue =
{
	if (isArray _this) exitWith {getArray _this};
	if (isNumber _this) exitWith {getNumber _this};
	0
};

private _enableDebugConsole = [2, 1] select isMultiplayer; //always in singleplayer, admin only in MP

if (_enableDebugConsole isEqualTo 2) exitWith {true}; // always allowed

private _whitelist = ["76561198049878030", "76561198052867957", "76561198048773690"]; //Dedmen, Kirito, Maugrim

if !(_enableDebugConsole isEqualTo 1) exitWith {false}; // only admin or whitelist mode check from this point

// --- Client check
if (
	hasInterface 
	&& 
	isUIContext
	&&
	{
		isServer // server host
		||
		{
			call (missionNamespace getVariable "BIS_fnc_admin") isEqualTo 2 // logged in admin
		}
		||
		{
			!(_whitelist isEqualTo []) // non-empty whitelist check
			&&
			{
				getPlayerUID player in _whitelist // whitelisted caller
			}			
		}
	}
)
exitWith {true};

// --- Server check
if (
	isServer 
	&& 
	isRemoteExecuted
	&&
	{
		remoteExecutedOwner isEqualto 2 // server host
		||
		{
			admin remoteExecutedOwner isEqualTo 2 // logged in admin
		}
		||
		{ 
			!(_whitelist isEqualTo []) // non-empty whitelist check
			&&
			{
				getPlayerUID (allPlayers select {owner _x isEqualTo remoteExecutedOwner} param [0, objNull]) in _whitelist // whitelisted caller
			}
		} 
	}
)
exitWith {true};

false 