[["Calling mhq_undeploy_action with %1", _this]] call F_log;

params ["_mhq", "_actionId"];
private ["_mhq", "_actionId"];

_isDeployed = _mhq getVariable "MhqDeployed";
[["_isDeployed: %1", _isDeployed]] call F_log;

if(_isDeployed) then {

    _mhq setVehicleLock "UNLOCKED";
    _mhq setVariable ["MhqDeployed", false, true];
    _respawnId = _mhq getVariable ["MhqDeployed", 0];
    [west, _respawnId] call BIS_fnc_removeRespawnPosition;

    _mhq removeAction _actionId;
    _mhq addAction ["Deploy",	{
									[[[_this select 0, _this select 2], "custom\modules\SimpleMhqModule\mhqDeployAction.sqf"], "BIS_fnc_execVM", true, true] call BIS_fnc_MP;
								}];
};