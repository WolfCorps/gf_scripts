#include "script_component.hpp"

class CfgPatches {
    class gf_scripts {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.0;
        author = "dedmen";
        requiredAddons[] = {"cba_main","A3_Modules_F_Curator","ace_medical_blood","ace_cargo", "A3_Functions_F"};
    };
};
EnableTargetDebug = 1;


class Extended_PreInit_EventHandlers {
    class gf_scripts {
        init = "call compile preProcessFileLineNumbers '\z\gf_scripts\addons\gf_scripts\XEH_preInit.sqf'";
    };
};
class Extended_PostInit_EventHandlers {
    class gf_scripts {
        init = "call compile preProcessFileLineNumbers '\z\gf_scripts\addons\gf_scripts\XEH_postInit.sqf'";
    };
};


class Extended_Init_EventHandlers {
    class UGV_01_base_F {
        class gf_scripts_stomperSlingloadableMass {
            init = "(_this select 0) setMass 2900";
        };
    };
};



class cfgScriptPaths {
    GFovr = QPATHTOF(functions\hack\);
    GFovr2 = QPATHTOF(functions\hack\);
    CuratorGF = QPATHTOF(functions\music\);
};
class RscDisplayFunctionsViewer {
    onLoad = "[""onLoad"",_this,""RscDisplayFunctionsViewer"",'GFovr'] call  (uinamespace getvariable 'BIS_fnc_initDisplay')";
    onUnload = "[""onUnload"",_this,""RscDisplayFunctionsViewer"",'GFovr'] call  (uinamespace getvariable 'BIS_fnc_initDisplay')";
    scriptPath = "GFovr";
};


class ACE_Settings {
    class ace_medical_blood_enabledFor {
        value = 1;
    };
};


class CfgFunctions {
    class GF {
        tag = "GF";
        class Ace {
            file = QPATHTOF(functions\ace);
            class finishUncon;
            class revive;
            class disableStamina;
        };
        class Tools {
            file = QPATHTOF(functions\tools);
            class BridgeLayer;
            class BridgeRemover;
        };
        class MarkerLog {
            file = QPATHTOF(functions);
            class startMarkerLog;
            class getMarkerInfo;
            class setMarkerEventHandlers;
        };
        class stuff {
            file = QPATHTOF(functions);
            class logHandcuffs;
            class makeUnitMCC;
            class makeUnitCurator;
            class removeUnitCurator;
            class p_makeUnitCurator;
            class outputToSystemChat;
            class performanceMode;
            class screenShotMode;
            class initTeleporter;
            class swapBrains;
        };
        class showImage {
            file = QPATHTOF(functions\showImage);
            class displayImageOnPlayer;
            class p_displayImageHint;
            class p_displayImageRsc;
        };
        class musicSelector {
            file = QPATHTOF(musicSelector);
            class musicSelectorClientInit {
                postInit = 1;
            };
            class createMusicDisplay;
            class musicDisplayFuncs;
            class playMusic;
        };
        class musicModule {
            file = QPATHTOF(functions\music);
            class moduleMusic;
            class RscAttributeMusicVolume;
            class RscAttributeMusic;
			class playModuleMusic;
        };
        class Inits {
            file = QPATHTOF(functions);
            class preInit {
                preInit = 1;
            };
            class postInit {
                postInit = 1;
            };
            class preStart {
                preStart = 1;
            };
        };
    };



	class A3 {
		class Debug {
			file = "A3\functions_f\Debug";
			class isDebugConsoleAllowed{
				file = QPATHTOF(functions\fn_isDebugConsoleAllowed.sqf)	
			};
			class debugConsoleExec{};
		};
	};


};
/*
class CfgRemoteExec {
    class Functions {
        mode = 1;
        jip = 0;
        class GF_fnc_p_makeUnitMCC {
            allowedTargets = 1;
        };
        class GF_fnc_p_makeUnitCurator {
            allowedTargets = 2;
        };
        class GF_fnc_p_outputToSystemChat {
            allowedTargets = 0;
        };
        class GF_fnc_playMusic {
            allowedTargets = 0;
        };
        class GF_fnc_p_displayImageHint {
            allowedTargets = 0;
        };
        class GF_fnc_p_displayImageRsc {
            allowedTargets = 0;
        };
    };
};
*/
class CfgMods {
    class Mod_Base;
    class GF: Mod_Base {
        dir = "@gf_mods";
        author = "German Forces";
        name = "GF Mods";
        picture = QPATHTOF(logo.paa);
        hidePicture = 0;
        hideName = 0;
        actionName = "Website";
        action = "http://germanforces.ovh";
        logo = QPATHTOF(logo.paa);
        logoOver = QPATHTOF(logo.paa);
        logoSmall = QPATHTOF(logo.paa);
        dlcColor[] = {0.31,0.78,0.78,1};
    };
    class gf_scripts: Mod_Base {
        dir = "Kart";
        author = "German Forces";
        name = "GF Mods";
        picture = QPATHTOF(logo.paa);
        hidePicture = 0;
        hideName = 0;
        actionName = "Website";
        action = "http://germanforces.ovh";
        logo = QPATHTOF(logo.paa);
        logoOver = QPATHTOF(logo.paa);
        logoSmall = QPATHTOF(logo.paa);
        dlcColor[] = {0.31,0.78,0.78,1};
    };
};

