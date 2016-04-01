if(hasInterface) then {
	// init eye debug tool
	call compileFinal preprocessFileLineNumbers "core\client\debug\eyeRespawnScript.sqf";
	["core\client\debug\eyeRespawnScript.sqf"] call CTICLN_fnc_addRespawnScript;
};