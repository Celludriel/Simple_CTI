if(!isDedicated) exitWith {};

params ["_mhq"];

private ["_marker", "_respawnId", "_vehType"];

waitUntil { sleep 1; !alive _mhq };

[["I'm killed", []]] call CTISHR_fnc_ctiLog;
_mhq = _this select 0;
_mhq remoteExec ["removeAllActions", 0, true];
_marker = _mhq getVariable "markerName";

_respawnId = _mhq getVariable ["respawnId", nil];
if(!isNil("_respawnId")) then {
	[["_respawnId: %1", _respawnId]] call CTISHR_fnc_ctiLog;
	_respawnId call BIS_fnc_removeRespawnPosition;
	deleteMarker (_marker + "_indicator");
};

_vehType = _mhq getVariable "type";

sleep (["SimpleMhqRespawnTime", 60] call BIS_fnc_getParamValue);
[["Creating %1 at %2", _vehType, _marker]] call CTISHR_fnc_ctiLog;
[_marker, _vehType] call createMhqVehicle;