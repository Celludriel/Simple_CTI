if(!isDedicated) exitWith {};

_missionDifficulty = missionNamespace getVariable "MISSION_DIFFICULTY";
LV_SKILL_LEVEL = "default";

_playerCount = count (allPlayers - entities "HeadlessClient_F");

_percentageOffset = 1;
if(_playerCount > 2 && _playerCount <= 4) then {
	_percentageOffset = 1.4;
};

if(_playerCount > 4 && _playerCount <= 6) then {
	_percentageOffset = 1.6;
};

if(_playerCount > 6 && _playerCount <= 8) then {
	_percentageOffset = 1.8;
};

if(_playerCount > 8 && _playerCount <= 10) then {
	_percentageOffset = 2;
};

if(_missionDifficulty >= 0 && _missionDifficulty <= 10) then {
	LV_MINIMUM_INFANTRY = floor (12 * _percentageOffset);
	LV_VARIABLE_INFANTRY = 0;
	LV_MINIMUM_VEHICLES = 0;
	LV_VARIABLE_VEHICLES = 0;
};

if(_missionDifficulty > 11 && _missionDifficulty <= 32) then {
	LV_MINIMUM_INFANTRY = floor (26 * _percentageOffset);
	LV_VARIABLE_INFANTRY = 0;
	LV_MINIMUM_VEHICLES = 0;
	LV_VARIABLE_VEHICLES = 0;
};

if(_missionDifficulty > 33 && _missionDifficulty <= 65) then {
	LV_MINIMUM_INFANTRY = floor (36 * _percentageOffset);
	LV_VARIABLE_INFANTRY = 0;
	LV_MINIMUM_VEHICLES = 0;
	LV_VARIABLE_VEHICLES = 0;
};

if(_missionDifficulty > 66 && _missionDifficulty <= 74) then {
	LV_MINIMUM_INFANTRY = floor (36 * _percentageOffset);
	LV_VARIABLE_INFANTRY = 0;
	LV_MINIMUM_VEHICLES = floor (4 * _percentageOffset);
	LV_VARIABLE_VEHICLES = 0;
};

if(_missionDifficulty > 75 && _missionDifficulty <= 100) then {
	LV_MINIMUM_INFANTRY = floor (45 * _percentageOffset);
	LV_VARIABLE_INFANTRY = 0;
	LV_MINIMUM_VEHICLES = floor (6 * _percentageOffset);
	LV_VARIABLE_VEHICLES = 0;
};