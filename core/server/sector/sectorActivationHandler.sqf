if (!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount", "_sectorBLUFORcount"];
private ["_sector","_activationBLUFORcount", "_sectorBLUFORcount"];

// a sector can only activate if it's not of the BlueFor side
_sectorSide = _sector getVariable "side";

if(_sectorSide != WEST) then {
	_sectorState = _sector getVariable "condition";

	if(_activationBLUFORcount > 0 && _sectorState == 'neutral') then {
		//activate the sector
		_sector setVariable ["condition", "active", false];

		//create or update indication marker
		[_sector, "ColorUNKNOWN", SECTOR_RANGE] call F_createOrUpdateIndicationMarker;

		//run any scripts related to activating a sector
		[SECTOR_ACTIVATION_SCRIPTS, [_sector, _activationBLUFORcount, _sectorBLUFORcount]] call F_runArrayOfScriptsUnsynced;
	};

	if(_activationBLUFORcount > 0 && _sectorState == 'deactivation') then {
		//reactivate the sector but nothing more needs to happen
		_sector setVariable ["condition", "active", false];
	};

	if(_sectorState == 'contested') then {
		if(_sectorBLUFORcount == 0) then {
			//reactivate the sector and change the color of the marker
			_sector setVariable ["condition", "active", false];
			[_sector, "ColorUNKNOWN", SECTOR_RANGE] call F_createOrUpdateIndicationMarker;
		};
	};
};