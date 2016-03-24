params ["_marker", "_type"];
private ["_marker", "_type"];

_coord = getmarkerpos _marker;
_mhq = createVehicle [_type, _coord, [], 0, "can_collide"];

waitUntil { !isNil("_mhq") };

_mhq setVariable ["markerName", _marker, true];
_mhq setVariable ["type", _type, true];
_mhq setVariable ["MhqDeployed", false, true];

[_mhq, ["Deploy", "custom\modules\SimpleMhqModule\mhqDeployAction.sqf"]] remoteExec ["addAction", 0, true];

_mhq addEventHandler ["Killed", {
									[["I'm killed", []]] call F_log;
                                    _killedMhq = _this select 0;
									[[], _killedMhq] remoteExec ["removeAllActions", 0, true];

									_respawnId = _killedMhq getVariable ["respawnId", 0];
    								[["_respawnId: %1", _respawnId]] call F_log;
									_respawnId call BIS_fnc_removeRespawnPosition;

                                    _marker = _killedMhq getVariable "markerName";
                                    _vehType = _killedMhq getVariable "type";

									[["Creating %1 at %2", [_marker, _vehType]]] call F_log;
                                    [_marker, _vehType] call createMhqVehicle;
                                }];