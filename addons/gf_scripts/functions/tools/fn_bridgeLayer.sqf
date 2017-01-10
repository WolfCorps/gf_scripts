/*


params
1: STRING classname of object to place
2: Vec3 StartPosition of first Object
3: Vec3 Offset of every next object
4: Scalar Angle of Objects
5: Scalar count of Objects
6: Bool createVehicleGlobal == true / createVehicle == false (Optional standart true)

Returns
Array of placed objects to be used with GF_fnc_bridgeRemover

Example
_mybridge = ["BlockConcrete_F",position player,[0,8.5,0],90,5] call GF_fnc_bridgeLayer;
_mybridge call GF_fnc_bridgeRemover;
*/

private ["_objectClassname","_position", "_offset", "_angle","_count","_global"];
_objectClassname = param [0,"",[""]];
_position = param [1, [0,0,0], [[]], 3];
_offset = param [2, [0,0,0], [[]], 3];
_angle = param [3,0,[1]];
_count = param [4,0,[1]];
_global = param [5,true,[false]];


if (_objectClassname == "") exitWith {"error"};
if (_count == 0) exitWith {"error"};
_arrayOfVecs = [];
_lastPos = _position;
for "_i" from 1 to _count do {
_p1 = (_lastPos select 0) + (_offset select 0);
_p2 = (_lastPos select 1) + (_offset select 1);
_p3 = (_lastPos select 2) + (_offset select 2);
_lastPos = [_p1,_p2,_p3];

	if (_global) then {
		_vehicle = _objectClassname createVehicle _lastPos;
	} else {
		_vehicle = _objectClassname createVehicleLocal _lastPos;
	};
	_vehicle enableSimulationGlobal false;
	_vehicle setPosWorld _lastPos;
	_y  = _angle;
	_p = 0;
	_r = 0;
	
	_vehicle setVectorDirAndUp [
	[ sin _y * cos _p,cos _y * cos _p,sin _p],
	[ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D
];
	
	//_vehicle setDir _angle;
	_arrayOfVecs = _arrayOfVecs + [_vehicle];
};