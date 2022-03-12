
class CfgPatches {
    class gf_scripts_largeScoreTable {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.0;
        author = "dedmen";
        requiredAddons[] = {"cba_main","A3_Modules_F_Curator","ace_medical_blood","ace_cargo", "A3_Functions_F"};
    };
};


class RscStandardDisplay;
class RscText;
class RscXListBox;
class RscPictureKeepAspect;
class RscControlsGroupNoScrollbars;
class RscControlsGroupNoHScrollbars;
class RscControlsGroup;
class RscButtonMenu;
class RscButtonMenuOK;
class RscDisplayDebriefing: RscStandardDisplay
{
	
	class controls
	{
		class MainTitle: RscText
		{
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="0";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class PlayerName: RscText
		{
			x="19 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="0";
			w="20 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Section: RscXListBox
		{
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="25.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx="1.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class MainBackground: RscText
		{
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="1.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="21.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class MissionPicture: RscPictureKeepAspect
		{
			x="1.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="2.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="37.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="19 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Summary: RscControlsGroupNoScrollbars
		{
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="3.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="12 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class DescriptionBackground: RscText
		{
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="16.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="4.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Description: RscControlsGroupNoHScrollbars
		{
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="16.4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ObjectivesBackground: RscText
		{
			x="1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="18 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="17.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Objectives: RscControlsGroupNoHScrollbars
		{
			x="1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="18 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="17.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class StatBackground: RscText
		{
			x="20 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="18.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="17.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[]={1,1,1,0.050000001};
		};
		class Stat: RscControlsGroupNoHScrollbars
		{
			x="20 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="18.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="17.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Custom: RscControlsGroup
		{
			x="1.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="0.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="37.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="21 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Data: RscControlsGroupNoScrollbars
		{ // Rating/Duration/Respawns
			x="1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="37.0001 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Sides: RscControlsGroupNoScrollbars
		{
			x="12.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="7.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="15 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonReady: RscButtonMenu
		{
			x="33 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="27 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonCancel: RscButtonMenuOK
		{
			x="33 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="27 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonDisconnect: RscButtonMenu
		{
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="27 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonOK: RscButtonMenu
		{
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="27 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
	
};



class RscTitle;
class RscDisplayMPScoreTable
{
	movingEnable=1;
	lineHeight="0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class controlsBackground
	{
		class PlayersListBackground: RscText
		{
			colorBackground[]={0,0,0,0.80000001};
			idc=1080;
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="20.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class HeadersBackground: RscText
		{
			idc=1081;
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[]={0,0,0,1};
		};
		class SidesListBackground: RscText
		{
			colorBackground[]={0,0,0,0.80000001};
			idc=1082;
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="21.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="3.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
	class controls
	{
		class Title: RscTitle
		{
			idc=101;
			style=2;
			shadow=0;
			sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			text="Host: My Splendid Server";
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="1.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[]={0,0,0,1};
		};
		class PictureKillsInfantry: RscPictureKeepAspect
		{
			idc=1200;
			text="\A3\ui_f\data\igui\cfg\mptable\infantry_ca.paa";
			x="17.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class PictureKillsSoft: RscPictureKeepAspect
		{
			idc=1201;
			text="\A3\ui_f\data\igui\cfg\mptable\soft_ca.paa";
			x="19.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class PictureKillsArmor: RscPictureKeepAspect
		{
			idc=1202;
			text="\A3\ui_f\data\igui\cfg\mptable\armored_ca.paa";
			x="23 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class PictureKillsAir: RscPictureKeepAspect
		{
			idc=1203;
			text="\A3\ui_f\data\igui\cfg\mptable\air_ca.paa";
			x="26.2 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class PictureKilled: RscPictureKeepAspect
		{
			idc=1204;
			text="\A3\ui_f\data\igui\cfg\mptable\killed_ca.paa";
			x="29.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class PictureKillsTotal: RscPictureKeepAspect
		{
			idc=1205;
			text="\A3\ui_f\data\igui\cfg\mptable\total_ca.paa";
			x="34.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class PlayersList: RscControlsGroup
		{
			idc=102;
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="20.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class SidesList: RscControlsGroup
		{
			idc=103;
			x="1 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y="21.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w="38 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h="3.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};