if(!isDedicated) exitWith {};

private ["_gearedUnits"];

_gearedUnits = [];

while { true } do {
	sleep 1;
	{
		[_x] call EM_fnc_gearUnit;
		_gearedUnits pushBack _x;
	} forEach allUnits - _gearedUnits;
};