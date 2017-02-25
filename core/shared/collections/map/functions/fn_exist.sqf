params ["_map", "_key"];

(_key in (missionNamespace getVariable [format [
    "%1_KEYS",
    _map
], []]))