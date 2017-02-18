if(!hasInterface) exitWith {};

params ["_target"];
private ["_return", "_isNotMan", "_canHaveInventory"];

_return = false;
{
	_isNotMan = !(_x isKindOf "CAManBase");
	_canHaveInventory = [_x] call CTISHR_fnc_canHaveInventory;

	if(_canHaveInventory && _isNotMan) exitWith { _return = true; };
} forEach ((_target nearEntities 5) - [_target]);

_return