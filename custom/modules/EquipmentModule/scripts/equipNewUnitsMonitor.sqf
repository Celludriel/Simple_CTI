if(!isDedicated) exitWith {};

private ["_hasBeenGeared"];

while { true } do {
	sleep 1;
	{
		_hasBeenGeared = _x getVariable ["hasBeenGeared", false];
		if(!_hasBeenGeared) then {
			[_x] call EM_fnc_gearUnit;
		};
	} forEach allUnits;
};