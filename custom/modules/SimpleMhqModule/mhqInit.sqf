{
    [["Processing map marker %1", _x]] call F_log;

    _mhqCheck = toArray _x;
    _mhqCheck resize 7;

    [["_mhqCheck: %1", _mhqCheck]] call F_log;

    if ( toString _mhqCheck == "mhq_car" ) then {
        [_x, CAR_TYPE] call createMhqVehicle;
    };

    if ( toString _mhqCheck == "mhq_air" ) then {
        [_x, AIR_TYPE] call createMhqVehicle;
    };
} forEach allMapMarkers;