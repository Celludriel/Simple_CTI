// randomWeather2 Script
// By Meatball
// v 0.9
//
// Setup Instructions
//
// 1) Copy the randomWeather2.sqf file into your root mission folder.
//
// 2) Set up a call for server and clients in init.sqf:
//		execVM "randomWeather2.sqf";
//
// 3) If you want players to be able to select starting weather conditions, you must
// 	have the following information in your parameters section of your description.ext
/*

class Params
{
        // paramsArray[0]
       class InitialWeatherParam {
          title = "Starting Weather";
          values[] = {0,1,2,3,4};
          texts[] = {"Clear","Overcast","Rain","Fog","Random"};
          default = 4;
       };
 };

*/
// The base weather template information is listed below:

// Weather Types        (#)             [Can Move From/To]      	[Settings: Overcast, Rain/Snow, Fog, WindEW, WindNS]
// Clear                (0)             [0,1,5]                     [0.30,0,0,1,1]
// Overcast             (1)             [0,1,2]                   	[0.50,0,0,2,2]
// Light Rain           (2)             [1,2,3,5]                 	[0.60,0.3,0.05,3,3]
// Medium Rain          (3)             [2,3,4]                     [0.70,0.5,0.05,4,4]
// Rainstorm            (4)             [3]                         [0.80,0.9,0.1,5,5]
// Light Fog            (5)             [0,2,5,6]                   [0.40,0,[0.2,0.01,15],0,0]
// Medium fog           (6)             [5,6,7]                     [0.40,0,[0.4,0.005,30],0,0]
// Dense Fog            (7)             [6]                         [0.40,0,[0.6,0.0025,45],0,0]

// ============
// Begin Script
// ============
private ["_currentWeather","_initialWeatherParam","_weatherTemplates","_weatherUpdateArray","_weatherUpdateForecasts","_nextWeather"];

_justPlayers = allPlayers - entities "HeadlessClient_F";
waitUntil { (count _justPlayers) > 0 };

// Setup Weather Types Array [Weather Name, Possible Weather Forecasts, Weather Settings] - Suggested that they are left as is.
_weatherTemplates = [
        ["Clear",[0,1,0,5,0],[0.30,0,0,1,1]],
        ["Overcast",[0,1,0,2,0],[0.50,0,0,2,2]],
        ["Light Rain",[1,2,1,5,1],[0.60,0.3,0.05,3,3]],
        ["Medium Rain",[2,3,2,4,2],[0.70,0.5,0.05,4,4]],
        ["Rainstorm",[3],[0.80,0.9,0.1,5,5]],
        ["Light Fog",[0,2,0,5,0,6,0],[0.4,0,[0.2,0.01,10],0,0]],
        ["Medium Fog",[5,6,5,7,5],[0.4,0,[0.4,0.005,20],0,0]],
        ["Dense Fog",[6],[0.5,0,[0.4,0.0025,30],0,0]]
	];

// DO NOT EDIT BELOW THIS LINE //

if (isDedicated) then {
	_currentWeather = -1;
    _initialWeatherParam = ["InitialWeatherParam", -1] call BIS_fnc_getParamValue;
    if(_initialWeatherParam < 0) then {
        _currentWeather = floor(random(count(_weatherTemplates)));
	} else {
        diag_log format ["_initialWeatherParam: %1", _initialWeatherParam];
		switch (_initialWeatherParam) do{
			case 0: {_currentWeather = 0;};    										// Clear
            case 1: {_currentWeather = 1;};    										// Overcast
            case 2: {_currentWeather = 2 + (floor (random 3));};  					// Rain
            case 3: {_currentWeather = 5 + (floor (random 3));};  				 	// Fog
            case 4: {_currentWeather = floor(random(count(_weatherTemplates)));};	// Random
            default {_currentWeather = 0;};
        };
	};

	[[_weatherTemplates, _currentWeather], "custom\modules\DynamicWeatherModule\initialWeather.sqf"] remoteExec ["execVM", 0, false];

	// Start recurring weather loop.
    while {true} do {
		// Pick weather template from possible forecasts for next weather update
		sleep 10;
		_weatherUpdateArray = _weatherTemplates select _currentWeather;
		_weatherUpdateForecasts = _weatherUpdateArray select 1;
		_nextWeather = _weatherUpdateForecasts select floor(random(count(_weatherUpdateForecasts)));

		sleep 1190;

		[[_weatherTemplates, _currentWeather, _nextWeather], "custom\modules\DynamicWeatherModule\updateWeather.sqf"] remoteExec ["execVM", 0, false];

		_currentWeather = _nextWeather;
	};
};