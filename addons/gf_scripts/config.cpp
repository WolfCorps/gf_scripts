#include "script_component.hpp"

class CfgPatches {
    class gf_scripts {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.0;
        author = "dedmen";
        requiredAddons[] = {"cba_main","A3_Modules_F_Curator"};
    };
};
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