#include "musicUIConfig.hpp"


class CfgVehicles {
	
	class ModuleSound_F;
	class ModuleMusic_F: ModuleSound_F {
		author = "Dedmen";
		_generalMacro = "ModuleMusic_F";
		displayName = "GF Musik";
		portrait = "\a3\Modules_F_Curator\Data\portraitMusic_ca.paa";
		curatorInfoType = "RscDisplayAttributesModuleMusic_GF";
		function = "GF_fnc_moduleMusic";
	};

	
	
	class Car_F;
	class Quadbike_01_base_F: Car_F {
		ace_cargo_size = 4;
		ace_cargo_space = 4;
		ace_cargo_hasCargo = 1;
		ace_cargo_canLoad = 1;
	};
};


class CfgDifficultyPresets {
        defaultPreset = "Custom";
		
		class Wolf {
			displayName = "Wolf Corps Difficulty";
			description = "Wolf Corps Difficulty";
			optionDescription = "So geht das!";
			optionPicture = "\A3\Ui_f\data\Logos\arma3_white_ca.paa";
			levelAI = "WolfAILevel";
			class Options {
					/* Simulation */

					reducedDamage = 0;              // Reduced damage

					/* Situational awareness */

					groupIndicators = 0;            // Group indicators (0 = never, 1 = limited distance, 2 = always)
					friendlyTags = 0;               // Friendly name tags (0 = never, 1 = limited distance, 2 = always)
					enemyTags = 0;                  // Enemy name tags (0 = never, 1 = limited distance, 2 = always)
					detectedMines = 0;              // Detected mines (0 = never, 1 = limited distance, 2 = always)
					commands = 0;                   // Commands (0 = never, 1 = fade out, 2 = always)
					waypoints = 0;                  // Waypoints (0 = never, 1 = fade out, 2 = always)
					tacticalPing = 0;               // Tactical ping (0 = disable, 1 = enable)

					/* Personal awareness */

					weaponInfo = 1;                 // Weapon info (0 = never, 1 = fade out, 2 = always)
					stanceIndicator = 0;            // Stance indicator (0 = never, 1 = fade out, 2 = always)
					staminaBar = 1;                 // Stamina bar
					weaponCrosshair = 0;            // Weapon crosshair
					visionAid = 0;                  // Vision aid

					/* View */

					thirdPersonView = 0;            // 3rd person view
					cameraShake = 1;                // Camera shake

					/* Multiplayer */

					scoreTable = 1;                 // Score table
					deathMessages = 0;              // Killed by
					vonID = 0;                      // VoN ID

					/* Misc */

					mapContent = 0;                 // Extended map content
					autoReport = 0;                 // (former autoSpot) Automatic reporting of spotted enemied by players only. This doesn't have any effect on AIs.
					multipleSaves = 0;              // Multiple saves
			};

			// aiLevelPreset defines AI skill level and is counted from 0 and can have following values: 0 (Low), 1 (Normal), 2 (High), 3 (Custom).
			// when 3 (Custom) is chosen, values of skill and precision are taken from the class CustomAILevel.
			aiLevelPreset = 3;
        };

		class WolfAILevel {
				skillAI = 0.5;
				precisionAI = 0.1;
		};
};

class CfgAILevelPresets
{
	class WolfAILevel {
		displayName="Wolf AI Level";
		skillAI = 0.5;
		precisionAI = 0.1;
	};
};