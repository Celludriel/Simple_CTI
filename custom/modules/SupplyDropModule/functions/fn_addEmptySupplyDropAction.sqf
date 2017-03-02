if(!hasInterface) exitWith {};

params ["_supplyDrop"];
private ["_actionFunction"];

_actionFunction = {
	[["Executing Empty Supplydrop function"]] call CTISHR_fnc_ctiLog;
	params ["_target", "_caller", "_id", "_arguments"];

	{
		if([_x] call CTISHR_fnc_canHaveInventory  && !(_x isKindOf "CAManBase")) exitWith {
			[["Remote calling: %1 with %2, %3", "CTISRV_fnc_moveContentsBetweenContainers", _x, _target]] call CTISHR_fnc_ctiLog;
			[_target, _x] remoteExecCall ["CTISRV_fnc_moveContentsBetweenContainers", 0];
		};
	} forEach ((_target nearEntities 5) - [_target]);

};

_supplyDrop addAction ["Empty Supplydrop", _actionFunction, nil, 1.5, true, true, "", "[_target] call SD_fnc_vehicleCloseCanHaveCargo"];