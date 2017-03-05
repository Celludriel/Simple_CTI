if(!isDedicated) exitWith {};

params ["_unit"];
private ["_veh"];

[["Removing: %1", _unit]] call CTISHR_fnc_ctiLog;

if(vehicle _unit != _unit)then {
	_veh = vehicle _unit;
	{
    	//getting rid of the frikkin gunners!
		_x assignAsDriver _veh;
		unassignVehicle _x;
		moveOut _x;
		_x setPos [0,0,0];
		deleteVehicle _x;
	} forEach crew _veh;
	deleteVehicle _veh;
}
else {
	deleteVehicle _unit;
};