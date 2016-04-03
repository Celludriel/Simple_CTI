{
    [["Processing map marker %1", _x]] call CTISHR_fnc_ctiLog;

    _mhqCheck = toArray _x;
    _mhqCheck resize 7;

    [["_mhqCheck: %1", _mhqCheck]] call CTISHR_fnc_ctiLog;

    if ( toString _mhqCheck == "mhq_car" ) then {
        _mhq = [_x, CAR_TYPE] call createMhqVehicle;
        _mhq enableRopeAttach true;
    };

    if ( toString _mhqCheck == "mhq_air" ) then {
        [_x, AIR_TYPE] call createMhqVehicle;
    };

    if ( toString _mhqCheck == "mhq_sea" ) then {
        [_x, SEA_TYPE] call createMhqVehicle;
    };

    if ( _x == "respawn_west_1" ) then {
        [REDEPLOY_FLAG] call createRedeployFlag;
    };
} forEach allMapMarkers;