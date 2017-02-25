if (!isDedicated) exitWith {};

params ["_sector", "_sectorBLUFORcount", "_sectorOPFORcount"];

// a sector can only contested if it's not of the BlueFor side
_sectorSide = _sector getVariable "side";
_sectorLocation = getpos _sector;

if(_sectorSide != WEST) then {
	_sectorState = _sector getVariable "condition";

	if(_sectorOPFORcount >= 0 && _sectorBLUFORcount > 0 && _sectorState != "contested") then {
		//contest the sector
		_sector setVariable ["condition", "contested", false];

		//create or update indication marker
		[_sector, "ColorOPFOR", SECTOR_RANGE] call CTISRV_fnc_createOrUpdateIndicationMarker;

		//run any scripts related to contesting a sector
		[SECTOR_CONTESTED_SCRIPTS, [_sector, _sectorBLUFORcount, _sectorOPFORcount]] call CTISHR_fnc_runArrayOfScriptsUnsynced;
	};
};