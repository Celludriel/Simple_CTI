if (!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount"];
private ["_sector","_activationBLUFORcount"];

// a sector can only deactivate if it's not of the BlueFor side
_sectorSide = _sector getVariable "side";
_sectorLocation = getpos _sector;

if(_sectorSide != WEST) then {
	_sectorState = _sector getVariable "condition";

	if(_sectorState != 'neutral' && _sectorState != 'deactivation') then {
		if(_activationBLUFORcount == 0) then {
			//mark the sector for deactivation, the deactivation will happen later
			_sector setVariable ["condition", "deactivation", false];
			_sector setVariable ["deactivationTime", time + SECONDS_TO_DEACTIVATION, false];
		};
	};

	//check if a sector in deactivation should really be deactivated
	if(_sectorState == 'deactivation') then {
		_deactivationTime = _sector getVariable "deactivationTime";
		if(time >= _deactivationTime) then {
			//sector changes back to neutral
			_sector setVariable ["condition", "neutral", false];

			//any markers will be removed
			[_sector] call F_deleteIndicatorMarker;

			//run any scripts related to deactivating a sector
			[SECTOR_DEACTIVATION_SCRIPTS, [_sector, _activationBLUFORcount]] call F_runArrayOfScriptsUnsynced;
		};
	};
};