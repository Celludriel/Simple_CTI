if(!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount", "_sectorBLUFORcount"];

_markerName = _sector getVariable "markerName";
_pos = getMarkerPos _markerName;

_groupArrayFullTeam = [ "O_Soldier_SL_F", "O_Soldier_AR_F", "O_Soldier_AAR_F", "O_medic_F", "O_Soldier_AT_F", "O_Soldier_AAT_F", "O_Soldier_GL_F", "O_Soldier_GL_F" ];
_groupArrayVehicleTest = [ "O_Heli_Attack_02_black_F", "O_APC_Tracked_02_cannon_F" ];

_spawnThisUnits = [];

for "_i" from 1 to 6 do {
	_outerCircleRange = SECTOR_RANGE - T8U_var_PatAroundRange - 25;
	_formation = [ "WEDGE", "VEE" ] call BIS_fnc_selectRandom;
	_groupToSpawn = [ [ _groupArrayFullTeam, _markerName], [ "PATROL_AROUND", _outerCircleRange, _formation, "AWARE" ] ];
	_spawnThisUnits pushBack _groupToSpawn;
};

for "_i" from 1 to 2 do {
	_outerCircleRange = SECTOR_RANGE - T8U_var_PatAroundRange - 50;
	_groupToSpawn = [ [ _groupArrayVehicleTest, _markerName, false], [ "PATROL_AROUND", _outerCircleRange ] ];
	_spawnThisUnits pushBack _groupToSpawn;
};

for "_i" from 1 to 4 do {
	_innerCircleRange = (SECTOR_RANGE / 2) - T8U_var_PatAroundRange - 25;
	_formation = [ "WEDGE", "VEE" ] call BIS_fnc_selectRandom;
	_groupToSpawn = [ [ _groupArrayFullTeam, _markerName ], [ "PATROL_AROUND", _innerCircleRange, _formation, "AWARE" ] ];
	_spawnThisUnits pushBack _groupToSpawn;
};

_retValue = [ _spawnThisUnits ] call T8U_fnc_Spawn;
diag_log format ["enemiesArray: %1", _retValue];

_sector setVariable ["T8_units", _retValue];