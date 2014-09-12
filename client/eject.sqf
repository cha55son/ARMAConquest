if (!(_this isKindOf "Air")) exitWith { };

_this addEventHandler ["GetIn", {
	_veh = _this select 0;
	_veh addAction ["Eject", {
		// action ["eject".. didn't work and "GetOut" isn't ideal.
		(_this select 0) removeAction (_this select 2);
		moveOut player;
		[] spawn {
			private ["_curPos", "_chute"];
			// Wait until the player is 175m or less.
			waitUntil { 
				private ["_height"];
				_height = (getPos player) select 2;
				_height < 175 
			};
			// If the player is lower than 135m they die.
			if (((getPos player) select 2) < 135) exitWith { };
			// Make sure you don't hit the heli when you jump out.
			// There is probably a better way to do this.
			sleep 1;
			// Pop the chute!
			_chute = "Steerable_Parachute_F" createVehicle [0, 0, 0]; 
			// Make sure the chute is facing the same direction as the player.
			_chute setDir (getDir player);
			_chute setPos getPos player; 
			player moveInDriver _chute;
		};
	}, [], 6.5, false, true];
}];