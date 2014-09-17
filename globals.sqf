// Global variables for both the server and client
// ===================================================
CQ_safeZones = [["baseBLUFOR", 50], ["baseOPFOR", 50]];
CQ_isWithinZone = {
	private ["_unit"];
	_unit = _this select 0;
	{ _unit distance getMarkerPos (_x select 0) < (_x select 1) } count CQ_safeZones > 0
};

CQ_applyClassLoadout     = compileFinal preprocessFile "server\misc\classLoadout.sqf";
CQ_applyClassSpecialties = compileFinal preprocessFile "server\misc\classSpecialities.sqf";

/*
	Usage: [_unit, _loadoutName] call CQ_applyLoadoutToAI;
*/
CQ_applyLoadoutToAI = {
	private ["_unit", "_loadoutName"];
	_unit = _this select 0;
	_loadoutName = _this select 1;
	_unit enableSimulationGlobal false; 
	_unit addEventHandler ["HandleDamage", { 0 }];
	_unit addAction [format ["<t size='1.25' color='#FFFFFF'>Equip %1 Loadout<t>", _loadoutName], {
		private ["_loadoutName"];
		_loadoutName = (_this select 3) select 0;
		[_this select 1, _loadoutName] call CQ_applyLoadout;
	}, [_loadoutName], 10];
	// Add the proper loadout to the AI.
	[_unit, _loadoutName, true] call CQ_applyLoadout;
};

/*
	Usage: [_unit, _loadoutName] call CQ_applyLoadout;
*/
CQ_applyLoadout = {
	private ["_unit", "_loadoutName"];
	_unit = _this select 0;
	_loadoutName = _this select 1;
	_isAI = _this select 2;
	_unit setVariable ["CQ_classType", _loadoutName];
	[_unit, _loadoutName] call CQ_applyClassLoadout;
	if !(isNil "_isAI") exitWith { };
	[_unit, _loadoutName] call CQ_applyClassSpecialties;
};