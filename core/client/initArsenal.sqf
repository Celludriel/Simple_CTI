waitUntil { alive player };

player addMPEventhandler ["MPRespawn", {
						[["loading inventory"]] call F_log;
						[player, [missionnamespace, "CurrentLoadout"]] call bis_fnc_loadInventory;
					}];

_thread = [] spawn {
						while {true} do {
							sleep 1;
							// [["BIS_fnc_arsenal_cam: %1", uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull]]] call F_log;
							if(!(isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])) && !(player getVariable ["arsenalCamActive", false])) then {
								[["Setting arsenalCamActive to true"]] call F_log;
								player setVariable ["arsenalCamActive", true];
				       			_thread = [] spawn {
					            		waitUntil { isNull ( uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ] ) && player getVariable ["arsenalCamActive", false] };

										[["Saving inventory"]] call F_log;
					            		[player, [missionnamespace, "CurrentLoadout"]] call bis_fnc_saveInventory;
										[["Setting arsenalCamActive to false"]] call F_log;
					            		player setVariable ["arsenalCamActive", false];
				        			};
							};
						};
        			};