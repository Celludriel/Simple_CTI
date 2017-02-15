if (!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount"];

_lvGroupId = _sector getVariable "LVgroupId";

_threatGroup = missionNamespace getVariable ("LVgroup" + str _lvGroupId);

waitUntil { !isNil "_threatGroup" };

[_threatGroup] execVM "core\server\ai\LV\LV_functions\LV_fnc_removeGroupV2.sqf";