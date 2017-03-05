/*
 =======================================================================================================================

	T8 Units Script

	Funktion:	fn_spawn.sqf
	Author:		T-800a
	E-Mail:		t-800a@gmx.net

 =======================================================================================================================
*/

#include <..\..\..\..\core\server\ai\T8\MACRO.hpp>
__allowEXEC(__FILE__);

private _MasterArray	= _this select 0;
private _posMkrArray	= []; // All Markers for Debug
private _error			= false;
private _return			= [];
private _cfg			= call T8U_fnc_selectConfigFile;

if ( isNull _cfg ) exitWith { [ "WARNING!<br /><br />You are missing a configfile.<br /><br />Please check your description.ext maybe you did not included the T8 Units config." ] call T8U_fnc_BroadcastHint; _return };
if ( isNil "_MasterArray" ) exitWith { __DEBUG( __FILE__, "NO SPAWNING", "_masterArray IS NIL!"); false };
if ( typeName _MasterArray == "BOOL" ) exitWith	{ __DEBUG( __FILE__, "NO SPAWNING", "EVERYBODY WAS ALREADY KILLED"); false };
if ( typeName _MasterArray != "ARRAY" OR { !( count _MasterArray > 0 ) } ) exitWith { [ "Something went seriously wrong! Aborting T8U_fnc_Spawn!" ] call T8U_fnc_BroadcastHint; false };


