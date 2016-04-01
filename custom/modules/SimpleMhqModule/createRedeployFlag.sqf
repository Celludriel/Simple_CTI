params ["_type"];

_coord = getmarkerpos "respawn_west_1";
_redeployFlag = createVehicle [_type, _coord, [], 0, "can_collide"];
_redeployFlag allowDamage false;

[_redeployFlag, [(localize "STR_MHQ_REDEPLOY"), "[] call mhqOpenDialog;"]] remoteExec ["addAction", 0, true];