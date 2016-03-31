waitUntil { alive player };

params ["_weatherTemplates", "_currentWeather"];

private["_weatherInitialArray","_weatherCurrentName","_weatherInitialSettings","_weatherInitialOvercast","_weatherInitialRainSnow","_weatherInitialFog","_weatherInitialWindEW","_weatherInitialWindNS"];

_weatherInitialArray 	= _weatherTemplates select _currentWeather;
_weatherCurrentName 	= _weatherInitialArray select 0;
_weatherInitialSettings	= _weatherInitialArray select 2;

_weatherInitialOvercast	= _weatherInitialSettings select 0;
_weatherInitialRainSnow	= _weatherInitialSettings select 1;
_weatherInitialFog 	= _weatherInitialSettings select 2;
_weatherInitialWindEW	= _weatherInitialSettings select 3;
_weatherInitialWindNS	= _weatherInitialSettings select 4;

skipTime -24;
86400 setOvercast _weatherInitialOvercast;
0 setRain _weatherInitialRainSnow;
86400 setFog _weatherInitialFog;
setWind [_weatherInitialWindEW,_weatherInitialWindNS,true];
skipTime 24;
sleep 1;
simulWeatherSync;

if (DEBUG_ENABLED) then {
	hint format ["Debug Initialized Weather - %1\nOvercast: %2\nRain/Snow: %3\nFog: %4\nWind EW|NS: %5|%6",_weatherCurrentName,_weatherInitialOvercast,_weatherInitialRainSnow,_weatherInitialFog,_weatherInitialWindEW,_weatherInitialWindNS];
};