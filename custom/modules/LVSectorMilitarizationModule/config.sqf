if(!isDedicated) exitWith {};

_missionDifficulty = missionNamespace getVariable "MISSION_DIFFICULTY";
LV_SKILL_LEVEL = "default";

if(_missionDifficulty > 0 && _missionDifficulty <= 10) {
	LV_MINIMUM_INFANTRY=12;
	LV_VARIABLE_INFANTRY=0;
	LV_MINIMUM_VEHICLES=0;
	LV_VARIABLE_VEHICLES=0;
};

if(_missionDifficulty > 11 && _missionDifficulty <= 32) {
	LV_MINIMUM_INFANTRY=26;
	LV_VARIABLE_INFANTRY=0;
	LV_MINIMUM_VEHICLES=0;
	LV_VARIABLE_VEHICLES=0;
};

if(_missionDifficulty > 33 && _missionDifficulty <= 65) {
	LV_MINIMUM_INFANTRY=36;
	LV_VARIABLE_INFANTRY=0;
	LV_MINIMUM_VEHICLES=0;
	LV_VARIABLE_VEHICLES=0;
};

if(_missionDifficulty > 66 && _missionDifficulty <= 74) {
	LV_MINIMUM_INFANTRY=36;
	LV_VARIABLE_INFANTRY=0;
	LV_MINIMUM_VEHICLES=4;
	LV_VARIABLE_VEHICLES=0;
};

if(_missionDifficulty > 75 && _missionDifficulty <= 100) {
	LV_MINIMUM_INFANTRY=45;
	LV_VARIABLE_INFANTRY=0;
	LV_MINIMUM_VEHICLES=6;
	LV_VARIABLE_VEHICLES=0;
};
