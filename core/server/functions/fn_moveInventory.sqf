if (!isDedicated) exitWith {};

params ["_origin", "_target"];

private ["_weapons", "_ammunition", "_items", "_backpacks", "_weaponsItemsCargo", "_containers"];

_weapons = [];
_ammunition= [];
_items = [];
_backpacks = [];

_ammunition = magazineCargo _origin;
_items = itemCargo _origin;
_weaponsItemsCargo = weaponsItemsCargo _origin;

if (count backpackCargo _origin > 0) then {
	{
		_backpacks pushBack (_x call BIS_fnc_basicBackpack);
	} forEach backpackCargo _origin;
};

_containers = everyContainer _origin;
if (count _containers > 0) then {
	/*for "_i" from 0 to (count _containers - 1) do {
		//_weapons = _weapons + (weaponCargo ((_containers select _i) select 1));
		_ammunition = _ammunition + (magazineCargo ((_containers select _i) select 1));
		_items = _items + (itemCargo ((_containers select _i) select 1));
		_weaponsItemsCargo = _weaponsItemsCargo + weaponsItemsCargo ((_containers select _i) select 1);
	}; */
	{
		_ammunition = _ammunition + (magazineCargo (_x select 1));
		_items = _items + (itemCargo (_x select 1));
		_weaponsItemsCargo = _weaponsItemsCargo + weaponsItemsCargo (_x select 1);
	} forEach _containers;
};

if (!isNil "_weaponsItemsCargo") then {
	if (count _weaponsItemsCargo > 0) then {
		{
			_weapons pushBack ([(_x select 0)] call BIS_fnc_baseWeapon);
			for "_i" from 1 to (count _x) - 1 do {
				_item = _x select _i;
				if (typeName _item == typeName "") then {
					if (_item != "") then {
						_items pushBack _item
					};
				} else {
					if (typeName (_item select 0) == typeName []) then {
						_ammunition pushBack (_item select 0)
					};
				};
			};
		} forEach _weaponsItemsCargo;
	};
};

{_target addWeaponCargoGlobal [_x, 1]} forEach _weapons;
{_target addMagazineCargoGlobal [_x, 1]} forEach _ammunition;
{_target addItemCargoGlobal [_x, 1]} forEach _items;
{_target addBackpackCargoGlobal [_x, 1]} forEach _backpacks;

clearMagazineCargoGlobal _origin;
clearWeaponCargoGlobal _origin;
clearItemCargoGlobal _origin;
clearBackpackCargoGlobal _origin;