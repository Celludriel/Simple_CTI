if(!isDedicated) exitWith {};

params ["_sectorType"];
private ["_icon"];

_icon = "n_art";
{
	if(_x select 0 == _sectorType) then {
		_icon = _x select 1;
	};
} forEach SECTOR_TYPES;

_icon