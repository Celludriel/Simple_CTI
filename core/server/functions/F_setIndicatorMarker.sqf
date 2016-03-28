if(!isDedicated) exitWith {};

params [ "_marker", "_color", "_range" ];

_marker setMarkerColor _color;
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "SolidBorder";
_marker setMarkerSize [_range, _range];