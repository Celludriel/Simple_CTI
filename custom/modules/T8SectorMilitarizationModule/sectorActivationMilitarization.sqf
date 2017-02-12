if(!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount", "_sectorBLUFORcount"];

_markerName = _sector getVariable "markerName";
_pos = getMarkerPos _markerName;

_groupDefinitions = missionNamespace getVariable "T8_GROUP_DEFINITION";
_missionDifficulty = missionNamespace getVariable "MISSION_DIFFICULTY";

_spawnSelection = [];
{
	_bottomDifficultyCheck = _x select 0;
	_topDifficultyCheck = _x select 1;
	if(_missionDifficulty >= _bottomDifficultyCheck && _missionDifficulty <= _topDifficultyCheck) exitWith {
		_spawnSelection = _x;
	}

} forEach _groupDefinitions;

_outerPatrolGroups = _spawnSelection select 2;
_innerPatrolGroups = _spawnSelection select 3;
_sniperPatrolGroups = _spawnSelection select 4;
_armoredPatrolGroups = _spawnSelection select 5;
_airPatrolGroups = _spawnSelection select 6;

_spawnThisUnits = [];

if(count _outerPatrolGroups > 0) then {
	_amount = _outerPatrolGroups select 0;
	_patrolGroup = _outerPatrolGroups select 1;

	for "_i" from 1 to _amount do {
		_outerCircleRange = SECTOR_RANGE - T8U_var_PatAroundRange - 25;
		_formation = [ "WEDGE", "VEE" ] call BIS_fnc_selectRandom;
		_groupToSpawn = [ [_patrolGroup, _markerName], [ "PATROL_AROUND", _outerCircleRange, _formation, "AWARE" ] ];
		_spawnThisUnits pushBack _groupToSpawn;
	};
};

if(count _sniperPatrolGroups > 0) then {
	_amount = _sniperPatrolGroups select 0;
	_patrolGroup = _sniperPatrolGroups select 1;

	for "_i" from 1 to _amount do {
		_outerCircleRange = SECTOR_RANGE - T8U_var_PatAroundRange - 25;
		_formation = [ "WEDGE", "VEE" ] call BIS_fnc_selectRandom;
		_groupToSpawn = [ [_patrolGroup, _markerName], [ "PATROL_AROUND", _outerCircleRange, _formation, "AWARE" ] ];
		_spawnThisUnits pushBack _groupToSpawn;
	};
};

if(count _innerPatrolGroups > 0) then {
	_amount = _innerPatrolGroups select 0;
	_patrolGroup = _innerPatrolGroups select 1;

	for "_i" from 1 to _amount do {
		_innerCircleRange = (SECTOR_RANGE / 2) - T8U_var_PatAroundRange - 25;
		_formation = [ "WEDGE", "VEE" ] call BIS_fnc_selectRandom;
		_groupToSpawn = [ [ _patrolGroup, _markerName ], [ "PATROL", _formation, "AWARE" ] ];
		_spawnThisUnits pushBack _groupToSpawn;
	};
};

if(count _armoredPatrolGroups > 0) then {
	_amount = _armoredPatrolGroups select 0;
	_patrolGroup = _armoredPatrolGroups select 1;

	for "_i" from 1 to _amount do {
		_outerCircleRange = SECTOR_RANGE - T8U_var_PatAroundRange - 50;
		_groupToSpawn = [ [ _patrolGroup, _markerName, false], [ "PATROL_AROUND", _outerCircleRange ] ];
		_spawnThisUnits pushBack _groupToSpawn;
	};
};

if(count _airPatrolGroups > 0) then {
	_amount = _airPatrolGroups select 0;
	_patrolGroup = _airPatrolGroups select 1;

	for "_i" from 1 to _amount do {
		_outerCircleRange = SECTOR_RANGE - T8U_var_PatAroundRange - 50;
		_groupToSpawn = [ [ _patrolGroup, _markerName, false], [ "PATROL_AROUND", _outerCircleRange ] ];
		_spawnThisUnits pushBack _groupToSpawn;
	};
};

_retValue = [ _spawnThisUnits ] call T8U_fnc_Spawn;

_sector setVariable ["T8_units", _retValue];