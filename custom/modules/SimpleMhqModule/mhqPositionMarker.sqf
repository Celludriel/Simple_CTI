if(!hasInterface) exitWith {};

params ["_unit"];

waitUntil { !isNil("_unit") };

_deployMarkerName = _unit getVariable "markerName";
_marker = createMarkerLocal [_deployMarkerName + "_pos", getPos _unit];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "hd_flag";
_marker setMarkerColorLocal "ColorBLUFOR";

_unit addEventHandler ["Killed",	{
										_killedMhq = _this select 0;
										_marker = _killedMhq getVariable "markerName";
										deleteMarkerLocal (_marker + "_pos");
									}];

while{ alive _unit } do {
	_isDeployed = _unit getVariable ["MhqDeployed", false];

	if(_isDeployed) then {
		_marker setMarkerAlphaLocal 0;
	} else {
		_marker setMarkerAlphaLocal 1;
		_marker setMarkerPosLocal (getPos _unit);
	};
};