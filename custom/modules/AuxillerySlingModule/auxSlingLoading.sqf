// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Aux SlingLoading Script
// Version 1.16
// Date: 2016.02.04
// Authors: Lala14
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

// init line:
// null = [] execVM "auxslingloading.sqf";

/*DEFINABLE*/
if (isNil "AuxSling_Weight") then {
	AuxSling_Weight = "AuxSlingWeight" call BIS_fnc_getParamValue; //Does the sling weight matter? If 0 this means a LittleBird can Lift a tank, If 1 then no
};

if (isNil "AuxSling_slingSlingableVehicles") then {
	AuxSling_slingSlingableVehicles = "AuxCanSlingSlingable" call BIS_fnc_getParamValue; //Include vehicles that can be sling loaded with the chopper. e.g. Huron can lift Offroad, you can use this script if set to 1 to
};

if (isNil "AuxSling_EveryVehicles") then {
	AuxSling_EveryVehicles = "AuxCanSlingEverything" call BIS_fnc_getParamValue; //If AuxSling_Weight = 1, Allow for EVERY VEHICLE/OBJECT to be lifted, ignores AuxSling_x_config
};

if (isNil "AuxSling_indestructibleLoad") then {
	AuxSling_indestructibleLoad = "AuxLoadIndestructable" call BIS_fnc_getParamValue; //If AuxSling_indestructibleLoad = 1, The sling load will become indestructible while being slinged until no longer being slinged
};

if (isNil "AuxSling_allowDeadCarry") then {
	AuxSling_allowDeadCarry = "AuxLoadAllowDeathCarry" call BIS_fnc_getParamValue; //if AuxSling_allowDeadCarry = 1, Allowed to sling dead vehicles
};

if (isNil "AuxSling_kindOfClasses") then {
	AuxSling_kindOfClasses = ["Ship","LandVehicle","Air","thingX"]; //An array that contains all the classnames of possible vehicles that will be detected by this script! note this will not always allow them to be picked up!
};

if (isNil "AuxSling_detectRadius") then {
	AuxSling_detectRadius = 11; //the radius at which vehicles will be detected from the helicopter, note the larger the distance the more fps drop/lag
};

/*Don't touch unless you know what your doing*/
AuxSling_Loaded = false;

if (isDedicated) exitWith {
	if (isNil "AuxSling_globalVar") then {
		AuxSling_globalVar = 'init';
		"AuxSling_globalVar" addPublicVariableEventHandler {
			/*systemChat str (_this select 0);
			systemChat str (_this select 1);
			_array = ((_this select 1) select 0);
			_stuff = ((_this select 1) select 1);
			_isspawn = ((_this select 1) select 2);
			if (isNil "_isspawn") then { _isspawn = false; };
			if (typeName _stuff isEqualTo "STRING") then { _stuff = call compile _stuff; };
			if (_isspawn) then { _array spawn _stuff } else { _array call _stuff };*/
			(_this select 1) call AuxSling_fnc_localGlobalExec;
		};
	};
};

diag_log "AuxSling Loading";

waitUntil {!isNull player};

if (isNil "AuxSling_globalVar") then {
	if (isNil "AuxSling_globalVar") then {
		AuxSling_globalVar = 'init';
		"AuxSling_globalVar" addPublicVariableEventHandler {
			(_this select 1) call AuxSling_fnc_localGlobalExec;
		};
	};
};

// config [["kindOf classnames"] ]]
if (isNil "AuxSling_light_config") then { AuxSling_light_config = [] };
if (isNil "AuxSling_light_Helicopter_config") then { AuxSling_light_Helicopter_config = [] };
if (isNil "AuxSling_medium_config") then { AuxSling_medium_config = [] };
if (isNil "AuxSling_medium_Helicopter_config") then { AuxSling_medium_Helicopter_config = [] };
if (isNil "AuxSling_heavy_config") then { AuxSling_heavy_config = [] };
if (isNil "AuxSling_heavy_Helicopter_config") then { AuxSling_heavy_Helicopter_config = [] };

AuxSling_light_Helicopter_config = AuxSling_light_Helicopter_config + [];
AuxSling_medium_Helicopter_config = AuxSling_light_Helicopter_config + AuxSling_medium_Helicopter_config + [];
AuxSling_heavy_Helicopter_config = AuxSling_medium_Helicopter_config + AuxSling_heavy_Helicopter_config + [];

