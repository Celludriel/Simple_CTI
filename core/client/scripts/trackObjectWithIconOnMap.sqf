if(!hasInterface) exitWith {};

params ["_obj", "_markerName", "_iconType", "_iconColor"];
private ["_flagMarkerName"];

waitUntil { !isNil("_obj") };

_flagMarkerName = _markerName + "_pos";
if(!isNil("_flagMarkerName")) then { deleteMarkerLocal (_flagMarkerName); };
_marker = createMarkerLocal [_flagMarkerName, getPos _obj];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal _iconType;
_marker setMarkerColorLocal _iconColor;
_marker setMarkerAlphaLocal 1;

while{ alive _obj } do {
	_marker setMarkerPosLocal (getPos _obj);
};

_marker setMarkerAlphaLocal 0;
deleteMarkerLocal _marker;