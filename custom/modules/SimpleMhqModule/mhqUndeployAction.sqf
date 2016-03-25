[["Calling mhq_undeploy_action with %1", _this]] call F_log;

params ["_mhq", "_caller", "_actionId", "_arguments"];
private ["_mhq", "_caller", "_actionId", "_arguments"];

_isDeployed = _mhq getVariable "MhqDeployed";
[["_isDeployed: %1", _isDeployed]] call F_log;

if(_isDeployed) then {

    _mhq setVehicleLock "UNLOCKED";
    _mhq setVariable ["MhqDeployed", false, true];

    _respawnId = _mhq getVariable ["respawnId", 0];
    [["_respawnId: %1", _respawnId]] call F_log;

    _respawnId call BIS_fnc_removeRespawnPosition;

    [_mhq, _actionId] remoteExec ["removeAction", 0, true];
	[_mhq, [(localize "STR_MHQ_DEPLOY"), "custom\modules\SimpleMhqModule\mhqDeployAction.sqf", [], 6, false, false, "", "(speed (vehicle _target)) < 1 && isTouchingGround _target"]] remoteExec ["addAction", 0, true];
};