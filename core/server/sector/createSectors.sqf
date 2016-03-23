if(!isDedicated) exitWith {};

{
	[["Processing map marker %1", _x]] call F_log;

	_sectorCheck = toArray _x;
	_sectorCheck resize 3;

	[["_sectorCheck: %1", _sectorCheck]] call F_log;

	if ( toString _sectorCheck == "sec" ) then {
			_currentMarker = toArray _x;
			_currentMarker resize 8;
			_markerType = [toString _currentMarker] call F_getIconTypeForSector;
			_x setMarkerType _markerType;
			_x setMarkerShape "ICON";
			_x setMarkerColor "ColorOPFOR";

			_markerLocation = getmarkerpos _x;
			_invisibleSectorObject = [_markerLocation] call F_spawnInvisibleObject;
			_invisibleSectorObject setVariable ["markerName", _x, false];
			_invisibleSectorObject setVariable ["side", east, false];
			_invisibleSectorObject setVariable ["condition", "neutral", false];

			[SECTOR_CREATED_SCRIPTS, [_invisibleSectorObject]] call F_runArrayOfScriptsUnsynced;

			CTI_SECTOR_OBJECTS pushback _invisibleSectorObject;
	};
} forEach allMapMarkers;

[["Created %1 sectors", count CTI_SECTOR_OBJECTS]] call F_log;