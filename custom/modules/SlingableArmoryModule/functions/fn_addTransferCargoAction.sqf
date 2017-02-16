if(!hasInterface) exitWith {};

params ["_armory"];

_actionFunction = {
	params ["_target", "_caller", "_id", "_arguments"];

	{
		if([_x] call CTISHR_fnc_hasInventory  && !(_x isKindOf "CAManBase")) then {
			[_x, _target] call CTISRV_fnc_moveInventory;
		};
	} forEach (_target nearEntities 5);

};

_armory addAction ["Transfer Inventory", _actionFunction, nil, 1.5, true, true, "", "[_target] call SLA_fnc_vehicleCloseWithCargo"];