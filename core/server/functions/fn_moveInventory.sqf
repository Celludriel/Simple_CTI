if (!isDedicated) exitWith {};

params ["_origin", "_target"];
private ["_contents"];

_contents = [_origin] call CTISRV_fnc_fetchContentOfInventory;

{_target addWeaponCargoGlobal [_x, 1]} forEach (_contents select 0);
{_target addMagazineCargoGlobal [_x, 1]} forEach (_contents select 1);
{_target addItemCargoGlobal [_x, 1]} forEach (_contents select 2);
{_target addBackpackCargoGlobal [_x, 1]} forEach (_contents select 3);

clearMagazineCargoGlobal _origin;
clearWeaponCargoGlobal _origin;
clearItemCargoGlobal _origin;
clearBackpackCargoGlobal _origin;