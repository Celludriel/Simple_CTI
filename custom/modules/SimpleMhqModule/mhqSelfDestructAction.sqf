[["Calling mhq_selfdestruct_action with %1", _this]] call CTISHR_fnc_ctiLog;

params ["_mhq", "_caller", "_actionId", "_arguments"];
private ["_isDeployed", "_handle", "_countdown"];

_isDeployed = _mhq getVariable "MhqDeployed";

if (_isDeployed) then {
	_handle = [] execVM "custom\modules\SimpleMhqModule\mhqUndeployAction.sqf";
	waitUntil { isNull _handle };
};

_mhq remoteExec ["removeAllActions", 0, true];
_countdown = 10;
while {_countdown < 10} do {
	format ["Mhq selfdestruct in %1 seconds", _countdown] remoteExecCall ["hint", -2];
	_countdown = _countdown - 1;
	sleep 1;
};

_mhq setDamage 1;