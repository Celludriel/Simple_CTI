if(!isDedicated) exitWith {};

params ["_spawnCenter", "_groupArray"];
private ["_unitContainer", "_taskSetup", "_options", "_spawnPosition"];

_spawnedUnits = [];
{
	_unitContainer = _x select 0;
	_taskSetup = _x select 1;
	_options = _x select 2;
	
	_pos = [_spawnCenter, SECTOR_RANGE, random 360] call ShkPos_fnc_executeFindPosition;
	_pos = [_pos, 1, 150, 3, 0, 20, 0] call BIS_fnc_findSafePos;
	
	_spawnContainer = [_pos];	
	{
		_spawnContainer pushBack _x;
	} forEach _unitContainer;
	
	_group = [_spawnContainer, _taskSetup, _options] call VCOMAIML_fnc_spawnGroup;
	
	{
		_spawnedUnits pushBack _x;
	} forEach units _group;
} forEach _groupArray;

_spawnedUnits