if(!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount", "_sectorBLUFORcount"];

_handle = [] execVM "custom\modules\LVSectorMilitarizationModule\config.sqf";
waitUntil { isNull _handle };

_newCounter = GROUP_COUNTER + 1;

_sector setVariable ["LVgroupId", _newCounter, false];

[(getPos _sector),2,SECTOR_RANGE,[true,false],[true,false,false],false,[LV_MINIMUM_INFANTRY,LV_VARIABLE_INFANTRY],[LV_MINIMUM_VEHICLES,LV_VARIABLE_VEHICLES],LV_SKILL_LEVEL,nil,nil,_newCounter] execVM "core\server\ai\LV\militarize.sqf";

_sectorUnits = [];
_newGroup = ("LVgroup" + str _lvGroupId);
// _newGroup deleteGroupWhenEmpty true; -- Introduce when dev branch 1.67 is released
{
	_sectorUnits pushBack _x;
} forEach units _newGroup;


if(GROUP_COUNTER < _newCounter) then {
	GROUP_COUNTER = _newCounter;
};

_sector setVariable ["SectorUnits", _sectorUnits];