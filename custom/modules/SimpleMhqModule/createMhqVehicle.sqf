params ["_marker", "_type"];
private ["_marker", "_type"];

_coord = getPos _marker;
_mhq = createVehicle [_type, _coord, [], 0, "can_collide"];

waitUntil { !isNil("_mhq") };

_mhq setVariable ["markerName", _x, true];
_mhq setVariable ["type", _type, true];
_mhq setVariable ["MhqDeployed", false, true];
_mhq addAction ["Deploy",   {
                                [[[_this select 0, _this select 2], "custom\modules\SimpleMhqModule\mhqDeployAction.sqf"], "BIS_fnc_execVM", true, true] call BIS_fnc_MP;
                            }];
_mhq addEventHandler ["Killed", {
                                    _killedMhq = _this select 0;
                                    _respawnId = _killedMhq getVariable ["MhqDeployed", 0];
                                    [west, _respawnId] call BIS_fnc_removeRespawnPosition;
                                    _marker = _killedMhq getVariable "markerName";
                                    _vehType = _killedMhq getVariable "type";
                                    [_x, _vehType] call createMhqVehicle;
                                }];