if(!hasInterface) exitWith {};

params ["_target"];
private ["_return", "_isNotMan", "_canHaveInventory", "_markerTag", "_slaCheck"];

_return = false;
{
	// cannot empty in player
	_isNotMan = !(_x isKindOf "CAManBase");
	
	[["_isNotMan: %1", _isNotMan]] call CTISHR_fnc_ctiLog;
	
	// can only empty if there is inventory
	_canHaveInventory = [_x] call CTISHR_fnc_canHaveInventory;
	
	[["_canHaveInventory: %1", _canHaveInventory]] call CTISHR_fnc_ctiLog;

	// cannot empty in a slingable armory that uses infinite inventory
	_markerTag = _x getVariable ["markerTag", ""];
	_slaCheck = toArray _markerTag;
    _slaCheck resize 4;

    [["_slaCheck: %1", _slaCheck]] call CTISHR_fnc_ctiLog;

	if(_canHaveInventory && _isNotMan && (toString _slaCheck) != "sla_") exitWith { _return = true; };
} forEach ((_target nearEntities 5) - [_target]);

_return