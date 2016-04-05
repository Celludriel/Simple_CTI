params ["_servicePointMarker"];

private ["_servicePoint", "_position", "_cannotBeServicedYetTimer", "_nextServiceTime"];

_position = getMarkerPos _servicePointMarker;
diag_log format ["_position %1", _position];

_servicePoint = createVehicle [SERVICE_POINT_REPRESENTATION, _position, [], 0, "can_collide"];
_servicePoint setDir (markerDir _servicePointMarker);
_servicePoint allowDamage false;
_cannotBeServicedYetTimer = 0;

while { true } do {
	sleep 1;
	{
		if(!(_x isKindOf "Man")) then {
			_nextServiceTime = _x getVariable ["nextServiceTime", 0];
			if(_nextServiceTime == 0 || _nextServiceTime <= time)then {
				_handle = [_x] execVM "custom\modules\ServicePointModule\rearmground.sqf";
				waitUntil {isNull _handle};
				_x setVariable ["nextServiceTime", time + 180, false];
			} else {
				if((_cannotBeServicedYetTimer % 60) == 0) then {
					[_x, "Can't be serviced yet"] remoteExec ["vehicleChat", -2, false];
					_cannotBeServicedYetTimer = 0;
				};
			};
		};
		_cannotBeServicedYetTimer = _cannotBeServicedYetTimer + 1;
	} forEach ((getPos _servicePoint) nearEntities 5);
};