if(!isDedicated) exitWith {};

{
	_marker = _x getVariable "markerName";
	_side = _x getVariable "side";

	[["Processing marker %1 of side %2", _marker, _side]] call CTISHR_fnc_ctiLog;

	_sectorCheck = toArray _marker;
	_sectorCheck resize 3;

	[["_sectorCheck: %1", _sectorCheck]] call CTISHR_fnc_ctiLog;

  if ( toString _sectorCheck == "sec" ) then {
		_currentMarker = toArray _marker;
		_currentMarker resize 8;
		_markerType = [toString _currentMarker] call CTISRV_fnc_getIconTypeForSector;
		_marker setMarkerType _markerType;
		_marker setMarkerShape "ICON";

		if(_side == west) then {
			_marker setMarkerColor "ColorBLUFOR";
		}else{
			_marker setMarkerColor "ColorOPFOR";
		};
	};

	[SECTOR_LOADED_SCRIPTS, [_x]] call CTISHR_fnc_runArrayOfScriptsUnsynced;
} forEach CTI_SECTOR_OBJECTS;

[["Loaded %1 sectors", count CTI_SECTOR_OBJECTS]] call CTISHR_fnc_ctiLog;