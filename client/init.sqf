call compile preprocessFile "client\globals.sqf";

player addEventHandler ["respawn", {
	_class = player getVariable ["CQ_classType", "Assault"];
	[player, _class] call CQ_applyLoadout;
}];

player call CQ_applySafeZoneRules;

{
	_x call CQ_applySafeZoneRules;
	_x call CQ_applyEject;
} foreach vehicles;
// Run the safezone script for any newly created/re-spawned vehicles
[missionnamespace, "respawn", {
	_aVeh = _this select 0;
	// Fall out if the object is not a land or air vehicle
	if (!(_aVeh isKindOf "LandVehicle") && !(_aVeh isKindOf "Air")) exitWith { };
	_aVeh call CQ_applySafeZoneRules;
	_aVeh call CQ_applyEject;
}] spawn BIS_fnc_addScriptedEventHandler;

[unitLoadoutAssaultBLUFOR, "Assault" ] call CQ_applyLoadoutToAI;
[unitLoadoutEngiBLUFOR,    "Engineer"] call CQ_applyLoadoutToAI;
[unitLoadoutReconBLUFOR,   "Recon"   ] call CQ_applyLoadoutToAI;
[unitLoadoutATBLUFOR,      "AT"      ] call CQ_applyLoadoutToAI;
[unitLoadoutAABLUFOR,      "AA"      ] call CQ_applyLoadoutToAI;
[unitLoadoutMedicBLUFOR,   "Medic"   ] call CQ_applyLoadoutToAI;

[unitLoadoutAssaultOPFOR, "Assault" ] call CQ_applyLoadoutToAI;
[unitLoadoutEngiOPFOR,    "Engineer"] call CQ_applyLoadoutToAI;
[unitLoadoutReconOPFOR,   "Recon"   ] call CQ_applyLoadoutToAI;
[unitLoadoutATOPFOR,      "AT"      ] call CQ_applyLoadoutToAI;
[unitLoadoutAAOPFOR,      "AA"      ] call CQ_applyLoadoutToAI;
[unitLoadoutMedicOPFOR,   "Medic"   ] call CQ_applyLoadoutToAI;