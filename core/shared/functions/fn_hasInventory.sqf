params ["_obj"];

[["Checking inventory for %1", _obj]] call CTISHR_fnc_ctiLog;

_ammunition = magazineCargo _obj;
_items = itemCargo _obj;
_weaponsItemsCargo = weaponsItemsCargo _obj;
_backPackCargo = backpackCargo _obj;
_containers = everyContainer _obj;

private _return = false;
if(count _ammunition > 0 || count _items > 0 || count _weaponsItemsCargo > 0 || count _backPackCargo > 0 || count _containers > 0) then { _return = true; };

_return