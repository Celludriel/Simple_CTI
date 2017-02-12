params ["_marker", "_type"];

_coord = getmarkerpos _marker;
_mhq = createVehicle [_type, _coord, [], 0, "can_collide"];

waitUntil { !isNil("_mhq") };

_mhq setDir (markerDir _marker);
_mhq setVariable ["markerName", _marker, true];
_mhq setVariable ["type", _type, true];
_mhq setVariable ["MhqDeployed", false, true];

[[_mhq, _marker], "custom\modules\SimpleMhqModule\mhqPositionMarker.sqf"] remoteExec ["execVM", -2, true];

[_mhq, ["<t color='#11ff11'>" + (localize "STR_MHQ_DEPLOY") + "</t>", "custom\modules\SimpleMhqModule\mhqDeployAction.sqf", [], 6, false, false, "", "(speed (vehicle _target)) < 1 && (getPosATL _target) select 2 < 2"]] remoteExec ["addAction", 0, true];

[_mhq] execVM "custom\modules\SimpleMhqModule\mhqAliveMonitor.sqf";

_mhq