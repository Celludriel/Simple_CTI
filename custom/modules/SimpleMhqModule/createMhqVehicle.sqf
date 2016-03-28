params ["_marker", "_type"];
private ["_marker", "_type"];

_coord = getmarkerpos _marker;
_mhq = createVehicle [_type, _coord, [], 0, "can_collide"];

waitUntil { !isNil("_mhq") };

_mhq setDir (markerDir _marker);
_mhq setVariable ["markerName", _marker, true];
_mhq setVariable ["type", _type, true];
_mhq setVariable ["MhqDeployed", false, true];

[_mhq, [(localize "STR_MHQ_OPEN_ARSENAL"), MHQ_ARSENAL_SCRIPT, [], 7, false, false, "", "_target getVariable 'MhqDeployed'"]] remoteExec ["addAction", 0, true];
[_mhq, [(localize "STR_MHQ_DEPLOY"), "custom\modules\SimpleMhqModule\mhqDeployAction.sqf", [], 6, false, false, "", "(speed (vehicle _target)) < 1 && (getPosATL _target) select 2 < 2"]] remoteExec ["addAction", 0, true];
[_mhq, ["killed", {		[["I'm killed", []]] call F_log;
						_killedMhq = _this select 0;
						_killedMhq remoteExec ["removeAllActions", 0, true];
                        _marker = _killedMhq getVariable "markerName";

						_respawnId = _killedMhq getVariable ["respawnId", nil];
    					[["_respawnId: %1", _respawnId]] call F_log;
						if(!isNil("_respawnId")) then {
							_respawnId call BIS_fnc_removeRespawnPosition;
							deleteMarker (_marker + "_indicator");
						};


                        _vehType = _killedMhq getVariable "type";

						[["Creating %1 at %2", _vehType, _marker]] call F_log;
                        [_marker, _vehType] call createMhqVehicle;
                    }]] remoteExec ["addEventHandler", 0, true];
_mhq