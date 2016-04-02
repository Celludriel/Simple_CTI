MGI_fnc_tacIcons = compile preprocessFileLineNumbers "custom\modules\TacticalIconModule\MGI\MGI_Tactical_Icons.sqf";
MGI_Stance = compile preprocessFileLineNumbers "custom\modules\TacticalIconModule\MGI\MGI_stance_coef.sqf";

brit = 0.6;
coef_ratio = (getResolution select 4)/ 1.77778;
coef_uiSpace = 0.55/(getResolution select 5);
coef_zoom = ([0.5,0.5] distance worldToScreen positionCameraToWorld [0,10,10])* (getResolution select 5);
running_eventHandlers = 0;

if (!isDedicated) then {
	waitUntil {!isNull player};

	[] execVM "custom\modules\TacticalIconModule\MGI\MGI_add_actions.sqf";
	player addEventHandler ["Respawn", {_this execVM "custom\modules\TacticalIconModule\MGI\MGI_add_actions.sqf"}];
};