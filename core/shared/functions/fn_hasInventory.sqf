params ["_obj"];
private ["_ammunition", "_items", "_weaponsItemsCargo", "_backPackCargo", "_containers", "_return"];

_ammunition = magazineCargo _obj;
_items = itemCargo _obj;
_weaponsItemsCargo = weaponsItemsCargo _obj;
_backPackCargo = backpackCargo _obj;
_containers = everyContainer _obj;

_return = false;
if(count _ammunition > 0 || count _items > 0 || count _weaponsItemsCargo > 0 || count _backPackCargo > 0 || count _containers > 0) then { _return = true; };

_return