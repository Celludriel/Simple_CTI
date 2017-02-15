if(!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount", "_sectorBLUFORcount"];

_newCounter = GROUP_COUNTER + 1;

_sector setVariable ["LVgroupId", _newCounter, false];

[(getPos _sector),2,SECTOR_RANGE,[true,false],[true,false,false],false,[LV_MINIMUM_INFANTRY,LV_VARIABLE_INFANTRY],[LV_MINIMUM_VEHICLES,LV_VARIABLE_VEHICLES],LV_SKILL_LEVEL,nil,nil,_newCounter] execVM "core\server\ai\LV\militarize.sqf";

if(GROUP_COUNTER < _newCounter) then {
	GROUP_COUNTER = _newCounter;
};