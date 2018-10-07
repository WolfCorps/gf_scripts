params ["_logic","_units","_activated"];

diag_log ["GF","fn_moduleMusic",_this,_logic];

if (!_activated) exitWith {};

if (_logic call bis_fnc_isCuratorEditable) then {
    waituntil {!isnil {_logic getvariable "updated"} || isnull _logic};
};
if (isnull _logic) exitwith {};

//missionNamespace setVariable ["GF_musicModuleMusicUnit", _logic];

_side = (_logic getvariable ["Side",5]) call bis_fnc_sidetype;
_target = _logic getvariable ["RscAttributeOwners",[_side]];
_sound = _logic getvariable ["RscAttributeSound",""];
_music = _logic getvariable ["RscAttributeMusic",""];
_radio = _logic getvariable ["RscAttributeRadio",""];

switch true do {
    case (_sound != ""): {
        _sound remoteExec ["bis_fnc_playmusic", -2];
    };
    case (_music != ""): {
        _musicVolume = _logic getvariable ["RscAttributeMusicVolume",musicvolume];
        _musicStart = _logic getvariable ["RscAttributeMusicSkipper",0];

        diag_log ["GF","fn_moduleMusic start at",_music,_musicStart];
		[-1, {
			_this call GF_fnc_playMusic;
		},[_music, _musicStart, _volume]] call CBA_fnc_globalExecute;
		//[_music,_musicStart,_musicVolume] remoteExec ["bis_fnc_playmusic", -2];
    };
    case (_radio != ""): {
        [[sideunknown,_radio],"bis_fnc_sayMessage", allPlayers] call bis_fnc_mp;
    };
};
deletevehicle _logic;