AuxSling_light_config = AuxSling_light_config + ["Offroad_01_base_F","Hatchback_01_base_F","SUV_01_base_F"]; //lift = 500 e.g. Littlebird
AuxSling_medium_config = AuxSling_light_config + AuxSling_medium_config + ["APC_Wheeled_01_base_F","APC_Wheeled_02_base_F","APC_Wheeled_03_base_F","Cha_LAV25_base", "B_Slingload_01_Cargo_F"]; //lift = 4000 e.g GhostHawk
AuxSling_heavy_config = AuxSling_medium_config + AuxSling_heavy_config + ["APC_Tracked_01_base_F","APC_Tracked_02_base_F","APC_Tracked_03_base_F","MBT_01_base_F","MBT_02_base_F","MBT_03_base_F","Truck_01_base_F","Truck_02_base_F","Truck_03_base_F","Plane_CAS_01_base_F","Plane_CAS_02_base_F","Plane_Fighter_03_base_F"]; //lift = 10000 e.g. Huron

AuxSling_fnc_InList = {
	_found = false;
	_object = objNull;
	_list = "AuxSling_light_config";
	_this params ["_objectsfound",["_vehweight",10000]];

	{
		_obj = _x;

		if (_vehweight >= 0 && !_found) then {
			{
				if (_obj isKindOf _x) exitWith {_found = true; _list = "AuxSling_light_config";};
			}forEach AuxSling_light_config;
		};
		if (_vehweight > 600 && !_found) then {
			{
				if (_obj isKindOf _x) exitWith {_found = true; _list = "AuxSling_medium_config";};
			}forEach AuxSling_medium_config;
		};
		if (_vehweight > 4000 && !_found) then {
			{
				if (_obj isKindOf _x) exitWith {_found = true; _list = "AuxSling_heavy_config";};
			}forEach AuxSling_heavy_config;
		};
		if (_found) exitWith {_object = _x;};
	}forEach _objectsfound;
	if ((AuxSling_Weight == 0) && (AuxSling_EveryVehicles == 1)) then {_object = _objectsfound select 0};
	[_object,_list];
};

AuxSling_fnc_inListv2 = {
	_this params [["_veh",objNull]];
	if (isNull _veh) exitWith { hint 'error occurred when getting weight'; 0};

	_count1 = { _veh isKindOf _x } count AuxSling_light_Helicopter_config;
	if (_count1 > 0) exitWith { 500 };
	_count2 = { _veh isKindOf _x } count AuxSling_medium_Helicopter_config;
	if (_count2 > 0) exitWith { 4000 };
	_count3 = { _veh isKindOf _x } count AuxSling_heavy_Helicopter_config;
	if (_count3 > 0) exitWith { 10000 };
	getNumber (configfile >> "CfgVehicles" >> typeOf _veh >> "slingLoadMaxCargoMass");
};

AuxSling_fnc_DoAttaching = {
	_unit = _this select 0;
	_veh = vehicle _unit;
	_vehweight = ([_veh] call AuxSling_fnc_inListv2);

	if (AuxSling_Weight == 0) then {_vehweight = 10000;};
	if (!isNil {_veh getVariable "AuxSling_AttachedObject"}) exitWith {hint "There is still something attached"};
	_nearUnits = nearestObjects [_veh, AuxSling_kindOfClasses, AuxSling_detectRadius];
	_nearUnits = _nearUnits - [_veh];
	if (count _nearUnits == 0) exitWith {hint "no near vehicles"};
	_obj = objNull;
	_ropecount = [];

	_returnofthedead = [_nearUnits,_vehweight] call AuxSling_fnc_InList;
	_obj = _returnofthedead select 0;
	_list = _returnofthedead select 1;
	if ((isNull _obj) && (AuxSling_EveryVehicles == 0)) exitWith {hint "no valid sling targets"};
	if ((AuxSling_allowDeadCarry == 0) && !(alive _obj)) exitWith {hint "can't carry dead objects"};

	if (count getArray (configfile >> "CfgVehicles" >> typeof _obj >> "slingLoadCargoMemoryPoints") > 0) then {
		_ropecount = getArray (configfile >> "CfgVehicles" >> typeof _obj >> "slingLoadCargoMemoryPoints");
	};

	[_unit, _obj, _ropecount] spawn AuxSling_fnc_TheAttaching;
};

