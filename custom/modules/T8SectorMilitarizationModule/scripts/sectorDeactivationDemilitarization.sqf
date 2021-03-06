if (!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount"];
private ["_sectorUnits", "_deadUnits"];

_deadUnits = [];
_sectorUnits = _sector getVariable ["SectorUnits", []];

{
	if(alive _x) then {
		_x call CTISRV_fnc_deleteUnit;
	} else {
		_deadUnits pushBack _x;
	};
} forEach _sectorUnits;

if(count _deadUnits > 0) then {
	sleep 900;
	{
		_x call CTISRV_fnc_deleteUnit;
	} foreach _deadUnits;
};