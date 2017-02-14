if(isDedicated) exitWith {};

params[ "_mode", "_crate" ];

switch ( toUpper _mode ) do {	
	case "ADD" : {
		[["Adding eventhandler for %1", _crate]] call CTISHR_fnc_ctiLog;
		//Add EH locally to client
		_openedEH = _crate addEventHandler [ "ContainerOpened", {
			params[ "_container", "_unit" ];
			
			//handle opening on server
			[["%1 opened", _container]] call CTISHR_fnc_ctiLog;
			[ _container ] remoteExec [ "SD_fnc_supplyDropOpened", 2 ];				
		}];
		
		//Store local EH handle on the container
		_crate setVariable[ "supplyDropOpenedEH", _openedEH ];
	};break;
	
	case "REM" : {		
		//Get local EH handle
		_EH = _crate getVariable "supplyDropOpenedEH";
		if !( isNil "_EH" ) then {
			//Remove the local EH
			[["Removing %1 from %2", _EH, _crate]] call CTISHR_fnc_ctiLog;
			_crate removeEventHandler [ "ContainerOpened", _EH ];
		};
	};break;
};