if(!hasInterface) exitWith {};

params ["_unit", "_markerName"];

waitUntil { !isNil("_unit") };

_flagMarkerName = _markerName + "_pos";
if(!isNil("_flagMarkerName")) then { deleteMarkerLocal (_flagMarkerName); };
_marker = createMarkerLocal [_flagMarkerName, getPos _unit];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "hd_flag";
_marker setMarkerColorLocal "ColorBLUFOR";

while{ alive _unit } do {
	_isDeployed = _unit getVariable ["MhqDeployed", false];

	if(_isDeployed) then {
		_marker setMarkerAlphaLocal 0;
	} else {
		_marker setMarkerAlphaLocal 1;
		_marker setMarkerPosLocal (getPos _unit);
	};
};