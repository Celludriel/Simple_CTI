if (!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount"];
private ["_sectorUnits", "_deadUnits", "_groupName"];

_lvGroupId = _sector getVariable "LVgroupId";

_groupName = ("LVgroup" + str _lvGroupId);
_threatGroup = missionNamespace getVariable _groupName;

waitUntil { !isNil "_threatGroup" };

_deadUnits = [];
_sectorUnits = _sector getVariable ["SectorUnits", []];

{
	if(alive _x) then {
		_x call F_removeUnit;
	} else {
		_deadUnits pushBack _x;
	};
} forEach _sectorUnits;

if(count _deadUnits > 0) then {
	sleep 900;
	{
		_x call F_removeUnit;
	} foreach _deadUnits;
};

[_threatGroup] execVM "core\server\ai\LV\LV_functions\LV_fnc_removeGroupV2.sqf";
deleteGroup _groupName;