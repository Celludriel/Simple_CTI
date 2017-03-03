if(!isDedicated) exitWith {};

params [["_spawnContainer", [], [[]]], ["_taskArray", [], [[]]], ["_options", [], [[]]]];
private ["_spawnPos", "_groupSide", "_vehicleArray", "_infGroup", 
			"_formation", "_behaviour"];

_spawnPos = _spawnContainer param [0, [], [[]]];
_vehicleArray = _spawnContainer param [1, [], [[]]];
_groupSide = _spawnContainer param [2, east];
_markerArray = _spawnContainer param [3, [], [[]]];

_task = _taskArray param [0, "NO_TASK", [""]];

_infGroup = _options param [0, true];
_teleport = _options param [1, true];

_group = nil;
switch ( _task ) do
{
	case "ATTACK":
	{
		private _attackMarker = _taskArray param [ 1, "NO-POS-GIVEN", [""]];
		if ( _attackMarker == "NO-POS-GIVEN" ) exitWith { [ "No attack marker given for attack task" ] call T8U_fnc_BroadcastHint; false };

		_group = [ _spawnPos , _groupSide, _vehicleArray ] call BIS_fnc_spawnGroup;
		[ _group, _attackMarker, _infGroup ] spawn T8U_tsk_fnc_Attack;
	};

	case "DEFEND":
	{
		private _defendMarker = _taskArray param [ 1, "NO-POS-GIVEN", [""]];
		if ( _defendMarker == "NO-POS-GIVEN" ) exitWith { [ "No defend marker given for defend task" ] call T8U_fnc_BroadcastHint; false };

		_group = [ _spawnPos , _groupSide, _vehicleArray ] call BIS_fnc_spawnGroup;
		[ _group, _defendMarker ] spawn T8U_tsk_fnc_defend;
	};

	case "DEFEND_BASE":
	{
		private _defendMarker = _taskArray param [ 1, "NO-POS-GIVEN", [""]];
		if ( _defendMarker == "NO-POS-GIVEN" ) exitWith { [ "No defend marker given for defend base task" ] call T8U_fnc_BroadcastHint; false };

		_group = [ _spawnPos , _groupSide, _vehicleArray ] call BIS_fnc_spawnGroup;
		[ _group, _defendMarker ] spawn T8U_tsk_fnc_defendBase;
	};

	case "GARRISON":
	{
		private _garrisonMarker = _taskArray param [ 1, "NO-POS-GIVEN", [""]];
		if ( _garrisonMarker == "NO-POS-GIVEN" ) exitWith { [ "No garrison marker given for garrison task" ] call T8U_fnc_BroadcastHint; false };
	
		_group = [ _spawnPos , _groupSide, _vehicleArray ] call BIS_fnc_spawnGroup;
		[ _group, _garrisonMarker ] spawn T8U_tsk_fnc_garrison;
	};

	case "LOITER":
	{
		private _loiterMarker = _taskArray param [ 1, "NO-POS-GIVEN", [""]];
		if ( _loiterMarker == "NO-POS-GIVEN" ) exitWith { [ "No loiter marker given for loiter task" ] call T8U_fnc_BroadcastHint; false };

		_group = [ _spawnPos , _groupSide, _vehicleArray ] call BIS_fnc_spawnGroup;
		[ _group, _loiterMarker ] spawn T8U_tsk_fnc_loiter;
	};

	case "OCCUPY":
	{
		private _occupyMarker = _taskArray param [ 1, "NO-POS-GIVEN", [""]];
		if ( _occupyMarker == "NO-POS-GIVEN" ) exitWith { [ "No occupy marker given for occupy task" ] call T8U_fnc_BroadcastHint; false };

		_group = [ _spawnPos , _groupSide, _vehicleArray ] call BIS_fnc_spawnGroup;
		private _immobile = _taskArray param [ 2, false, [true]];
		[ _group, _occupyMarker, _immobile ] spawn T8U_tsk_fnc_occupy;
	};

	case "OVERWATCH":
	{
		_overwatchMarker	= _taskArray param [ 1, "NO-POS-GIVEN", [""]];
		_overwatchMinDist	= _taskArray param [ 2, 250, [ 123 ]];
		_overwatchRange		= _taskArray param [ 3, 200, [ 123 ]];
		if ( _overwatchMarker == "NO-POS-GIVEN" ) exitWith { _[ "No overwatch marker given for overwatch task" ] call T8U_fnc_BroadcastHint; false };

		_group = [ _spawnPos , _groupSide, _vehicleArray ] call BIS_fnc_spawnGroup;
		[ _group, _overwatchMarker, _overwatchMinDist, _overwatchRange, _infGroup ] spawn T8U_tsk_fnc_overwatch;
	};

	case "PATROL":
	{
		_formation = _taskArray param [ 1, "RANDOM", [""]];
		_behaviour = _taskArray param [ 2, "SAFE", [""]];
		_group = [ _spawnPos, _groupSide, _vehicleArray ] call BIS_fnc_spawnGroup;
		_group setVariable ["NEWLY_CREATED", true];
		[ _group, _markerArray, _infGroup, _teleport, _formation, _behaviour ] spawn T8U_tsk_fnc_patrol;
	};

	case "PATROL_AROUND":
	{
		_PatrolAroundDis	= _taskArray param [ 1, T8U_var_PatAroundRange, [123]];
		_startAngle			= _taskArray param [ 2, 0, [123]];
		_formation			= _taskArray param [ 3, "RANDOM", [""]];
		_behaviour			= _taskArray param [ 4, "SAFE", [""]];
		_group = [ _spawnPos, _groupSide, _vehicleArray ] call BIS_fnc_spawnGroup;
		_group setVariable ["NEWLY_CREATED", true];
		[ _group, _markerArray, _infGroup, _teleport, _PatrolAroundDis, _startAngle, _formation, _behaviour ] spawn T8U_tsk_fnc_patrolAround;
	};

	case "PATROL_GARRISON":
	{
		// Force _infGroup = false !!!
		// _commArray = [ ( _commArray select 0 ), false ];
		_formation = _taskArray param [ 1, "RANDOM", [""]];
		_behaviour = _taskArray param [ 2, "SAFE", [""]];
		_patrolGarrisonMarker = _taskArray param [ 3, "NO-POS-GIVEN", [""]];
		
		if ( _patrolGarrisonMarker == "NO-POS-GIVEN" ) exitWith { [ "No patrol garrison marker given for patrol garrison task" ] call T8U_fnc_BroadcastHint; false };		
		
		_group = [ _spawnPos, _groupSide, _vehicleArray ] call BIS_fnc_spawnGroup;
		_group setVariable ["NEWLY_CREATED", true];
		[ _group, _posMkr, _infGroup, _teleport, _formation, _behaviour ] spawn T8U_tsk_fnc_patrolGarrison;
	};

	case "PATROL_MARKER":
	{
		_PatrolMarkerArray = _taskArray param [ 1, [], [[]]];
		_PatrolMarkerDoSAD = _taskArray param [ 2, true, [true]];
		_formation = _taskArray param [ 3, "RANDOM", [""]];
		_behaviour = _taskArray param [ 4, "SAFE", [""]];
		_group = [ _spawnPos, _groupSide, _vehicleArray ] call BIS_fnc_spawnGroup;
		_group setVariable ["NEWLY_CREATED", true];
		[ _group, _PatrolMarkerArray, _infGroup, _teleport, _PatrolMarkerDoSAD, _formation, _behaviour ] spawn T8U_tsk_fnc_patrolMarker;
	};

	case "PATROL_URBAN":
	{
		_formation = _taskArray param [ 1, "RANDOM", [""]];
		_behaviour = _taskArray param [ 2, "SAFE", [""]];
		_group = [ _spawnPos, _groupSide, _vehicleArray ] call BIS_fnc_spawnGroup;
		_group setVariable ["NEWLY_CREATED", true];
		[ _group, _markerArray, _infGroup, _teleport, _formation, _behaviour ] spawn T8U_tsk_fnc_patrolUrban;
	};


	default
	{
		private _msg = format [ "The task %1 does not exist!", _type ]; [ _msg ] call T8U_fnc_BroadcastHint;
		
		if( true ) exitWith { false };
	};
};

_group