AuxSling_fnc_TheAttaching = {
	_unit = _this select 0;
	_veh = vehicle _unit;
	_obj = _this select 1;
	//_vehweight = getNumber(configfile >> "CfgVehicles" >> typeOf _veh >> "slingLoadMaxCargoMass");
	_vehweight = ([_veh] call AuxSling_fnc_inListv2);

	_obj setVariable ["AuxSling_Original_Weight", getMass _obj, true];
	if ((getMass _obj) > (_vehweight*0.8)) then {
		[_obj, (_vehweight*0.8)] remoteExec ["setMass", 0, false];
	};

	if (AuxSling_indestructibleLoad == 1) then {
		_theowner = owner _obj;
		if ((isMultiplayer) && (_theowner isEqualTo 0) && !(local _obj)) then {
			[[_obj],{(_this select 0) allowDamage false;},true] spawn AuxSling_fnc_execGlobal;
		} else {
			_obj allowDamage false;
		};
	};
	_ropecount = _this select 2;
	_veh setVariable ["AuxSling_AttachedObject",_obj,true];
	_veh setVariable ["AuxSling_Ropes",[],true];
	if (count _ropecount > 0) then {
		{
			_ropename = ropeCreate [_veh, getText (configFile >> 'cfgVehicles' >> typeOf _veh >> "slingLoadMemoryPoint"), _obj, (_obj selectionPosition _x), if (_obj distance _veh <= 10) then { 10 } else { ((_obj distance _veh) + 2) }];
			_veh setVariable ["AuxSling_Ropes",(_veh getVariable "AuxSling_Ropes") + [_ropename],true];
		}forEach _ropecount;
	} else {
		//_ropename = ropeCreate [_veh, getText (configFile >> 'cfgVehicles' >> typeOf _veh >> "slingLoadMemoryPoint"), _obj, [0,0,0], 10];
		_bbxreal = boundingBoxReal _obj select 1;
		for "_i" from 1 to 4 do {
			_xvar = if (_i in [1,4]) then { (_bbxreal select 0) } else { (_bbxreal select 0) * -1 };
			_yvar = if (_i in [1,3]) then { (_bbxreal select 1) } else { (_bbxreal select 1) * -1 };
			if (_obj isKindOf "Air") then {
				switch (_i) do
				{
					case 1 : {_xvar = ((_bbxreal select 0)/2); _yvar = 0;};
					case 2 : {_xvar = 0; _yvar = ((_bbxreal select 1)/2)*-1;};
					case 3 : {_xvar = ((_bbxreal select 0)/2)*-1; _yvar = 0;};
					case 4 : {_xvar = 0; _yvar = ((_bbxreal select 1)/2);};
				};
			};
			_zvar = ((_bbxreal select 2)/2);
			systemChat str([_xvar,_yvar,_zvar]);
			_ropename = ropeCreate [_veh, getText (configFile >> 'cfgVehicles' >> typeOf _veh >> "slingLoadMemoryPoint"), _obj, [_xvar,_yvar,_zvar], if (_obj distance _veh <= 10) then { 10 } else { ((_obj distance _veh) + 2) }];
			_veh setVariable ["AuxSling_Ropes",(_veh getVariable "AuxSling_Ropes") + [_ropename],true];
		};
	};

	_veh enableRopeAttach false;
	[_unit,_obj] spawn AuxSling_fnc_DetectParentDestroyed;
};

AuxSling_fnc_DoDetaching = {
	_unit = _this select 0;
	_veh = vehicle _unit;
	_obj = _this select 1;
	if (isNil "_obj") then { _obj = (_veh getVariable "AuxSling_AttachedObject"); } else { if (!(_obj in (attachedObjects _veh)) && (alive _veh)) then { _obj = nil; }; };
	if (isNil "_obj") exitWith {};
	_attachedropes = _veh getVariable "AuxSling_Ropes";
	_curvel = velocity (_veh getVariable "AuxSling_AttachedObject");
	if (isNil "_curvel") then { _curvel = [0,0,0]; };

	if ((_obj getVariable ["AuxSling_Original_Weight",0]) != getMass _obj) then {
		[_obj, (_obj getVariable ["AuxSling_Original_Weight",0])] remoteExec ["setMass", 0, false];
		_obj setVariable ["AuxSling_Original_Weight",nil,true];
	};

	{
		ropeDestroy _x;
	}forEach _attachedropes;
	_veh setVariable ["AuxSling_Ropes",nil,true];
	_theowner = owner _obj;
	if ((isMultiplayer) && (_theowner isEqualTo 0) && !(local _obj)) then {
		[[_obj],{(_this select 0) allowDamage true;},true] spawn AuxSling_fnc_execGlobal;
	} else {
		_obj allowDamage false;
	};
	(_veh getVariable "AuxSling_AttachedObject") setVelocity _curvel;
	_veh setVariable ["AuxSling_AttachedObject",nil,true];
	_veh enableRopeAttach true;
};

AuxSling_fnc_DetectParentDestroyed = {
	_unit = _this select 0;
	_veh = vehicle _unit;
	_obj = _this select 1;
	waitUntil { if (!alive _veh) then { [_unit,_obj] spawn AuxSling_fnc_DoDetaching; _veh setVariable ["AuxSling_AttachedObject",nil,true]; }; if (!(alive _obj) && (AuxSling_allowDeadCarry == 0)) then { [_unit,_obj] spawn AuxSling_fnc_DoDetaching; _veh setVariable ["AuxSling_AttachedObject",nil,true]; }; (isNull (_veh getVariable ["AuxSling_AttachedObject",objNull])) };
};

AuxSling_fnc_execGlobal = {
	AuxSling_globalVar = _this;
	_this call AuxSling_fnc_localGlobalExec;
	publicVariable "AuxSling_globalVar";
};

