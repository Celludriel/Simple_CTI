if(!isDedicated) exitWith {};

params ["_sectorTags", "_newSide"];

{
	[_x, _newSide] call CTISRV_fnc_adminChangeSectorOwnership;
} forEach _sectorTags;