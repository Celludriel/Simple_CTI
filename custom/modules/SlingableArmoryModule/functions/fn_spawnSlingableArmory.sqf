if(!isDedicated) exitWith {};

params ["_spawnPosition"];

_inventory = createVehicle ["Land_Cargo20_military_green_F", _spawnPosition, [], 0, "can_collide"];
_cargo = "Supply500" createVehicle [0,0,0];
_cargo attachTo [_inventory, [0,0,0]];

[_inventory, ["Open arsenal",	{
					params ["_inventory"];
					_cargo = objNull;
					{
						_cargo = _x;
					} forEach attachedObjects _inventory;
					player action ["Gear", _cargo];
			}]] remoteExec ["addAction", 0, true];

_inventory