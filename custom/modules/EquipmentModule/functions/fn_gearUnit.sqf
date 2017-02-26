if(!isDedicated ) exitWith {};

params ["_unit"];

private ["_rifleLoadouts", "_type", "_weaponPick", "_currentWeapon", "_currentMagazines", "_newWeapon", "_newMagazine"];

_rifleLoadouts = missionNamespace getVariable "EM_RIFLE_LOADOUTS";

_type = typeOf _unit;

_weaponPick = [];
{
	_typeContainer = _x select 0;
	if(_type in _typeContainer) then {
		_weaponPick = selectRandom (_x select 1);
	};
} forEach _rifleLoadouts;

if(count _weaponPick > 0) then {
	// clear primary weapon stuff
	_currentWeapon = primaryWeapon _unit;
	_currentMagazines = primaryWeaponMagazine _unit;
	removeAllPrimaryWeaponItems _unit;
	_unit removeMagazines _currentMagazines;
	_unit removeWeaponGlobal _currentWeapon;

	// add new primary weapon with magazines
	_newWeapon = selectRandom (_weaponPick select 0);
	_newMagazine = selectRandom (_weaponPick select 1);

	_unit addMagazine [_newMagazine, 7];
	_unit addWeapon _newWeapon;

	// add grenades if weaponname contains GL
	if(_newWeapon find "GL" > 0) then {
		_unit addMagazine ["1Rnd_HE_Grenade_shell", 3];
	};
};

_unit setVariable ["hasBeenGeared", true];