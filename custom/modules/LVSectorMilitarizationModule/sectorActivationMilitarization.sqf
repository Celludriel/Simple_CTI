if(!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount", "_sectorBLUFORcount"];
private ["_sector","_activationBLUFORcount", "_sectorBLUFORcount"];

_newCounter = GROUP_COUNTER + 1;

_sector setVariable ["LVgroupId", _newCounter, false];

[(getPos _sector),2,SECTOR_RANGE,[true,false],[true,false,false],false,[20,20],[3,4],"default",nil,nil,_newCounter] execVM "custom\modules\LVSectorMilitarizationModule\LV\militarize.sqf";

if(GROUP_COUNTER < _newCounter) then {
	GROUP_COUNTER = _newCounter;
};