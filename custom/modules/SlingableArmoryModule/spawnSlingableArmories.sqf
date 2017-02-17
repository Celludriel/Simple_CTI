if(!isDedicated) exitWith {};

_contents = missionNamespace getVariable "SLA_STARTING_ARMORY";

{
    [["Processing map marker %1 for slingable armory", _x]] call CTISHR_fnc_ctiLog;

    _armoryCheck = toArray _x;
    _armoryCheck resize 4;

    [["_armoryCheck: %1", _armoryCheck]] call CTISHR_fnc_ctiLog;

    if ( toString _armoryCheck == "sla_" ) then {
<<<<<<< HEAD
		_direction = markerDir _x;
        _armory = [markerPos _x, _direction, [_x, "mil_start", "ColorOrange"]] call SLA_fnc_spawnSlingableArmory;
		[_armory, _contents] call CTISRV_fnc_fillContainerWithContents;
		_armory setVariable ["markerTag", _x];
=======
        _armory = [_x] call SLA_fnc_spawnSlingableArmory;
		[_armory, _contents] call CTISRV_fnc_fillContainerWithContents;		
>>>>>>> 11c16235d1d053eddcb0163f824a8077f3a08375
    };

} forEach allMapMarkers;