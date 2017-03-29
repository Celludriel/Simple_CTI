if(!hasInterface) exitWith {};

params ["_armory"];
private ["_actionFunction"];

_actionFunction = {
	[["Executing Transfer Cargo function"]] call CTISHR_fnc_ctiLog;
	params ["_target", "_caller", "_id", "_arguments"];

	{
		if([_x] call CTISHR_fnc_hasInventory  && !(_x isKindOf "CAManBase")) then {
			[["Remote calling: %1 with %2, %3", "InfInv_fnc_moveContentsFromOtherContainer", _x, _target]] call CTISHR_fnc_ctiLog;
			[_x, _target] remoteExecCall ["InfInv_fnc_moveContentsFromOtherContainer", 2];
		};
	} forEach ((_target nearEntities 5) - [_target]);
	[] remoteExecCall ["CTISRV_fnc_executeSave", 2];
};

_armory addAction ["Transfer Inventory", _actionFunction, nil, 1.5, true, true, "", "[_target] call SLA_fnc_vehicleCloseWithCargo"];