AuxSling_fnc_localGlobalExec = {
	private ["_mainarr","_array","_stuff","_isspawn"];
	_mainarr = ['AuxSling_globalVar',AuxSling_globalVar];
	//systemChat str (_mainarr select 0);
	//systemChat str (_mainarr select 1);
	_array = ((_mainarr select 1) select 0);
	_stuff = ((_mainarr select 1) select 1);
	_isspawn = ((_mainarr select 1) select 2);
	if (isNil "_isspawn") then { _isspawn = false; };
	if (typeName _stuff isEqualTo "STRING") then { _stuff = call compile _stuff; };
	if (_isspawn) then { _array spawn _stuff } else { _array call _stuff };
};

AuxSling_fnc_Conditions1 = {
	_unit = _this select 0;
	_veh = _this select 1;

	_nearUnits = nearestObjects [_veh, AuxSling_kindOfClasses, AuxSling_detectRadius];
	_nearUnits = _nearUnits - [_veh];

	_vehweight = getNumber (configfile >> "CfgVehicles" >> typeOf _veh >> "slingLoadMaxCargoMass");
	if (AuxSling_Weight == 0) then {_vehweight = 10000;};
	_returnofthedead = [_nearUnits,_vehweight] call AuxSling_fnc_InList;
	_obj = _returnofthedead select 0;
	_list = _returnofthedead select 1;

	if !(isNull _obj) then {
		_vehname = format ["<t color='#FF0000'>Sling Load %1</t>",getText (configfile >> "CfgVehicles" >> typeOf _obj >> "displayName")];
		_unit setUserActionText [(_unit getVariable "AuxSling_Load_Action"),_vehname];
	} else {
		_unit setUserActionText [(_unit getVariable "AuxSling_Load_Action"),"<t color='#FF0000'>Unable to Sling</t>"];
	};
	_return = (alive _veh) && ((isNil {_veh getVariable "AuxSling_AttachedObject"}) && (count _nearUnits > 0) && ((_veh isKindOf "Helicopter") OR (([_veh] call AuxSling_fnc_inListv2) > 0) OR ((getNumber(configFile >> 'cfgVehicles' >> typeof _veh >> 'slingLoadMaxCargoMass')) > 0)));
	if (AuxSling_slingSlingableVehicles == 0) then { _return = _return && !(_veh canSlingLoad _obj); };
	if ((AuxSling_allowDeadCarry == 0) && (!alive _obj) ) then {
		_unit setUserActionText [(_unit getVariable "AuxSling_Load_Action"),"<t color='#FF0000'>Unable to Sling</t>"];
	};

	if(!(getMass _obj < 20000)) then { _return = false };

	_return;
};


AuxSling_fnc_Conditions2 = {
	_unit = _this select 0;
	_veh = _this select 1;

	_vehname = format ["<t color='#FF0000'>Detach %1</t>",getText (configfile >> "CfgVehicles" >> typeOf (_veh getVariable "AuxSling_AttachedObject") >> "displayName")];
	_unit setUserActionText [AuxSling_unLoad_Action,_vehname];

	_return = (!(isNil {_veh getVariable "AuxSling_AttachedObject"}));

	if (!((_veh getVariable ["AuxSling_AttachedObject","hopefullythiswillneverbefound_lala"]) in (ropeAttachedObjects _veh)) && _return) then { [_unit,_obj] spawn AuxSling_fnc_DoDetaching; };

	_return;
};

AuxSling_fnc_AddAction = {
	_unit = _this select 0;
	if (isNil {_unit getVariable "AuxSling_Added"}) then {
		AuxSling_Load_Action = _unit addAction ["<t color='#FF0000'>Sling Load</t>",{[(_this select 0)] spawn AuxSling_fnc_DoAttaching},"",-99,true,true,"",'[_this,_target] call AuxSling_fnc_Conditions1'];
		_unit setVariable ["AuxSling_Load_Action",AuxSling_Load_Action,true];
		AuxSling_unLoad_Action = _unit addAction ["<t color='#FF0000'>Detach Load</t>",{[(_this select 0)] spawn AuxSling_fnc_DoDetaching},"",-99,false,true,"",'[_this,_target] call AuxSling_fnc_Conditions2'];
		_unit setVariable ["AuxSling_unLoad_Action",AuxSling_unLoad_Action,true];
		_unit setVariable ["AuxSling_Added",true,true];
	};
};

[player] spawn AuxSling_fnc_AddAction;
player addEventHandler ["Respawn",{
	(_this select 0) setVariable ["AuxSling_Added",nil,true];
	[(_this select 0)] spawn AuxSling_fnc_AddAction;
}];

AuxSling_Loaded = true;
diag_log "AuxSling Loaded";
systemChat "Auxiliary Sling Loading: Initialized";