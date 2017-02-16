params ["_obj"];

_ammunition = magazineCargo _obj;
_items = itemCargo _obj;
_weaponsItemsCargo = weaponsItemsCargo _obj;
_backPackCargo = backpackCargo _obj;
_containers = everyContainer _obj;

_return = if(count _ammunition > 0 || count _items > 0 || count _weaponsItemsCargo > 0 || count _backPackCargo > 0 || count _containers > 0) then { true; } else { false; }

_return