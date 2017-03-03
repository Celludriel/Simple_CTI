if(!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount", "_sectorBLUFORcount"];
private [
	"_markerName", "_pos", "_groupDefinitions", "_missionDifficulty", "_playersOnServer", "_spawnSelection",
	"_outerPatrolGroups", "_innerPatrolGroups", "_sniperPatrolGroups", "_armoredPatrolGroups", "_airPatrolGroups",
	"_spawnThisUnits", "_retValue", "_normalGroupOffset", "_specialGroupOffset"
];

// spawn setup
_markerName = _sector getVariable "markerName";
_pos = getMarkerPos _markerName;
_groupDefinitions = missionNamespace getVariable "T8_GROUP_DEFINITION";
_missionDifficulty = missionNamespace getVariable "MISSION_DIFFICULTY";

// amount of groups dependant on the amount of players on the server
_playersOnServer = count allPlayers;
_normalGroupOffset = 0;
switch(_playersOnServer) do {
	case 2 : {_normalGroupOffset = 1;};
	case 4 : {_normalGroupOffset = 2;};
	case 6 : {_normalGroupOffset = 4;};
	case 8 : {_normalGroupOffset = 5;};
	case 10 : {_normalGroupOffset = 6;};
};

_specialGroupOffset = 0;
switch(_playersOnServer) do {
	case 4 : {_specialGroupOffset = 1;};
	case 8 : {_specialGroupOffset = 3;};
	case 10 : {_specialGroupOffset = 5;};
};


// choose spawn selection
[["Current mission difficulty %1", _missionDifficulty]] call CTISHR_fnc_ctiLog;

_spawnSelection = [];
{
	_bottomDifficultyCheck = _x select 0;
	_topDifficultyCheck = _x select 1;
	if(_missionDifficulty >= _bottomDifficultyCheck && _missionDifficulty <= _topDifficultyCheck) exitWith {
		_spawnSelection = _x;
	}

} forEach _groupDefinitions;

[["Chosen spawn selection %1", _spawnSelection]] call CTISHR_fnc_ctiLog;

_outerPatrolGroups = _spawnSelection select 2;
_innerPatrolGroups = _spawnSelection select 3;
_sniperPatrolGroups = _spawnSelection select 4;
_armoredPatrolGroups = _spawnSelection select 5;
_airPatrolGroups = _spawnSelection select 6;

// spawn all the units
_spawnThisUnits = [];

if(count _outerPatrolGroups > 0) then {
	_amount = (_outerPatrolGroups select 0) + _normalGroupOffset;
	_patrolGroup = _outerPatrolGroups select 1;

	for "_i" from 1 to _amount do {
		_outerCircleRange = SECTOR_RANGE - T8U_var_PatAroundRange - 25;
		_formation = [ "WEDGE", "VEE" ] call BIS_fnc_selectRandom;
		_groupToSpawn = [ [_patrolGroup, _markerName], [ "PATROL_AROUND", _outerCircleRange, 0, _formation, "AWARE" ], [true, true, true], [true]];
		_spawnThisUnits pushBack _groupToSpawn;
	};
};

if(count _sniperPatrolGroups > 0) then {
	_amount = _sniperPatrolGroups select 0;
	_patrolGroup = _sniperPatrolGroups select 1;

	for "_i" from 1 to _amount do {
		_outerCircleRange = SECTOR_RANGE - T8U_var_PatAroundRange - 25;
		_formation = [ "WEDGE", "VEE" ] call BIS_fnc_selectRandom;
		_groupToSpawn = [ [_patrolGroup, _markerName], [ "OVERWATCH", _markerName], [true, true, true], [true]];
		_spawnThisUnits pushBack _groupToSpawn;
	};
};

if(count _innerPatrolGroups > 0) then {
	_amount = (_innerPatrolGroups select 0) + _normalGroupOffset;
	_patrolGroup = _innerPatrolGroups select 1;

	for "_i" from 1 to _amount do {
		_innerCircleRange = (SECTOR_RANGE / 2) - T8U_var_PatAroundRange - 25;
		_formation = [ "WEDGE", "VEE" ] call BIS_fnc_selectRandom;
		_groupToSpawn = [ [ _patrolGroup, _markerName ], [ "PATROL_AROUND", _innerCircleRange, 0, _formation, "AWARE" ], [true, true, true], [true]];
		_spawnThisUnits pushBack _groupToSpawn;
	};
};

if(count _armoredPatrolGroups > 0) then {
	_amount = (_armoredPatrolGroups select 0) + _specialGroupOffset;
	_patrolGroup = _armoredPatrolGroups select 1;

	for "_i" from 1 to _amount do {
		_outerCircleRange = SECTOR_RANGE - T8U_var_PatAroundRange - 50;
		_groupToSpawn = [ [ _patrolGroup, _markerName, false], [ "PATROL_AROUND", _outerCircleRange ], [true, true, true], [true]];
		_spawnThisUnits pushBack _groupToSpawn;
	};
};

if(count _airPatrolGroups > 0) then {
	_amount = _airPatrolGroups select 0;
	_patrolGroup = _airPatrolGroups select 1;

	for "_i" from 1 to _amount do {
		_outerCircleRange = SECTOR_RANGE - T8U_var_PatAroundRange - 50;
		_groupToSpawn = [ [ _patrolGroup, _markerName, false], [ "PATROL_AROUND", _outerCircleRange ], [true, true, true], [true]];
		_spawnThisUnits pushBack _groupToSpawn;
	};
};

_retValue = [ _spawnThisUnits ] call T8U_fnc_Spawn;

_sector setVariable ["SectorUnits", _retValue];