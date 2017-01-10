#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"
//handles skipper

_mode = _this select 0;
_params = _this select 1;
_unit = _this select 2;

switch _mode do {
	case "onLoad": {
		_display = _params select 0;
		_ctrlSlider = _display displayctrl IDC_RSCATTRIBUTEMUSICVOLUME_VALUE;
		_ctrlSlider slidersetposition (musicvolume * 10);
		_ctrlSlider ctrladdeventhandler ["sliderposchanged","with uinamespace do {['sliderPosChanged',_this,objnull] call RscAttributeMusicSkipper;};"];
		RscAttributeMusicSkipper_volume = musicvolume;
        diag_log ["GF","MusicSkipper","onLoad"];
	};
	case "confirmed": {
		_display = _params select 0;
		_ctrlSlider = _display displayctrl IDC_RSCATTRIBUTEMUSICVOLUME_VALUE;
		_unit setvariable ["RscAttributeMusicSkipper",sliderposition _ctrlSlider * 0.1,true];
        diag_log ["GF","MusicSkipper","confirmed"];
		playMusic "";
	};
	case "sliderPosChanged": {
		_ctrlSlider = _params select 0;
		_ctrlSlider sliderSetRange [0,getNumber (configFile >> "CfgMusic" >> (_unit getvariable ["RscAttributeMusic",""]) >> "duration")];
        diag_log ["GF","MusicSkipper","sliderPosChanged",(_unit getvariable ["RscAttributeMusic",""],getNumber (configFile >> "CfgMusic" >> (_unit getvariable ["RscAttributeMusic",""]) >> "duration")];
		playMusic [_unit getvariable ["RscAttributeMusic",""], sliderposition _ctrlSlider];
	};
	case "onUnload": {
		playMusic "";
	};
};
