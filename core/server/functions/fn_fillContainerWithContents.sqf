/*
	_content format:
		[[[CLASSNAME WEAPON, COUNT]],[[CLASSNAME MAGAZINE, COUNT]],[[CLASSNAME ITEM LIST, COUNT]]]
*/
if(!isDedicated) exitWith {};

params ["_container", "_content"];

clearWeaponCargoGlobal _container;
clearMagazineCargoGlobal _container;
clearItemCargoGlobal _container;
clearBackpackCargoGlobal _container;

_weapons = _content select 0;
{
	_container addWeaponCargoGlobal [_x select 0, _x select 1];
} forEach _weapons;

_magazines = _content select 1;
{
	_container addMagazineCargoGlobal [_x select 0, _x select 1];
} forEach _magazines;

_items = _content select 2;
{
	_container addItemCargoGlobal [_x select 0, _x select 1];
} forEach _items;