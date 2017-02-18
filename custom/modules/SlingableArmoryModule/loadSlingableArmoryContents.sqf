if(!isDedicated) exitWith {};

params ["_armory"];
private ["_contents", "_saveKey", "_markerTag"];

_markerTag = _armory getVariable "markerTag";
_saveKey = format ["slingableArmory_%1", _markerTag];
_contents = [_saveKey] call CTISRV_fnc_loadDataBlockInSaveContainer;

if(size _contents > 0) then {
	{_armory addWeaponCargoGlobal [_x, 1]} forEach (_contents select 0);
	{_armory addMagazineCargoGlobal [_x, 1]} forEach (_contents select 1);
	{_armory addItemCargoGlobal [_x, 1]} forEach (_contents select 2);
	{_armory addBackpackCargoGlobal [_x, 1]} forEach (_contents select 3);
};