// -> ForEach _MasterArray
{
	private [ "_group", "_vehicleArray", "_posMkr", "_type", "_cachePos", "_markerArray", "_PatrolAroundDis", "_newStyleArray", "_spawnPos", "_startAngle", "_formation", "_behaviour" ];

	private _abort				= false; // for error findings
	private _PatrolMarkerArray	= false;
	private _PatrolMarkerDoSAD	= false;
	private _attackMarker		= "NO-POS-GIVEN";
	private _overwatchMarker	= "NO-POS-GIVEN";
	private _overwatchMinDist	= 50;
	private _overwatchRange		= 50;
	private _infGroup			= true;
	private _groupSide			= T8U_var_EnemySide;
	private _customFNC			= "NO-FUNC-GIVEN";
	private _relPos				= [];
	private _ovPresets			= false;
	private _ovSkillSets		= [];
	private _ovBehaviorSets		= [];
	private _teleport			= false;

	// get basic group setup
	private _groupArray			= _x param [ 0, [], [[]]];
	private _taskArray			= _x param [ 1, [], [[]]];
	private _cAM				= _x param [ 2, [], [[]]];
	private _sAM				= _x param [ 3, [], [[],"",true]];
	private _cachePos			= _x param [ 4, [], [[],""]];
	
	// get basic vehicle and marker setup
	private _vehicleArray		= _groupArray param [ 0, [], [[],configFile,""]];
	private _markerArray		= _groupArray param [ 1, false, ["",[]]];
	
	// parse marker setup
	switch ( typeName _markerArray ) do
	{
		case "ARRAY":	{ _posMkr = _markerArray call BIS_fnc_selectRandom; };
		case "STRING":	{ _posMkr = _markerArray; };
		default			{ _posMkr = "NO-POS-GIVEN"; };
	};

	_posMkrArray pushBack _posMkr;

	// parse additional group settings
	if ( count _groupArray > 2 ) then
	{
		switch ( typeName ( _groupArray select 2) ) do
		{
			case "BOOL":	{ _infGroup		= _groupArray param [ 2, true, [true]]; };
			case "SIDE":	{ _groupSide	= _groupArray param [ 2, T8U_var_EnemySide ]; };
			case "STRING":	{ _customFNC	= _groupArray param [ 2, "NO-FUNC-GIVEN", [""]]; };
			default { _type = "NO-TASK-GIVEN"; };
		};
	};

	if ( count _groupArray > 3 ) then
	{
		switch ( typeName ( _groupArray select 3) ) do
		{
			case "BOOL":	{ _infGroup		= _groupArray param [ 3, true, [true]]; };
			case "SIDE":	{ _groupSide	= _groupArray param [ 3, T8U_var_EnemySide ]; };
			case "STRING":	{ _customFNC	= _groupArray param [ 3, "NO-FUNC-GIVEN", [""]]; };
			default { _type = "NO-TASK-GIVEN"; };
		};
	};

	if ( count _groupArray > 4 ) then
	{
		switch ( typeName ( _groupArray select 4) ) do
		{
			case "BOOL":	{ _infGroup		= _groupArray param [ 4, true, [true]]; };
			case "SIDE":	{ _groupSide	= _groupArray param [ 4, T8U_var_EnemySide ]; };
			case "STRING":	{ _customFNC	= _groupArray param [ 4, "NO-FUNC-GIVEN", [""]]; };
			default { _type = "NO-TASK-GIVEN"; };
		};
	};
	
	// check if _vehicleArray should be loaded from T8U configFile / missionConfigFile
	if ( typeName _vehicleArray isEqualTo "STRING" ) then 
	{
		_vehicleArray = __CFGARRAY( _cfg >> "groupCompilations" >> T8U_var_modSet >> toLower ( str ( _groupSide )) >> _vehicleArray, [] );
	};


	// get task type setting
	private _type				= _taskArray param [ 0, "NO-TASK-GIVEN", [""]];

	// get communication setting
	private _cA0				= _cAM param [ 0, true, [true]];
	private _cA1				= _cAM param [ 1, true, [true]];
	private _cA2				= _cAM param [ 2, true, [true]];
	private _commArray			= [ _cA0, _cA1, _cA2 ];

	// get additional settings
	// parse from config
	
	if ( _sAM isEqualType true ) then { _teleport = _sAM; };
	if ( _sAM isEqualType [] ) then { _teleport = _sAM param [ 0, false, [false]]; };
	
	if ( _sAM isEqualType "" AND { isClass ( _cfg >> "groupSettings" >> _sAM )}) then
	{
		_ovPresets				= true;
		private _skill			= [];
		private _configSkill	= "true" configClasses ( _cfg >> "groupSettings" >> _sAM >> "behaviorAndSkills" >> "skills" );
		
		{
			_skill pushback [ configName _x, ( getNumber ( _x >> "value" ))];
			false
		} count _configSkill;
			
		_ovSkillSets	= [ _skill ];
		_ovBehaviorSets = [( getArray ( _cfg >> "groupSettings" >> _sAM >>  "behaviorAndSkills" >> "behaivior" ))];

		_teleport = switch ( getNumber ( _cfg >> "groupSettings" >> _sAM >> "teleport" )) do
		{
			case 1 :	{ false };
			case 2 :	{ true };
			default		{ false };
		};

	};
	

	// check for errors!
	if (
			(( _vehicleArray isEqualType [] ) AND { count _vehicleArray < 1 })
		OR	(( typeName _vehicleArray isEqualTo "CONFIG" ) AND { isNull _vehicleArray })
		OR	{ _posMkr isEqualTo "NO-POS-GIVEN" }
		OR	{ _type isEqualTo "NO-TASK-GIVEN" }
		OR	{ ( getMarkerPos _posMkr ) isEqualTo [0,0,0] }) exitWith
	{
		[( format [ "Something went seriously wrong! Error in Unit's spawning definition!<br /><br />Marker: %1<br />Task: %2", _posMkr, _type ])] call T8U_fnc_BroadcastHint;
		_error = true;
	};


	if (( typeName _vehicleArray ) isEqualTo "ARRAY" AND {!( count _vehicleArray > 0 )}) exitWith
	{
		[( format [ "Something went seriously wrong! Error in Unit's spawning definition!<br /><br />Marker: %1<br />Task: %2", _posMkr, _type ])] call T8U_fnc_BroadcastHint;
		_error = true;
	};


	// get our spawn pos
	if (( typeName _cachePos ) isEqualTo ( typeName "STR" )) then { _cachePos = getMarkerPos _cachePos; };
	if ( _cachePos isEqualTo [0,0,0]) then { _cachePos = _posMkr; };
	if ( count _cachePos > 1 ) then
	{
		_spawnPos = [ _cachePos ] call T8U_fnc_createSpawnPos;
	} else {
		_spawnPos = [ _posMkr ] call T8U_fnc_createSpawnPos;
	};

	// create some relative spawn positions for vehicle type stuff
	if (( typeName _vehicleArray ) isEqualTo "ARRAY" ) then
	{
		if !( _infGroup ) then
		{
			private [ "_tempRelPos" ];
			_tempRelPos = [ [0,0], [0,9], [0,-9], [9,0], [9,9], [9,-9], [-9,0], [-9,9], [-9,-9], [18,0], [18,9], [18,-9], [-18,0], [-18,9], [-18,-9], [0,18], [9,18], [-9,18], [0,-18], [9,-18], [-9,-18], [18,18], [18,-18], [-18,18], [-18,-18] ];

			{
				if (( count _tempRelPos  ) > 0 ) then
				{
					private [ "_p" ];
					_p = [ _tempRelPos ] call BIS_fnc_arrayShift;
					_relPos pushBack _p;
				} else {
					_relPos pushBack [0,4];
				};

				false
			} count _vehicleArray;

			// if ( count _vehicleArray < 2 ) then { _tempRelPos = []; };
		};
	};

// ------------------ TASK SWITCH --- UNITS WILL BE SPAWNED NOW --------------------------------------------------------------

	switch ( _type ) do
	{
		case "ATTACK":
		{
			_attackMarker = _taskArray param [ 1, "NO-POS-GIVEN", [""]];
			if ( _attackMarker == "NO-POS-GIVEN" ) then { _attackMarker = _posMkr; };

			_group = [ _spawnPos , _groupSide, _vehicleArray, _relPos ] call BIS_fnc_spawnGroup;
			[ _group, _attackMarker, _infGroup ] spawn T8U_tsk_fnc_Attack;
		};

		case "DEFEND":
		{
			_group = [ _spawnPos , _groupSide, _vehicleArray, _relPos ] call BIS_fnc_spawnGroup;
			[ _group, _posMkr ] spawn T8U_tsk_fnc_defend;
		};

		case "DEFEND_BASE":
		{
			_group = [ _spawnPos , _groupSide, _vehicleArray, _relPos ] call BIS_fnc_spawnGroup;
			[ _group, _posMkr ] spawn T8U_tsk_fnc_defendBase;
		};

		case "GARRISON":
		{
			_group = [ _spawnPos , _groupSide, _vehicleArray, _relPos ] call BIS_fnc_spawnGroup;
			[ _group, _posMkr ] spawn T8U_tsk_fnc_garrison;
		};

		case "LOITER":
		{
			_group = [ _spawnPos , _groupSide, _vehicleArray, _relPos ] call BIS_fnc_spawnGroup;
			[ _group, _posMkr ] spawn T8U_tsk_fnc_loiter;
		};

		case "OCCUPY":
		{
			_group = [ _spawnPos , _groupSide, _vehicleArray, _relPos ] call BIS_fnc_spawnGroup;
			private _immobile = _taskArray param [ 1, false, [true]];
			[ _group, _posMkr, _immobile ] spawn T8U_tsk_fnc_occupy;
		};

		case "OVERWATCH":
		{
			_overwatchMarker	= _taskArray param [ 1, "NO-POS-GIVEN", [""]];
			_overwatchMinDist	= _taskArray param [ 2, 250, [ 123 ]];
			_overwatchRange		= _taskArray param [ 3, 200, [ 123 ]];
			if ( _overwatchMarker == "NO-POS-GIVEN" ) then { _overwatchMarker = _posMkr; };

			_group = [ _spawnPos , _groupSide, _vehicleArray, _relPos ] call BIS_fnc_spawnGroup;
			[ _group, _overwatchMarker, _overwatchMinDist, _overwatchRange, _infGroup ] spawn T8U_tsk_fnc_overwatch;
		};

		case "PATROL":
		{
			_formation = _taskArray param [ 1, "RANDOM", [""]];
			_behaviour = _taskArray param [ 2, "SAFE", [""]];
			_group = [ _spawnPos, _groupSide, _vehicleArray, _relPos ] call BIS_fnc_spawnGroup;
			_group setVariable ["NEWLY_CREATED", true];
			[ _group, _markerArray, _infGroup, _teleport, _formation, _behaviour ] spawn T8U_tsk_fnc_patrol;
		};

		case "PATROL_AROUND":
		{
			_PatrolAroundDis	= _taskArray param [ 1, T8U_var_PatAroundRange, [123]];
			_startAngle			= _taskArray param [ 2, 0, [123]];
			_formation			= _taskArray param [ 3, "RANDOM", [""]];
			_behaviour			= _taskArray param [ 4, "SAFE", [""]];
			_group = [ _spawnPos, _groupSide, _vehicleArray, _relPos ] call BIS_fnc_spawnGroup;
			_group setVariable ["NEWLY_CREATED", true];
			[ _group, _markerArray, _infGroup, _teleport, _PatrolAroundDis, _startAngle, _formation, _behaviour ] spawn T8U_tsk_fnc_patrolAround;
		};

		case "PATROL_GARRISON":
		{
			// Force _infGroup = false !!!
			// _commArray = [ ( _commArray select 0 ), false ];
			_formation = _taskArray param [ 1, "RANDOM", [""]];
			_behaviour = _taskArray param [ 2, "SAFE", [""]];
			_group = [ _spawnPos, _groupSide, _vehicleArray, _relPos ] call BIS_fnc_spawnGroup;
			_group setVariable ["NEWLY_CREATED", true];
			[ _group, _posMkr, _infGroup, _teleport, _formation, _behaviour ] spawn T8U_tsk_fnc_patrolGarrison;
		};

		case "PATROL_MARKER":
		{
			_PatrolMarkerArray = _taskArray param [ 1, [], [[]]];
			_PatrolMarkerDoSAD = _taskArray param [ 2, true, [true]];
			_formation = _taskArray param [ 3, "RANDOM", [""]];
			_behaviour = _taskArray param [ 4, "SAFE", [""]];
			_group = [ _spawnPos, _groupSide, _vehicleArray, _relPos ] call BIS_fnc_spawnGroup;
			_group setVariable ["NEWLY_CREATED", true];
			[ _group, _PatrolMarkerArray, _infGroup, _teleport, _PatrolMarkerDoSAD, _formation, _behaviour ] spawn T8U_tsk_fnc_patrolMarker;
		};

		case "PATROL_URBAN":
		{
			_formation = _taskArray param [ 1, "RANDOM", [""]];
			_behaviour = _taskArray param [ 2, "SAFE", [""]];
			_group = [ _spawnPos, _groupSide, _vehicleArray, _relPos ] call BIS_fnc_spawnGroup;
			_group setVariable ["NEWLY_CREATED", true];
			[ _group, _markerArray, _infGroup, _teleport, _formation, _behaviour ] spawn T8U_tsk_fnc_patrolUrban;
		};


		default
		{
			private _msg = format [ "The task %1 does not exist! WTF?!<br /><br /> Call 0800 - T800A#WTFH for help. Not!", _type ]; [ _msg ] call T8U_fnc_BroadcastHint;
			_error = true;
		};
	};

	// no hurry ...
	sleep 1;

} forEach _MasterArray;

if ( _error ) exitWith { false };

if ( T8U_var_DEBUG_hints ) then { private _msg = format [ "Your Units at %1 are spawned", _posMkrArray ]; [ _msg ] call T8U_fnc_BroadcastHint; };

// return created units
_return