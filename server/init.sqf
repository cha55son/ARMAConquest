// Index 0: BLUFOR tickets.
// Index 1: OPFOR tickets.
tickets = [0, 0];
ticketLimit = 10;
sectors = [];
// Increment tickets based on dominance
[] spawn {
	private "_counter";
	_counter = 0;
	while {true} do {
		sleep 1;
		hint format ["counter at: %1", _counter];
		_counter = _counter + 1;
	}
}