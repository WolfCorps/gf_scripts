
class RscDisplayAttributes {
	class ControlsBackground;
	class Controls {
		class Background;
		class Title;
		class ButtonOK;
		class ButtonCancel;
		class Content;
	};
};
class Controls;
class Background;
class Title;
class Content;
class RscAttributeOwners;
class RscAttributeMusic;
class RscXSliderH;
class RscText;
class RscAttributeMusicVolume;
class ButtonOK;
class ButtonCancel;
class GF_RscDisplayAttributesModuleMusic: RscDisplayAttributes {
	onLoad = "[""onLoad"",_this] call GF_fnc_musicDisplayFuncs;";
	onUnload = "[""onUnload"",_this] call GF_fnc_musicDisplayFuncs;";
	class Controls {
		//class Background: Background{};
		//class Title: Title{};
		class Content: Content {
			x = 0;
			y = 0;
			class controls {
				x = 0;
				y = 0;
				class Music: RscAttributeMusic {
					x = 0;
					y = 0;
				};
				class MusicVolume: RscAttributeMusicVolume{};
			};
		};
		class ButtonOK: ButtonOK {
			onbuttonclick = "[""confirmed"",ctrlparent (_this select 0)] call GF_fnc_musicDisplayFuncs;";
		};
		class ButtonCancel: ButtonCancel {
			onbuttonclick = "[""canceled"",ctrlparent (_this select 0)] call GF_fnc_musicDisplayFuncs;";
		};
	};
};

class RscControlsGroupNoScrollbars;
class RscAttributeMusicSkipper: RscControlsGroupNoScrollbars {
	onSetFocus = "[_this,""fn_RscAttributeMusicVolume"",'CuratorGF'] call (uinamespace getvariable ""BIS_fnc_initCuratorAttribute"")";
	idc = 23956;
	x = "7 * 			(			((safezoneW / safezoneH) min 1.2) / 40) + 			(safezoneX)";
	y = "10 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 			(safezoneY + safezoneH - 			(			((safezoneW / safezoneH) min 1.2) / 1.2))";
	w = "26 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controls {
		class Title: RscText {
			idc = 23656;
			text = "$STR_A3_RscAttributeMusicVolume_Title";
			x = "0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "10 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
		};
		class Value: RscXSliderH {
            onSliderPosChanged = "['sliderPosChanged',_this,objnull] call GF_fnc_RscAttributeMusicVolume;";
			idc = 13375;
			x = "10.1 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "15.9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};



class RscDisplayAttributesModuleMusic_GF: RscDisplayAttributes
{
	scriptName = "RscDisplayAttributesModuleMusic";
	scriptPath = "CuratorDisplays";
	onLoad = "[""onLoad"",_this,""RscDisplayAttributesModuleMusic"",'CuratorDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload = "[""onUnload"",_this,""RscDisplayAttributesModuleMusic"",'CuratorDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	class Controls: Controls
	{
		class Background: Background{};
		class Title: Title{};
		class Content: Content
		{
			class Controls: controls {
				//class Owners: RscAttributeOwners{};
				class Music: RscAttributeMusic  {
                	onSetFocus = "[_this,""fn_RscAttributeMusic"",'CuratorGF'] call (uinamespace getvariable ""BIS_fnc_initCuratorAttribute"")";
                };
				class MusicVolume: RscAttributeMusicVolume {};
				class MusicSkipper: RscAttributeMusicSkipper {};
			};
		};
		class ButtonOK: ButtonOK{};
		class ButtonCancel: ButtonCancel{};
	};
};
