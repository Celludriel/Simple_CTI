params ["_servicePointMarker"];

_position = getMarkerPos _servicePointMarker;

_servicePoint = createVehicle [SERVICE_POINT_REPRESENTATION, _position, [], 0, "can_collide"];
_servicePoint allowDamage false;

while { true } do {
	sleep 1;
	{
		if(!(_x isKindOf "Man")) then {
			execVM "custom\modules\ServicePointModule\rearmground.sqf";
		}
	} forEach _servicePoint nearEntities 5;
};