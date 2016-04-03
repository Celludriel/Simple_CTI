{
    [["Processing map marker %1", _x]] call CTISHR_fnc_ctiLog;

    _servicePointCheck = toArray _x;
    _servicePointCheck resize 14;

    [["_servicePointCheck: %1", _servicePointCheck]] call CTISHR_fnc_ctiLog;

    if ( toString _servicePointCheck == "service_point_" ) then {
        [_x] call createServicePoint;
    };
} forEach allMapMarkers;