// Run mission in debug (default=true)
// DEBUG_ENABLED = false;

if(!isDedicated) exitWith {};

// Radius when a sector gets activated in meters (default=500)
// ACTIVATION_RANGE = 500;

// Radius of a sector in meters (default=300)
// SECTOR_RANGE = 300;

// Seconds it takes for a sector marked as deactivation to go back to neutral (default=60)
SECONDS_TO_DEACTIVATION = 600;

// Script that decides what the requirements are for a sector to be taken over must return a boolean.  Parameters passed to the script: (the invisible sector object)
// SECTOR_CONTROL_RULE_SCRIPT = "core\server\sector\sectorControlRule.sqf";

// Script that decides when the game should end must return a boolean.  Parameters passed to the script: (amount of sectors in OPFOR hands), (amount of sectors in BLUFOR hands), (total amount of sectors)
// GAME_ENDING_RULE_SCRIPT = "core\server\game\gameEndingRule.sqf";