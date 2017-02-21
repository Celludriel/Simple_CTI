if(!hasInterface) exitWith {};

_fatigueDisabled = ["FatigueDisabledOption", 0] call BIS_fnc_getParamValue;

[["Fatigue disabled: %1", _fatigueDisabled]] call CTISHR_fnc_ctiLog;

if(_fatigueDisabled == 1) then {
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