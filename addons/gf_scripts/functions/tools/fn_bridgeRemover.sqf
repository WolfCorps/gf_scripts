/*


params
1: Array of Objects

Returns
Array of placed objects to be used with GF_fnc_bridgeRemover

Example
_mybridge = ["BlockConcrete_F",position player,[0,8.5,0],90,5] call GF_fnc_bridgeLayer;
_mybridge call GF_fnc_bridgeRemover;
*/

private ["_objectClassname","_position", "_offset", "_angle","_count","_global"];
{deletevehicle _x ;} forEach _this;