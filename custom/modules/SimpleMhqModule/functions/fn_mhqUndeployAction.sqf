[["Calling mhq_undeploy_action with %1", _this]] call CTISHR_fnc_ctiLog;

params ["_mhq"];

private ["_isDeployed", "_originalMass", "_respawnId", "_deployMarkerName", "_deployLabel", "_selfDestructLabel"];

_isDeployed = _mhq getVariable "MhqDeployed";
[["_isDeployed: %1", _isDeployed]] call CTISHR_fnc_ctiLog;

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
    [["_respawnId: %1", _respawnId]] call CTISHR_fnc_ctiLog;

    _respawnId call BIS_fnc_removeRespawnPosition;

	_deployMarkerName = _mhq getVariable "markerName";
	deleteMarker (_deployMarkerName + "_indicator");

	// Handle actions
    _mhq remoteExec ["removeAllActions", 0, true];

	_deployLabel = format ["<t color='#11ff11'>%1</t>", (localize "STR_MHQ_DEPLOY")];
	[_mhq, [_deployLabel, { [_this select 0] call MHQ_fnc_mhqDeployAction; }, [], 6, false, false, "", "(speed (vehicle _target)) < 1 && (getPosATL _target) select 2 < 2"]] remoteExec ["addAction", 0, true];

	_selfDestructLabel = format ["<t color='#ff1111'>%1</t>", (localize "STR_MHQ_SELFDESTRUCT")];
	[_mhq, [_selfDestructLabel, { [_this select 0] call MHQ_fnc_mhqSelfDestructAction; }, [], 6, false, false, "", "(speed (vehicle _target)) < 1 && (getPosATL _target) select 2 < 2"]] remoteExec ["addAction", 0, true];
};