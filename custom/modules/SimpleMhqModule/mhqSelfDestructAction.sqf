[["Calling mhq_selfdestruct_action with %1", _this]] call CTISHR_fnc_ctiLog;

params ["_mhq", "_caller", "_actionId", "_arguments"];
private ["_isDeployed", "_handle", "_countdown"];

// undeploy if it's deployed, self destruct means you are giving up the spawn position
_isDeployed = _mhq getVariable "MhqDeployed";
if (_isDeployed) then {
	_handle = [] execVM "custom\modules\SimpleMhqModule\mhqUndeployAction.sqf";
	waitUntil { isNull _handle };
};

// remove all actions no redeploying allowed
_mhq remoteExec ["removeAllActions", 0, true];

// lock it once self destruct starts we don't want people to suicidal
[_mhq, "LOCKED"] remoteExec ["setVehicleLock", 0, false];

// start the self destruct procedure
_countdown = 10;
while {_countdown != 0} do {
	format ["Mhq selfdestruct in %1 seconds", _countdown] remoteExecCall ["hint", -2];
	_countdown = _countdown - 1;
	sleep 1;
};

_mhq setDamage 1;
format ["Mhq selfdestructed !"] remoteExecCall ["hint", -2];