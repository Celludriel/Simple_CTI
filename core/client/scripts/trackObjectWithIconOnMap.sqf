if(!hasInterface) exitWith {};

params ["_obj", "_markerName", "_iconType", "_iconColor"];
private ["_flagMarkerName", "_marker"];

[["Running trackObjectWithIconOnMap with: %1, %2, %3, %4", _obj, _markerName, _iconType, _iconColor]] call CTISHR_fnc_ctiLog;

waitUntil { !isNil("_obj") };

_flagMarkerName = format ["%1_pos", _markerName];

[["Composed markername: %1", _flagMarkerName]] call CTISHR_fnc_ctiLog;

if(!isNil("_flagMarkerName")) then { deleteMarkerLocal (_flagMarkerName); };

[["Creating marker"]] call CTISHR_fnc_ctiLog;

_marker = createMarkerLocal [_flagMarkerName, getPos _obj];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal _iconType;
_marker setMarkerColorLocal _iconColor;
_marker setMarkerAlphaLocal 1;

[["Marker created: %1", _marker]] call CTISHR_fnc_ctiLog;

while{ alive _obj } do {
	_marker setMarkerPosLocal (getPos _obj);
};

[["Removing marker: %1", _marker]] call CTISHR_fnc_ctiLog;

_marker setMarkerAlphaLocal 0;
deleteMarkerLocal _marker;