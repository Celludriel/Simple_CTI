if(!isDedicated) exitWith {};

params ["_armory"];

_marker = _armory getVariable "markerTag";
_originPosition = markerPos _marker;
_direction = markerDir _marker;

while { true } do {
	sleep 5;

	if(surfaceIsWater position _armory) then {
		format ["The armory fell into the water, a salvage team is returning it to base."] remoteExec ["systemChat", 0, false];		
		_armory setPos _originPosition;
		_inventory setDir _direction;
	};
};