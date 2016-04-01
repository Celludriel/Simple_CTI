if(!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount", "_sectorBLUFORcount"];

_markerName = _sector getVariable "markerName";
_pos = getMarkerPos _markerName;

_groupArrayFullTeam = [ "O_Soldier_SL_F", "O_Soldier_AR_F", "O_Soldier_AAR_F", "O_medic_F", "O_Soldier_AT_F", "O_Soldier_AAT_F", "O_Soldier_GL_F", "O_Soldier_GL_F" ];

_spawnThisUnits = [];

for "_i" from 1 to 6 do {
	_spawnMarker = createMarker [format["%1_outer_%2", _markerName, _i], _pos];
	_spawnMarker setMarkerShape "ELLIPSE";
	_spawnMarker setMarkerAlphaLocal 0;
	_outerCircleRange = SECTOR_RANGE - T8U_var_PatAroundRange - 25;
	_spawnMarker setMarkerSize [_outerCircleRange, _outerCircleRange];

	waitUntil { !isNil("_spawnMarker") };

	_groupToSpawn = [ [ _groupArrayFullTeam, _spawnMarker], [ "PATROL_AROUND" ] ];
	_spawnThisUnits pushBack _groupToSpawn;
};

for "_i" from 1 to 6 do {
	_spawnMarker = createMarker [format["%1_inner_%2", _markerName, _i], _pos];
	_spawnMarker setMarkerShape "ELLIPSE";
	_spawnMarker setMarkerAlphaLocal 0;
	_innerCircleRange = (SECTOR_RANGE / 2) - T8U_var_PatAroundRange - 25;
	_spawnMarker setMarkerSize [_innerCircleRange, _innerCircleRange];

	waitUntil { !isNil("_spawnMarker") };

	_groupToSpawn = [ [ _groupArrayFullTeam, _spawnMarker], [ "PATROL_AROUND" ] ];
	_spawnThisUnits pushBack _groupToSpawn;
};

_retValue = [ _spawnThisUnits ] call T8U_fnc_Spawn;
diag_log format ["enemiesArray: %1", _retValue];

_sector setVariable ["T8_units", _retValue];