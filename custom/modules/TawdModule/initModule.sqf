if(!hasInterface) exitWith {};

private ["_canDisableGrass"];

_canDisableGrass = ["TawdModuleCanDisableGrassOption", 1] call BIS_fnc_getParamValue;

if(!(_canDisableGrass == 1)) then {
	diag_log format ["disabling grass"];
	tawvd_disablenone = true;
};