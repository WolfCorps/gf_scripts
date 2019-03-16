params ["_object", "_locationName"];


if (isNil "GF_Teleporters") then {
	GF_Teleporters = [];
};

GF_Teleporters pushBackUnique [_object, _locationName];