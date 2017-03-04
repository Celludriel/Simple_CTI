if(!isDedicated) exitWith {};

params ["_armory"];
private ["_marker", "_originPosition", "_direction"];

_marker = _armory getVariable "markerTag";
_originPosition = markerPos _marker;
_direction = markerDir _marker;

while { true } do {
	sleep 5;

	if(surfaceIsWater position _armory && ((getPosASL _armory) select 2) <= 0) then {
		format ["The armory fell into the water, a salvage team is returning it to base."] remoteExec ["systemChat", 0, false];		
		_armory setPos _originPosition;
		_armory setDir _direction;
	};
};