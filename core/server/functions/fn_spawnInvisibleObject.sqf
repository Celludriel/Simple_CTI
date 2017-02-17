if(!isDedicated) exitWith {};

params ["_coord"];
private ["_object"];

_object = createVehicle ["Sign_Arrow_Large_Green_F",_coord,[],0,"can_collide"];
_object enableSimulationGlobal false;
_object hideObjectGlobal true;

_object