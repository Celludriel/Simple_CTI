if(!hasInterface) exitWith {};

_enableTacticalIcons = ["EnableTacticalIcons", 0] call BIS_fnc_getParamValue;

if(_enableTacticalIcons == 1) then {
	[] execVM "custom\modules\TacticalIconModule\MGI\MGI_init.sqf";
};