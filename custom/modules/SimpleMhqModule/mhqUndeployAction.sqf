[["Calling mhq_undeploy_action with %1", _this]] call F_log;

params ["_mhq", "_caller", "_actionId", "_arguments"];

_isDeployed = _mhq getVariable "MhqDeployed";
[["_isDeployed: %1", _isDeployed]] call F_log;

if(_isDeployed) then {

	// Unlock so it can be used again
    [_mhq, "UNLOCKED"] remoteExec ["setVehicleLock", 0, false];

	// Revert to original mass so it can be slingloaded again
	_originalMass = _mhq getVariable "originalMass";
	[_mhq, _originalMass] remoteExec ["setMass", 0, false];

	// Mark as undeployed
    _mhq setVariable ["MhqDeployed", false, true];

	// Undeploy
    _respawnId = _mhq getVariable ["respawnId", 0];
    [["_respawnId: %1", _respawnId]] call F_log;

    _respawnId call BIS_fnc_removeRespawnPosition;

	_deployMarkerName = _mhq getVariable "markerName";
	deleteMarker (_deployMarkerName + "_indicator");

	// Handle actions
    [_mhq, _actionId] remoteExec ["removeAction", 0, true];
	[_mhq, [(localize "STR_MHQ_DEPLOY"), "custom\modules\SimpleMhqModule\mhqDeployAction.sqf", [], 6, false, false, "", "(speed (vehicle _target)) < 1 && (getPosATL _target) select 2 < 2"]] remoteExec ["addAction", 0, true];
};