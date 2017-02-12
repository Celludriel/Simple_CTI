params [ "_accelerationFactor", "_shorterNights" ];

while { true } do {
	if ( _shorterNights == 1 && ( daytime > 21 || daytime < 3 ) ) then {
		_accelerated_time = _accelerationFactor * 3;
		if ( _accelerated_time > 100 ) then {
			_accelerated_time = 100;
		};
		setTimeMultiplier _accelerated_time;
	} else {
		setTimeMultiplier _accelerationFactor;
	};
	sleep 10;
};