_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if (_activated) then {
	if (_logic call bis_fnc_isCuratorEditable) then {
		waituntil {!isnil {_logic getvariable "updated"} || isnull _logic};
	};
	if (isnull _logic) exitwith {};

	_side = (_logic getvariable ["Side",5]) call bis_fnc_sidetype;
	_target = _logic getvariable ["RscAttributeOwners",[_side]];
	_sound = _logic getvariable ["RscAttributeSound",""];
	_music = _logic getvariable ["RscAttributeMusic",""];
	_radio = _logic getvariable ["RscAttributeRadio",""];

	switch true do {
		case (_sound != ""): {
			[_sound,"bis_fnc_playsound",_target] call bis_fnc_mp;
		};
		case (_music != ""): {
			_musicVolume = _logic getvariable ["RscAttributeMusicVolume",musicvolume];
			_musicStart = _logic getvariable ["RscAttributeMusicSkipper",0];
			
			
			[[_music,_musicStart,_musicVolume],"bis_fnc_playmusic",_target + allcurators] call bis_fnc_mp;
		};
		case (_radio != ""): {
			[[sideunknown,_radio],"bis_fnc_sayMessage",_target] call bis_fnc_mp;
		};
	};
	if (count objectcurators _logic > 0) then {deletevehicle _logic};
};