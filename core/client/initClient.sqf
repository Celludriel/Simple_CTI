if(hasInterface) then {
	waitUntil { !isNull player };

	//load all client core functions
	call compileFinal preprocessFileLineNumbers "core\client\coreFunctions.sqf";

	if(DEBUG_ENABLED) then {
		//load all debug tools
		call compileFinal preprocessFileLineNumbers "core\client\debug\initDebugTools.sqf";
	};

	[] execVM "core\client\initArsenal.sqf";

	//add all Respawn handlers to the player
	{
		[["Adding Respawn handler: %1", _x]] call F_log;
  		player addEventhandler ["Respawn", "_this execVM '" + _x + "'"];
	} foreach RESPAWN_SCRIPTS;
};