if(hasInterface) then {
	waitUntil { !isNull player };

	if(DEBUG_ENABLED) then {
		//load all debug tools
		call compileFinal preprocessFileLineNumbers "core\client\debug\initDebugTools.sqf";
	};

	[] execVM "core\client\initArsenal.sqf";

	//add all Respawn handlers to the player
	{
		[["Adding Respawn handler: %1", _x]] call CTISHR_fnc_ctiLog;
  		player addEventhandler ["Respawn", "_this execVM '" + _x + "'"];
	} foreach RESPAWN_SCRIPTS;
};