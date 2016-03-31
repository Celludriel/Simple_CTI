waitUntil { alive player };

params ["_weatherTemplates", "_currentWeather", "_nextWeather"];

private ["_weatherCurrentArray","_weatherCurrentName","_weatherNextArray","_weatherNextSettings","_weatherNextOvercast","_weatherNextRainSnow","_weatherNextFog","_weatherNextWindEW","_weatherNextWindNS"];

_weatherCurrentArray 	= _weatherTemplates select _currentWeather;
_weatherCurrentName 	= _weatherCurrentArray select 0;
_weatherNextArray 		= _weatherTemplates select _nextWeather;
_weatherNextName 		= _weatherNextArray select 0;
_weatherNextSettings 	= _weatherNextArray select 2;

_weatherNextOvercast 	= _weatherNextSettings select 0;
_weatherNextRainSnow 	= _weatherNextSettings select 1;
_weatherNextFog 		= _weatherNextSettings select 2;
_weatherNextWindEW 		= _weatherNextSettings select 3;
_weatherNextWindNS 		= _weatherNextSettings select 4;

if (overcast < _weatherNextOvercast) then {
	0 setOvercast 1;
} else {
	0 setOvercast 0;
};

1200 setRain _weatherNextRainSnow;
1200 setFog _weatherNextFog;
setWind [_weatherNextWindEW,_weatherNextWindNS,true];

if (DEBUG_ENABLED) then {
	hint format ["Debug Updating Weather - %1\nOvercast: %2\nRain/Snow: %3\nFog: %4\nWind EW/NS: %5|%6",_weatherNextName,_weatherNextOvercast,_weatherNextRainSnow,_weatherNextFog,_weatherNextWindEW,_weatherNextWindNS];
};