if(!hasInterface) exitWith {};

params ["_unit"];
private ["_unit"];

waitUntil { !isNil("_unit") };

_deployMarkerName = _unit getVariable "markerName";
_flagMarkerName = _deployMarkerName + "_pos";
if(!isNil(_flagMarkerName)) then { deleteMarkerLocal (_flagMarkerName);};
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