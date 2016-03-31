if(!hasInterface) exitWith {};

_fatigueDisabled = ["FatigueDisabledOption", false] call BIS_fnc_getParamValue;

diag_log format ["Fatigue disabled: %1", _fatigueDisabled];

if(_fatigueDisabled == 1) then {
	waitUntil { alive player };

	player enableFatigue false;
	player enableStamina false;
	player setCustomAimCoef 0.25;

	player addEventHandler ["Respawn",
		{
			player enableFatigue false;
			player enableStamina false;
			player setCustomAimCoef 0.25;
		}
	];
};