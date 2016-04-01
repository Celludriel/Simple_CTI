if(!isDedicated) exitWith {};

params ["_sector", "_color", "_range"];

_sectorLocation = getpos _sector;
_marker = nil;
_indicatorName = [_sector] call CTISRV_fnc_createSectorIndicatorName;
[["_indicatorName: %1", _indicatorName]] call CTISHR_fnc_ctiLog;
if (getMarkerColor _indicatorName == "") then {
	[["Creating indicator marker"]] call CTISHR_fnc_ctiLog;
	_marker = createMarker [_indicatorName, _sectorLocation];
	[["%1 marker created", _marker]] call CTISHR_fnc_ctiLog;
} else {
	_marker = _indicatorName;
};

[_marker, _color, _range] call CTISRV_fnc_setIndicatorMarker;