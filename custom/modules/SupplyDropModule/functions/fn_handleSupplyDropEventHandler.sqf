if(isDedicated) exitWith {};

params[ "_mode", "_crate" ];

switch ( toUpper _mode ) do {	
	case "ADD" : {		
		//Add EH locally to client
		_openedEH = _crate addEventHandler [ "ContainerOpened", {
			params[ "_container", "_unit" ];
			
			//handle opening on server
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
			_crate removeEventHandler [ "ContainerOpened", _EH ];
		};
	};break;
};