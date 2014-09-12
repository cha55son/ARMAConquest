// Give the player some C4 to blow stuff up.
player addEventHandler ["respawn", {
	_player = _this select 0;
	_player addBackpack "B_AssaultPack_mcamo";
	_player addMagazine "SatchelCharge_Remote_Mag";
}];

// Run the safezone script for each new player.
player execVM "client\safeZone.sqf";

// and the vehicles currently on that player's map.
{
	_x execVM "client\safeZone.sqf";
	_x execVM "client\eject.sqf";
} foreach vehicles;
// Run the safezone script for any newly created/re-spawned vehicles
[missionnamespace, "respawn", {
	_aVeh = _this select 0;
	// Fall out if the object is not a land or air vehicle
	if (!(_aVeh isKindOf "LandVehicle") && !(_aVeh isKindOf "Air")) exitWith { };
	_aVeh execVM "client\safeZone.sqf";
	_aVeh execVM "client\eject.sqf";
}] spawn BIS_fnc_addScriptedEventHandler;