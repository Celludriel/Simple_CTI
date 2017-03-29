if(!isDedicated) exitWith {};

[["Saving Slignable Armories"]] call CTISHR_fnc_ctiLog;

private ["_contents", "_markerTag", "_saveKey", "_slingableArmories"];

_slingableArmories = missionNamespace getVariable ["slingableArmories", []];
[["_slingableArmories: %1", _slingableArmories]] call CTISHR_fnc_ctiLog;
{
	[_x, "SLA_fnc_saveSlingableArmoryContentsCallBack", clientOwner] remoteExecCall ["InfInv_fnc_getContainerContents", 2];
} forEach _slingableArmories;