CQ_applyEject         = compileFinal preprocessFile "client\misc\eject.sqf";
CQ_applySafeZoneRules = compileFinal preprocessFile "client\misc\safeZone.sqf";
CQ_applyClassLoadout  = compileFinal preprocessFile "client\misc\classLoadout.sqf";
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
	[_unit, _loadoutName] call CQ_applyLoadout;
};

/*
	Usage: [_unit, _loadoutName] call CQ_applyLoadout;
*/
CQ_applyLoadout = {
	private ["_unit", "_loadoutName"];
	_unit = _this select 0;
	_loadoutName = _this select 1;
	[_unit, _loadoutName] call CQ_applyClassLoadout;
	_unit setVariable ["CQ_classType", _loadoutName];
};


