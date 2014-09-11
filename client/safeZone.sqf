if (isDedicated) exitWith {};

#define SAFETY_ZONES [["baseBLUFOR", 50], ["baseOPFOR", 50]] // Syntax: [["marker1", radius1], ["marker2", radius2], ...]
_veh = _this;

// Don't allow units to take damage within the base.
_veh addEventHandler ["HandleDamage", {
	if ({ (_this select 0) distance getMarkerPos (_x select 0) < _x select 1 } count SAFETY_ZONES > 0) then {
		0
	};
}];
// Ensure only infantry are able to fire within the base.
if ((_veh isKindOf "LandVehicle") || (_veh isKindOf "Air")) then {
	_veh addEventHandler ["Fired", {
		if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then {
			deleteVehicle (_this select 6);
			titleText ["Vehicles are not allowed to fire within the base!", "PLAIN", 3];
		};
	}];
}