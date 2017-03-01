if(!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount", "_sectorBLUFORcount"];

_handle = [] execVM "custom\modules\LVSectorMilitarizationModule\config.sqf";
waitUntil { isNull _handle };

_newCounter = GROUP_COUNTER + 1;

_sector setVariable ["LVgroupId", _newCounter, false];

_handle = [(getPos _sector),2,SECTOR_RANGE,[true,false],[true,false,false],false,[LV_MINIMUM_INFANTRY,LV_VARIABLE_INFANTRY],[LV_MINIMUM_VEHICLES,LV_VARIABLE_VEHICLES],LV_SKILL_LEVEL,nil,nil,_newCounter] execVM "core\server\ai\LV\militarize.sqf";
waitUntil { isNull _handle };

_sectorUnits = [];
_newGroup = ("LVgroup" + str _newCounter);

[["_newGroup: %1", _newGroup]] call CTISHR_fnc_ctiLog;

_threatGroup = missionNamespace getVariable _newGroup;

[["_threatGroup: %1", _threatGroup]] call CTISHR_fnc_ctiLog;

// _threatGroup deleteGroupWhenEmpty true; -- Introduce when dev branch 1.67 is released
{
	_sectorUnits pushBack _x;
} forEach units _threatGroup;


if(GROUP_COUNTER < _newCounter) then {
	GROUP_COUNTER = _newCounter;
};

_sector setVariable ["SectorUnits", _sectorUnits];