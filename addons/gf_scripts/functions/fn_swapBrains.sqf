/*
Arguments
0: The text thats disabled on-screen during blackout phase
1: A script that runs in the middle of the swap, parameters [_oldUnit, _newUnit]
2: Extra wait time in seconds, during the middle full blackscreen phase
*/
// Variablennamen der einheiten sind prefix_zahl 
// Hier stehen die möglichen prefixe, einfach austauschen gegen die in der mission verwendeten
params ["_text", "_midScript", "_extraWait"];


#define prefix1 "p"
#define prefix2 "sp"


// Hier drunter nix anpassen
if (!isServer) exitWith {};
private _prefixes = [prefix1, prefix2];

{

    private _oldUnit = _x;
    private _currentVariable = vehicleVarName _oldUnit;

    // filter out players that don't have a prefixed varname, units that are excluded from switch
    if ((_currentVariable select [0, count prefix1] != prefix1) && (_currentVariable select [0, count prefix2] != prefix2)) then { 
        continue;
    };


    (_currentVariable splitString "_") params ["_type", "_number"];

    private _isP1 = (_prefixes select 0) == _type;
    private _newVariable = format["%1_%2", _prefixes select _isP1, _number]; //swap to other variable name

    private _newUnit = missionNamespace getVariable _newVariable;

    [[_oldUnit,_newUnit, _text, _midScript, _extraWait], {
        params ["_oldUnit", "_newUnit", "_text", "_midScript", "_extraWait"];

        titleText [_text, "Black out", 2, true, "<img" in _text];
        2 fadeSound 0;
        sleep 2;


        // copy old units TFAR radio to the unit.
        if (_newUnit getVariable ["gf_swapBrain_firstSwitch", true]) then {

            // don't do it a second time lul
            _newUnit setVariable ["gf_swapBrain_firstSwitch", true];
            _oldUnit setVariable ["gf_swapBrain_firstSwitch", true];

            // Find old units handheld radio

            private _oldRadios = _oldUnit call TFAR_fnc_radiosList;
            if !(_oldRadios isEqualTo []) then {


                // remove all radios new unit has
                {
                    _newUnit removeItem _x; 
                } forEach (assignedItems _newUnit select {_x call TFAR_fnc_isPrototypeRadio || _x call TFAR_fnc_isRadio});

                // give it a copy of oldUnit handheld radioChannelAdd
                _newUnit linkItem (_oldRadios select 0);
            };
        };

        [_oldUnit, false] remoteExec ["enableSimulation", 0];
        _oldUnit allowDamage false;
        [_newUnit, true] remoteExec ["enableSimulation", 0];
        _newUnit allowDamage true;

        selectPlayer _newUnit;
        [_oldUnit,_newUnit] call _midScript;
        sleep _extraWait;

        titleFadeOut 2;
        2 fadeSound 0;
    }] remoteExec ["spawn", _x];
} forEach allPlayers;