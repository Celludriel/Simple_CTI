if(!isDedicated) exitWith {};

{
    [["Processing map marker %1 for arsenal setup", _x]] call CTISHR_fnc_ctiLog;

    _arsenalCheck = toArray _x;
    _arsenalCheck resize 4;

    [["_arsenalCheck: %1", _arsenalCheck]] call CTISHR_fnc_ctiLog;

    if ( toString _arsenalCheck == "ars_" ) then {
    	[_x] call ARS_fnc_spawnArsenal;
    };

} forEach allMapMarkers;