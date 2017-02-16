if(!hasInterface) exitWith {};

params ["_armory"];

_actionFunction = {
	params ["_target", "_caller", "_id", "_arguments"];

	{
		if([_x] call CTISHR_fnc_hasInventory  && typeOf _x != 'Man') then {
			[_x, _target] call CTISRV_fnc_moveInventory;
		};
	} forEach (_target nearEntities 5);

};

_condition = {
	_return = false;
	{
		if([_x] call CTISHR_fnc_hasInventory && typeOf _x != 'Man') exitWith { _return = true; };
	} forEach (_target nearEntities 5);

	_return;
};

_armory addAction ["Transfer Inventory", _actionFunction, nil, 1.5, true, true, "", _condition];