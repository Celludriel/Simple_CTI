//
// Farooq's Revive 1.5
//

//------------------------------------------//
// Parameters - Feel free to edit these
//------------------------------------------//

// Seconds until unconscious unit bleeds out and dies. Set to 0 to disable.
FAR_BleedOut = ["BleedOutTimer", 300] call BIS_fnc_getParamValue;

// Enable teamkill notifications
FAR_EnableDeathMessages = ["EnableDeathMessages", 1] call BIS_fnc_getParamValue;

// If enabled, unconscious units will not be able to use ACRE radio, hear other people or use proximity chat
FAR_MuteACRE = false;

/*
	0 = Only medics can revive
	1 = All units can revive
	2 = Same as 1 but a medikit is required to revive
*/
FAR_ReviveMode = ["ReviveMode", 2] call BIS_fnc_getParamValue;

//------------------------------------------//

call compile preprocessFile "custom\modules\FarReviveModule\FarRevive\FAR_revive_funcs.sqf";
[] spawn compile preprocessFileLineNumbers "custom\modules\FarReviveModule\FarRevive\FAR_revive_camera.sqf";

#define SCRIPT_VERSION "1.5"

FAR_isDragging = false;
FAR_isDragging_EH = [];
FAR_deathMessage = [];
FAR_Debugging = true;

if (isDedicated) exitWith {};

////////////////////////////////////////////////
// Player Initialization
////////////////////////////////////////////////
[] spawn
{
    waitUntil { !isNull player };

	// Public event handlers
	"FAR_isDragging_EH" addPublicVariableEventHandler FAR_public_EH;
	"FAR_deathMessage" addPublicVariableEventHandler FAR_public_EH;

	[] spawn FAR_Player_Init;

	if (FAR_MuteACRE) then
	{
		[] spawn FAR_Mute_ACRE;
	};

	// Event Handlers
	player addEventHandler
	[
		"Respawn",
		{
			[] spawn FAR_Player_Init;
		}
	];
};

FAR_filterArray = {
	params ["_itemArray","_types"];

	{
		_type = _x;
		{
		   if (_x == _type) then {
			   _itemArray = _itemArray - [_x]; 
		   };
		} forEach _itemArray;
	} forEach _types;

	_itemArray
};

FAR_dropBackpack =
{
	params ["_origin"];
    private ["_inventory", "_target", "_items", "_magazines", "_allWeapons"];

    _inventory = [_origin] call CTISRV_fnc_getUnitInventory;

    diag_log format ["_inventory: %1", _inventory];

	_target = "B_Carryall_khk" createVehicle position _origin;

    _items = _inventory select 0;
    _magazines = _inventory select 1;
    _allWeapons = _inventory select 2;
	
	{ if(_x != "") then { _target addItemCargoGlobal [_x, 1]; }; } forEach _items;
	{ if(count _x > 0) then { _target addMagazineCargoGlobal [_x select 0, 1]; }; } forEach _magazines;
	
	{
		if(count _x > 0) then {
			{
				private ["_weapon", "_surpressor", "_laser", "_optic", "_magazine", "_bipod"];
			
				_weapon = _x select 0;
				if(_weapon != "" || _weapon != "Binocular" || _weapon != "hgun_P07_F") then {
					_target addWeaponCargoGlobal [_weapon, 1];	
				};		
				_surpressor = _x select 1;
				if(_surpressor != "") then {
					_target addItemCargoGlobal [_surpressor, 1];	
				};		
				_laser = _x select 2;
				if(_laser != "") then {
					_target addItemCargoGlobal [_laser, 1];	
				};		
				_optic = _x select 3;
				if(_optic != "") then {
					_target addItemCargoGlobal [_optic, 1];	
				};		
				_magazine = _x select 4;
				if(count _magazine > 0) then {
					_target addMagazineCargoGlobal [_magazine select 0, 1];
				};
				_bipod = _x select 5;
				if(_bipod != "") then {
					_target addItemCargoGlobal [_bipod, 1];	
				};		
				
			} forEach _x;
		};		
	} forEach _allWeapons;
};

FAR_Player_Init =
{
	// Cache player's side
	FAR_PlayerSide = side player;

	// Clear event handler before adding it
	player removeAllEventHandlers "HandleDamage";
	player removeAllEventHandlers "Killed";

	player addEventHandler ["HandleDamage", FAR_HandleDamage_EH];
	player addEventHandler
	[
		"Killed",
		{
			_body = _this select 0;
			[_body] call FAR_dropBackpack;

			// Remove dead body of player (for missions with respawn enabled)
			[_body] spawn
			{	
				_body = _this select 0;
				waitUntil { alive player };										
				deleteVehicle _body;
			}
		}
	];

	player setVariable ["FAR_deathScene", 0, true];
	player setVariable ["FAR_isUnconscious", 0, true];
	player setVariable ["FAR_isStabilized", 0, true];
	player setVariable ["FAR_isDragged", 0, true];
	player setVariable ["ace_sys_wounds_uncon", false];
	player setCaptive false;

	FAR_isDragging = false;

	[] spawn FAR_Player_Actions;
};

// Drag & Carry animation fix
[] spawn
{
	while {true} do
	{
		if (animationState player == "acinpknlmstpsraswrfldnon_acinpercmrunsraswrfldnon" || animationState player == "helper_switchtocarryrfl" || animationState player == "AcinPknlMstpSrasWrflDnon") then
		{
			if (FAR_isDragging) then
			{
				player switchMove "AcinPknlMstpSrasWrflDnon";
			}
			else
			{
				player switchMove "amovpknlmstpsraswrfldnon";
			};
		};

		sleep 3;
	}
};

FAR_Mute_ACRE =
{
	waitUntil { time > 0 };

	waitUntil
	{
		if (alive player) then
		{
			// player getVariable ["ace_sys_wounds_uncon", true/false];
			if ((player getVariable["ace_sys_wounds_uncon", false])) then
			{
				private["_saveVolume"];

				_saveVolume = acre_sys_core_globalVolume;

				player setVariable ["acre_sys_core_isDisabled", true, true];

				waitUntil
				{
					acre_sys_core_globalVolume = 0;

					if (!(player getVariable["acre_sys_core_isDisabled", false])) then
					{
						player setVariable ["acre_sys_core_isDisabled", true, true];
						[true] call acre_api_fnc_setSpectator;
					};

					!(player getVariable["ace_sys_wounds_uncon", false]);
				};

				if ((player getVariable["acre_sys_core_isDisabled", false])) then
				{
					player setVariable ["acre_sys_core_isDisabled", false, true];
					[false] call acre_api_fnc_setSpectator;
				};

				acre_sys_core_globalVolume = _saveVolume;
			};
		}
		else
		{
			waitUntil { alive player };
		};

		sleep 0.25;

		false
	};
};

////////////////////////////////////////////////
// [Debugging] Add revive to playable AI units
////////////////////////////////////////////////
if (!FAR_Debugging || isMultiplayer) exitWith {};

{
	if (!isPlayer _x) then
	{
		_x addEventHandler ["HandleDamage", FAR_HandleDamage_EH];
		_x setVariable ["FAR_isUnconscious", 0, true];
		_x setVariable ["FAR_isStabilized", 0, true];
		_x setVariable ["FAR_isDragged", 0, true];
	};
} forEach switchableUnits;