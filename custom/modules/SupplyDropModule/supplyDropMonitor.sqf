if(!isDedicated) exitWith {};

_durationBetweenDrops = ["SupplyDropDurationBetweenDrops", 300] call BIS_fnc_getParamValue;
_maxSupplyDrops = ["SupplyDropMaxSupplyDrops", 3] call BIS_fnc_getParamValue;
_currentSupplyDrops = missionNamespace getVariable "CURRENT_AMOUNT_OF_SUPPLY_DROPS";

 while { true } do {
 	sleep _durationBetweenDrops;

 	if(_currentSupplyDrops < _maxSupplyDrops) then {
 		// start a new drop

 	};
 };