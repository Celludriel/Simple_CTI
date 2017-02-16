if(!isDedicated) exitWith {};

_contents = missionNamespace getVariable "SLA_STARTING_ARMORY";

{
    [["Processing map marker %1 for slingable armory", _x]] call CTISHR_fnc_ctiLog;

    _armoryCheck = toArray _x;
    _armoryCheck resize 4;

    [["_armoryCheck: %1", _armoryCheck]] call CTISHR_fnc_ctiLog;

    if ( toString _armoryCheck == "sla_" ) then {
		_direction = markerDir _x;
        _armory = [markerPos _x, _direction] call SLA_fnc_spawnSlingableArmory;
		[_armory, _contents] call CTISRV_fnc_fillContainerWithContents;
		_armory setVariable ["markerTag", _x];
    };

} forEach allMapMarkers;