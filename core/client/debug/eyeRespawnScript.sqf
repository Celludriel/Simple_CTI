if(hasInterface) then {
	[["Adding eye actions to player"]] call CTISHR_fnc_ctiLog;
	player addaction ["eyeon", "core\client\debug\eye.sqf"];
	player addaction ["eyeoff", "EYE_run = false;"];
};