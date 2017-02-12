if(!isDedicated) exitWith {};

if(count CTI_SECTOR_OBJECTS == 0) then {
	_handle = [] execVM "core\server\sector\createSectors.sqf";
	waitUntil {isNull _handle};
} else {
	_handle = [] execVM "core\server\sector\loadSectors.sqf";
	waitUntil {isNull _handle};
};