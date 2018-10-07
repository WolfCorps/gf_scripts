#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"
//handles skipper
params ["_mode","_params","_unit"];
diag_log ["GF","MusicSkipper","RscAttributeMusicVolume",_this];
switch _mode do {
    case "onLoad": {
        _display = _params select 0;
        _ctrlSlider = _display displayctrl 13375;
        _ctrlSlider slidersetposition 0;
        _ctrlSlider sliderSetRange [0,100];
        //diag_log ["GF","MusicSkipper","RscAttribute",_ctrlSlider,_display];
        _ctrlSlider ctrladdeventhandler ["sliderposchanged","['sliderPosChanged',_this,objnull] call GF_fnc_RscAttributeMusicVolume;"];
        //diag_log ["GF","MusicSkipper","onLoad"];

        ["GF_RscAttributeMusic", {
            //systemChat str _thisArgs;
            if (_this == "del") exitWith {
                //diag_log "deleteEH";
                [_thisType, _thisId] call CBA_fnc_removeEventHandler;
            };

            _thisArgs slidersetposition 0;
            _thisArgs sliderSetRange [0,getNumber (configFile >> "CfgMusic" >> _this >> "duration")];
        }, _ctrlSlider] call CBA_fnc_addEventHandlerArgs;
        GF_scripts_music_Unit = _unit;
    };
    case "confirmed": {
    	_display = _params select 0;
    	_ctrlSlider = _display displayctrl 13375;
    	GF_scripts_music_Unit setvariable ["RscAttributeMusicSkipper",sliderposition _ctrlSlider,true];
        //diag_log ["GF","MusicSkipper","confirmed"];
    	playMusic "";
        //missionNamespace setVariable ["BIS_fnc_initCuratorAttributes_target", nil];
        ["GF_RscAttributeMusic", "del"] call CBA_fnc_localEvent;
        private _music = missionNamespace getVariable ["GF_scripts_music_RscAttributeMusic",""];
        GF_scripts_music_Unit setVariable ["RscAttributeMusic",""]; // out fn_moduleMusic override doesn't work. So this keeps the BIS one from working
        private _volume = GF_scripts_music_Unit getVariable ["RscAttributeMusicVolume",musicvolume];
        diag_log ["PLAY",[_music, sliderposition _ctrlSlider, _volume]];
        //private _target = GF_scripts_music_Unit getvariable ["RscAttributeOwners",[_side]];
		[-1, {
			params ["_music", ["_offset",0,[0]], ["_volume",1,[0]]];
			//systemChat str ["Playing",_this];
			diag_log ["Playing",_this];
			0 fademusic _volume;
			playmusic [_music,_offset];
		},[_music, sliderposition _ctrlSlider, _volume]] call CBA_fnc_globalExecute;
		//[_music, sliderposition _ctrlSlider, _volume] remoteExec ["bis_fnc_playmusic",-2];

    };
    case "sliderPosChanged": {

        //diag_log ["GF","MusicSkipper",_unit,_unit getvariable ["RscAttributeMusic",""],configFile >> "CfgMusic" >> (_unit getvariable ["RscAttributeMusic",""]) >> "duration"];
        //diag_log ["GF","MusicSkipper","sliderPosChanged",_unit getvariable ["RscAttributeMusic",""],getNumber (configFile >> "CfgMusic" >> (_unit getvariable ["RscAttributeMusic",""]) >> "duration")];
    	_ctrlSlider = _params select 0;
    	//_ctrlSlider sliderSetRange [0,getNumber (configFile >> "CfgMusic" >> (GF_musicModuleMusicUnit getvariable ["RscAttributeMusic",""]) >> "duration")];
        GF_scripts_music_Unit setvariable ["RscAttributeMusicSkipper",sliderposition _ctrlSlider,true];
    	playMusic [missionNamespace getVariable ["GF_scripts_music_RscAttributeMusic",""], sliderposition _ctrlSlider];
    };
    case "onUnload": {
    	playMusic "";
    };
};
