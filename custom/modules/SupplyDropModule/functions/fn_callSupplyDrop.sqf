/*
	Author: HallyG
	Spawns a supply drop of desired object.

	Arguments(s):
	0: Supply Drop Object (classname) to spawn - <STRING>
	1: Supply Drop Centre - <MARKER, OBJECT, LOCATION, GROUP, TASK, POSITION>
	2: Supply Drop Height - <SCALAR>
	3: Supply Drop attachTo Position - <ARRAY>
	4: Processing to be done after drop - <FUNCTION>

	Return Value:
	<OBJECT>

	Example:
	[
		"CargoNet_01_box_F",
		position player,
		100,
		[0,0,-1.2],
		{}
	] call FUNCTIONNAME
__________________________________________________________________*/
params [
	["_objectType", "CargoNet_01_box_F", [""]],
	["_centre", [0, 0, 0], ["", objNull, taskNull, locationNull, [], grpNull], [3]],
	["_height", 100, [0]],
	["_attachTo", [0, 0, -1.2], [[]], [3]],
	["_postDropProcessing", {}]
];

[["Calling supply drop with %1, %2, %3, %4", _objectType, _centre, _height, _attachTo]] call CTISHR_fnc_ctiLog;

_centre = _centre call {
	if (_this isEqualType objNull) exitWith {getPosASL _this};
	if (_this isEqualType grpNull) exitWith {getPosASL (leader _this)};
	if (_this isEqualType "") exitWith {getMarkerPos _this};
	if (_this isEqualType locationNull) exitWith {locationPosition _this};
	if (_this isEqualType taskNull) exitWith {taskDestination  _this};
	if (_this isEqualType []) exitWith {_this};
	[0, 0, 0]
};

if (!(isClass (configfile >> "cfgVehicles" >> _objectType)) || _centre isEqualTo [0, 0, 0]) exitWith {
	objNull
};

_supplyDropStart = _centre vectorAdd [0, 0, _height];

[["Supply drop dropping from %1", _supplyDropStart]] call CTISHR_fnc_ctiLog;

_obj = createVehicle [_objectType, _supplyDropStart, [], 0, "NONE"];
_para = createVehicle ["B_parachute_02_F", [0,0,0], [], 0, "FLY"];

_para setDir getDir _obj;
_para setPos getPos _obj;
_obj lock false;
_obj attachTo [_para, _attachTo];

[_obj, _para, _postDropProcessing] spawn {
	params ["_obj", "_para", "_postDropProcessing"];

	waitUntil {
		sleep 0.01;
		((position _obj) select 2) < 2
		||
		isNull _para
		||
		(count (lineIntersectsWith [getPosASL _obj, (getPosASL _obj) vectorAdd [0, 0, -0.5], _obj, _para])) > 0
	};

	_para disableCollisionWith _obj;
	_obj setVectorUp [0,0,1];
	_obj setVelocity [0,0,0];
	detach _obj;

	if (!isNull _para) then {deleteVehicle _para};

	(format ["A supply drop has touched down, grid %1.", mapGridPosition getPosATL _obj]) remoteExec ["systemChat", 0, false];
	[_obj] call _postDropProcessing;
};

_obj