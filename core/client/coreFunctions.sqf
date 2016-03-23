if(hasInterface) then {
	[["Loading client core functions"]] call F_log;

	//extention scripts
	F_addRespawnScript = compileFinal preprocessFileLineNumbers "core\client\functions\F_addRespawnScript.sqf";

	[["Loaded client core functions"]] call F_log;
};
