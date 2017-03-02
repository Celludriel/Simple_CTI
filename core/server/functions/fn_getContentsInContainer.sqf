if (!isDedicated) exitWith {};

params ["_origin"];
private ["_weapons", "_ammunition", "_items", "_backpacks", "_weaponsItemsCargo", "_containers", "_contents"];

_contents = [];

_weapons = [];
_ammunition= [];
_items = [];
_backpacks = [];
_weaponsItemsCargo = [];
_containers = [];

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

_contents pushBack _weapons;
_contents pushBack _ammunition;
_contents pushBack _items;
_contents pushBack _backpacks;

_contents