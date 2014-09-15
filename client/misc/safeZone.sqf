private ["_unit"];

_unit = _this;

// Don't allow units to take damage within the base.
_unit addEventHandler ["HandleDamage", {
	if (_this call CQ_isWithinZone) then { 0 };
}];
// Ensure only infantry are able to fire within the base.
if ((_unit isKindOf "LandVehicle") || (_unit isKindOf "Air")) then {
	_unit addEventHandler ["Fired", {
		if (_this call CQ_isWithinZone) then {
			deleteVehicle (_this select 6);
			titleText ["Vehicles are not allowed to fire within the base!", "PLAIN"];
		};
	}];
};
// Only apply the code below to the player's body.
if (_unit == player) then {
	// Disable inventory access within the safe zone.
	player addEventHandler ["InventoryOpened", {
		if (_this call CQ_isWithinZone) then {
			titleText ["Inventory access not allowed in base!", "PLAIN"];
			true
		};
	}];
	// Remove the player's body if it is in a safe zone.
	player addEventHandler ["Killed", { 
		private ["_unit"];
		_unit = _this select 0;
		if (_this call CQ_isWithinZone) then {
			removeAllWeapons _unit;
			hideBody _unit;
			deleteVehicle _unit; 
		};
	}];
	
};
