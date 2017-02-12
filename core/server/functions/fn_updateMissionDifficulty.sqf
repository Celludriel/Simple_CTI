if(!isDedicated) exitWith {};

_difficulty = 0;
_totalSectors = count CTI_SECTOR_OBJECTS;
_sectorCountBlUFOR = 0;

{
	if(_x getVariable "side" == west) then {
		_sectorCountBlUFOR = _sectorCountBlUFOR + 1;
	};
} forEach CTI_SECTOR_OBJECTS;

if(_sectorCountBlUFOR != 0) then {
	_difficulty = (_sectorCountBlUFOR / _totalSectors) * 100;
};

missionNamespace setVariable ["MISSION_DIFFICULTY", _difficulty];