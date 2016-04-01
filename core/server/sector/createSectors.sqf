if(!isDedicated) exitWith {};

{
	[["Processing map marker %1", _x]] call CTISHR_fnc_ctiLog;

	_sectorCheck = toArray _x;
	_sectorCheck resize 3;

	[["_sectorCheck: %1", _sectorCheck]] call CTISHR_fnc_ctiLog;

	if ( toString _sectorCheck == "sec" ) then {
			_currentMarker = toArray _x;
			_currentMarker resize 8;
			_markerType = [toString _currentMarker] call CTISRV_fnc_getIconTypeForSector;
			_x setMarkerType _markerType;
			_x setMarkerShape "ICON";
			_x setMarkerColor "ColorOPFOR";

			_markerLocation = getmarkerpos _x;
			_invisibleSectorObject = [_markerLocation] call CTISRV_fnc_spawnInvisibleObject;
			_invisibleSectorObject setVariable ["markerName", _x, false];
			_invisibleSectorObject setVariable ["side", east, false];
			_invisibleSectorObject setVariable ["condition", "neutral", false];

			[SECTOR_CREATED_SCRIPTS, [_invisibleSectorObject]] call CTISHR_fnc_runArrayOfScriptsUnsynced;

			CTI_SECTOR_OBJECTS pushback _invisibleSectorObject;
	};
} forEach allMapMarkers;

[["Created %1 sectors", count CTI_SECTOR_OBJECTS]] call CTISHR_fnc_ctiLog;