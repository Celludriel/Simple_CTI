if(hasInterface) then {
	[["Adding eye actions to player"]] call F_log;
	player addaction ["eyeon", "core\client\debug\eye.sqf"];
	player addaction ["eyeoff", "EYE_run = false;"];
};