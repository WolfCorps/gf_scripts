["ace_cargoLoaded", {
params ["_item", "_vehicle"];

diag_log ["ace_cargoLoaded", _this];
if (_item isEqualType "") exitWith {};


if (_item isKindOf "Quadbike_01_base_F") exitWith {
	private _boxes = _item getVariable ["GF_cargoBoxesAttached",[]];

	{deleteVehicle (_x select 0);} forEach _boxes; //Remove attached simple objects
	_item setVariable ["GF_cargoBoxesAttached",[]];
};


if (_vehicle isKindOf "Quadbike_01_base_F" && _item isKindOf "NATO_Box_Base") exitWith {
	private _boxes = _vehicle getVariable ["GF_cargoBoxes",[]];

	if (count _boxes > 2) exitWith {}; //Can only show 2 boxes;

	private _offset = [[-0.45,-0.9,-0.2],[0.45,-0.9,-0.2]] select count _boxes;
	private _vecDir = [0,1,0];

	private _shapeName = typeOf _item;
	
	_boxes pushBack [_shapeName, _offset, _vecDir, _item];
	
	
	
	private _attachedBoxes = _vehicle getVariable ["GF_cargoBoxesAttached",[]];
	private _box = createSimpleObject [_shapeName, [0,0,-200]];
	_box attachTo [_vehicle, _offset];
	_box setVectorDir _vecDir;
	_attachedBoxes pushBack [_box, _item];
	_vehicle setVariable ["GF_cargoBoxesAttached", _attachedBoxes];
	_vehicle setVariable ["GF_cargoBoxes", _boxes];

};






}] call CBA_fnc_addEventHandler;


["ace_cargoUnloaded", {
params ["_item", "_vehicle"];

diag_log ["ace_cargoUnloaded", _this];
if (_item isEqualType "") exitWith {};

if (_item isKindOf "Quadbike_01_base_F") then {
	private _boxes = _item getVariable ["GF_cargoBoxes",[]];
	private _attachedBoxes = [];

	{
		_x params ["_shapename", "_offset", "_vecDir", "_itm"];
		private _box = createSimpleObject [_shapeName, [0,0,-200]];

		_box attachTo [_item, _offset];
		_box setVectorDir _vecDir;
		_attachedBoxes pushBack [_box, _itm];
	} forEach _boxes;

	_item setVariable ["GF_cargoBoxesAttached", _attachedBoxes];
};


if (_vehicle isKindOf "Quadbike_01_base_F") exitWith {
	private _boxes = _vehicle getVariable ["GF_cargoBoxes",[]];
	private _attachedBoxes = _vehicle getVariable ["GF_cargoBoxesAttached",[]];

	private _boxFound = _boxes findIf {(_x select 3) isEqualTo _item};
	private _attachedBoxFound = _attachedBoxes findIf {(_x select 1) isEqualTo _item};
	
	diag_log ["unload from quad", _boxes, _attachedBoxes, _boxFound, _attachedBoxFound];

	if (_boxFound != -1 && _attachedBoxFound != -1) then {
		_boxes deleteAt _boxFound;
		private _attachedBox = _attachedBoxes select _attachedBoxFound;
		_attachedBoxes deleteAt _boxFound;
		deleteVehicle (_attachedBox select 0);
	};
};




}] call CBA_fnc_addEventHandler;