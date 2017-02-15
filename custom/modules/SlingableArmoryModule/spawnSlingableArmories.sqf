if(!isDedicated) exitWith {};

_contents = missionNamespace getVariable "SLA_STARTING_ARMORY";

{
    [["Processing map marker %1 for slingable armory", _x]] call CTISHR_fnc_ctiLog;

    _armoryCheck = toArray _x;
    _armoryCheck resize 4;

    [["_armoryCheck: %1", _armoryCheck]] call CTISHR_fnc_ctiLog;

    if ( toString _armoryCheck == "sla_" ) then {
        _armory = [markerPos _x] call SLA_fnc_spawnSlingableArmory;
		_attachedInventoryObject = objNull;
		{
			_attachedInventoryObject = _x;
		} forEach attachedObjects _armory;		
		[_attachedInventoryObject, _contents] call CTISRV_fnc_fillContainerWithContents;
    };

} forEach allMapMarkers;