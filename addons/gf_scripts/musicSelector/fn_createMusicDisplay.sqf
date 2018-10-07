//_logic = _this select 0;
//RscDisplayAttributesModuleSound
//diag_log __FILE__;
//systemChat str (__FILE__);
//hint str (__FILE__);
_isSteamIdAllowed = ((getPlayerUID player) in ["76561198049878030","76561198052867957","76561198100544071","76561198042783650"]);
_isPlayerMCC = (mcc_missionmaker == (name player));
_isPlayerZeus = ((getAssignedCuratorLogic player) != objNull);
if (_isPlayerMCC || _isPlayerZeus || _isSteamIdAllowed) then {
(findDisplay 46) createDisplay "GF_RscDisplayAttributesModuleMusic";
};


//if (_activated) then {
//	if (_logic call bis_fnc_isCuratorEditable) then {
//		waituntil {!isnil {_logic getvariable "updated"} || isnull _logic};
//	};
//	if (isnull _logic) exitwith {};
//
//	_side = (_logic getvariable ["Side",5]) call bis_fnc_sidetype;
//	_target = _logic getvariable ["RscAttributeOwners",[_side]];
//	_sound = _logic getvariable ["RscAttributeSound",""];
//	_music = _logic getvariable ["RscAttributeMusic",""];
//	_radio = _logic getvariable ["RscAttributeRadio",""];
//
//	switch true do {
//		case (_sound != ""): {
//			[_sound,"bis_fnc_playsound",_target] call bis_fnc_mp;
//		};
//		case (_music != ""): {
//			_musicVolume = _logic getvariable ["RscAttributeMusicVolume",musicvolume];
//			[[_music,0,_musicVolume],"bis_fnc_playmusic",_target + allcurators] call bis_fnc_mp;
//		};
//		case (_radio != ""): {
//			[[sideunknown,_radio],"bis_fnc_sayMessage",_target] call bis_fnc_mp;
//		};
//	};
//	if (count objectcurators _logic > 0) then {deletevehicle _logic};
//};
