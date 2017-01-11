#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"
//handles skipper
params ["_mode","_params","_unit"];
//diag_log ["GF","MusicSkipper","RscAttribute",_unit];
switch _mode do {
    case "onLoad": {
        _display = _params select 0;
        _ctrlSlider = _display displayctrl 13375;
        _ctrlSlider slidersetposition 0;
        _ctrlSlider sliderSetRange [0,100];
        //diag_log ["GF","MusicSkipper","RscAttribute",_ctrlSlider,_display];
        _ctrlSlider ctrladdeventhandler ["sliderposchanged","['sliderPosChanged',_this,objnull] call GF_fnc_RscAttributeMusicVolume;"];
        //diag_log ["GF","MusicSkipper","onLoad"];
    };
    case "confirmed": {
    	_display = _params select 0;
    	_ctrlSlider = _display displayctrl 13375;
    	_unit setvariable ["RscAttributeMusicSkipper",sliderposition _ctrlSlider,true];
        //diag_log ["GF","MusicSkipper","confirmed"];
    	playMusic "";
        missionNamespace setVariable ["GF_musicModuleMusicUnit", nil];
    };
    case "sliderPosChanged": {

        //diag_log ["GF","MusicSkipper",_unit,_unit getvariable ["RscAttributeMusic",""],configFile >> "CfgMusic" >> (_unit getvariable ["RscAttributeMusic",""]) >> "duration"];
        //diag_log ["GF","MusicSkipper","sliderPosChanged",_unit getvariable ["RscAttributeMusic",""],getNumber (configFile >> "CfgMusic" >> (_unit getvariable ["RscAttributeMusic",""]) >> "duration")];
    	_ctrlSlider = _params select 0;
    	_ctrlSlider sliderSetRange [0,getNumber (configFile >> "CfgMusic" >> (GF_musicModuleMusicUnit getvariable ["RscAttributeMusic",""]) >> "duration")];
    	playMusic [GF_musicModuleMusicUnit getvariable ["RscAttributeMusic",""], sliderposition _ctrlSlider];
    };
    case "onUnload": {
    	playMusic "";
    };
};
