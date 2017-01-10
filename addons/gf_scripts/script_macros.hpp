#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

#ifdef DFUNC
    #undef DFUNC
#endif
#define DFUNC(var1) TRIPLES(PREFIX,fnc,var1)

#define DISABLE_COMPILE_CACHE 1

#ifdef PREP
    #undef PREP
#endif

#define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QUOTE(DFUNC(fncName))] call CBA_fnc_compileFunction
#define PREP_SUB(subfolder,fncName) [QPATHTOF(functions\subfolder\DOUBLES(fnc,fncName).sqf), QUOTE(DFUNC(fncName))] call CBA_fnc_compileFunction

#define VARIABLE_DEFAULT(varName,defaultValue) if (isNil QUOTE(varName)) then {varName = defaultValue;}


#define RemoveAllItemsLoadout(UNIT) removeAllWeapons UNIT;removeAllItems UNIT;removeAllAssignedItems UNIT; \
removeUniform UNIT;removeVest UNIT;removeBackpack UNIT;removeHeadgear UNIT;removeGoggles UNIT;

#define RemoveAllItemsLoadoutThis removeAllWeapons _this;removeAllItems _this;removeAllAssignedItems _this; \
removeUniform _this;removeVest _this;removeBackpack _this;removeHeadgear _this;removeGoggles _this;

#define SetUnitInsignia(UNIT,INSIGNIA) [UNIT,INSIGNIA] call bis_fnc_setUnitInsignia;
#define SetThisUnitInsignia(INSIGNIA) [_this,INSIGNIA] call bis_fnc_setUnitInsignia;
#define LoadoutNilCheck(UNIT,LoadoutWPlayerCheck) If (!isNil #UNIT)then {LoadoutWPlayerCheck};
#define LoadoutPlayerCheck(UNIT,LOADOUT) if(UNIT==player && !(player getVariable ["loadoutDone",false])) then {LOADOUT player setVariable ["loadoutDone",true,true];}

#define CheckUnitLoadout(UNIT,LOADOUT) LoadoutNilCheck(UNIT,LoadoutPlayerCheck(UNIT,LOADOUT))

#define CheckUnitLoadoutSetThis(UNIT,LOADOUT) LoadoutNilCheck(UNIT,LoadoutPlayerCheck(UNIT,_this = UNIT;this=UNIT; LOADOUT))

#define CheckUnitLoadoutSetThisClear(UNIT,LOADOUT)LoadoutNilCheck(UNIT,LoadoutPlayerCheck(UNIT,_this = UNIT;this=UNIT; RemoveAllItemsLoadoutThis; LOADOUT))


#define CheckUnitLoadoutSetThisClear7(UNIT1,UNIT2,UNIT3,UNIT4,UNIT5,UNIT6,UNIT7,LOADOUT) \
CheckUnitLoadoutSetThisClear(UNIT1,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT2,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT3,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT4,LOADOUT) \
CheckUnitLoadoutSetThisClear(UNIT5,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT6,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT7,LOADOUT)

#define CheckUnitLoadoutSetThisClear6(UNIT1,UNIT2,UNIT3,UNIT4,UNIT5,UNIT6,LOADOUT) \
CheckUnitLoadoutSetThisClear(UNIT1,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT2,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT3,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT4,LOADOUT) \
CheckUnitLoadoutSetThisClear(UNIT5,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT6,LOADOUT)


#define CheckUnitLoadoutSetThisClear5(UNIT1,UNIT2,UNIT3,UNIT4,UNIT5,LOADOUT) \
CheckUnitLoadoutSetThisClear(UNIT1,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT2,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT3,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT4,LOADOUT) \
CheckUnitLoadoutSetThisClear(UNIT5,LOADOUT)

#define CheckUnitLoadoutSetThisClear4(UNIT1,UNIT2,UNIT3,UNIT4,LOADOUT) \
CheckUnitLoadoutSetThisClear(UNIT1,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT2,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT3,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT4,LOADOUT) \

#define CheckUnitLoadoutSetThisClear3(UNIT1,UNIT2,UNIT3,LOADOUT) \
CheckUnitLoadoutSetThisClear(UNIT1,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT2,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT3,LOADOUT)

#define CheckUnitLoadoutSetThisClear2(UNIT1,UNIT2,LOADOUT) \
CheckUnitLoadoutSetThisClear(UNIT1,LOADOUT) CheckUnitLoadoutSetThisClear(UNIT2,LOADOUT)
// || !isPlayer player
#define CheckIsLoadoutScope \
if (isDedicated) exitWith {false;};waitUntil {!isNull player};
#define CuratorGodMode {_x setcuratorcoef ["place",0];_x setcuratorcoef ["delete",0];} foreach allCurators;
#define addAllCuratorObjects {_x addCuratorEditableObjects [(allMissionObjects "All"), true];} foreach allCurators;
#define ExecSQF(FILE) [] execVM #FILE;

//#define GF_LogMarkers call GF_fnc_startMarkerLog;
#define GF_LogMarkers(USER) USER call GF_fnc_startMarkerLog;
