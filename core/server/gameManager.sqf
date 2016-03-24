if (!isDedicated or PRESENCE_MANAGER_RUNNING) exitWith {};

PRESENCE_MANAGER_RUNNING = true;
diag_log format ["Before loop %1", time];

_sectorCountBlUFOR = 0;
_sectorCountOPFOR = 0;
{
	_activationBLUFORcount = [_x, ACTIVATION_RANGE, WEST] call F_getUnitCount;
	_sectorBLUFORcount = [_x, SECTOR_RANGE, WEST] call F_getUnitCount;
	_sectorOPFORcount = [_x, SECTOR_RANGE, EAST] call F_getUnitCount;

	if(_activationBLUFORcount > 0 || _sectorBLUFORcount > 0 || _sectorOPFORcount > 0) then {
		//check if a sector needs to be deactivated
		_handle = [_x, _activationBLUFORcount] execVM "core\server\sector\sectorDeActivationHandler.sqf";
		waitUntil {isNull _handle};

		//check if sector needs to be activated
		_handle = [_x, _activationBLUFORcount, _sectorBLUFORcount] execVM "core\server\sector\sectorActivationHandler.sqf";
		waitUntil {isNull _handle};

		//check if sector needs to be contested
		_handle = [_x, _sectorBLUFORcount, _sectorOPFORcount] execVM "core\server\sector\sectorContestingHandler.sqf";
		waitUntil {isNull _handle};

		//check if sector needs to change side
		_handle = [_x, _sectorBLUFORcount, _sectorOPFORcount] execVM "core\server\sector\sectorControlHandler.sqf";
		waitUntil {isNull _handle};
	};

	if(_x getVariable "side" == east) then {
		_sectorCountOPFOR = _sectorCountOPFOR + 1;
	} else {
		_sectorCountBlUFOR = _sectorCountBlUFOR + 1;
	};
} forEach CTI_SECTOR_OBJECTS;

if([_sectorCountBLUFOR, _sectorCountOPFOR, count CTI_SECTOR_OBJECTS] call gameEndingRule) then {
	//stop the hearthbeat scripts
	GAME_RUNNING = false;
	//clear the savegame so next mission will start clean
	profileNamespace setVariable [SAVEGAME_NAME, nil];
	saveProfileNamespace;
	//end the mission
	"end1" call BIS_fnc_endMissionServer;
};

diag_log format ["After loop %1", time];
PRESENCE_MANAGER_RUNNING = false;