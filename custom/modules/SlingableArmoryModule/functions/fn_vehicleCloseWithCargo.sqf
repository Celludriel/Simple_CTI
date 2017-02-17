if(!hasInterface) exitWith {};

params ["_target"];

private _return = false;
{		
	_isNotMan = !(_x isKindOf "CAManBase");
	_hasInventory = [_x] call CTISHR_fnc_hasInventory;
			
	if(_hasInventory && _isNotMan) exitWith { _return = true; };
} forEach ((_target nearEntities 5) - [_target]);

_return