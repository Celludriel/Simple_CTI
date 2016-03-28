if(!isDedicated) exitWith {};

params ["_sector", "_color", "_range"];

_sectorLocation = getpos _sector;
_marker = nil;
_indicatorName = [_sector] call F_createSectorIndicatorName;
[["_indicatorName: %1", _indicatorName]] call F_log;
if (getMarkerColor _indicatorName == "") then {
	[["Creating indicator marker"]] call F_log;
	_marker = createMarker [_indicatorName, _sectorLocation];
	[["%1 marker created", _marker]] call F_log;
} else {
	_marker = _indicatorName;
};

[_marker, _color, _range] call F_setIndicatorMarker;