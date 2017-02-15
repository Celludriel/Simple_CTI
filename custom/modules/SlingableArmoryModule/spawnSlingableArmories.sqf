if(!isDedicated) exitWith {};

{
    [["Processing map marker %1 for slingable armory", _x]] call CTISHR_fnc_ctiLog;

    _armoryCheck = toArray _x;
    _armoryCheck resize 7;

    [["_armoryCheck: %1", _armoryCheck]] call CTISHR_fnc_ctiLog;

    if ( toString _armoryCheck == "sla_" ) then {
        [markerPos _x] call SLA_fnc_spawnSlingableArmory;
    };

} forEach allMapMarkers;