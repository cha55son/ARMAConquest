private ["_unit", "_className"];
_unit = _this select 0;
_className = _this select 1;
_side = side _unit;
_sideClass = (str _side) + ' ' + _className;

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

// Uniforms
switch (_sideClass) do {
	case "WEST Assault":  { _unit forceAddUniform "U_B_CTRG_1"; };
	case "WEST Engineer": { _unit forceAddUniform "U_B_CTRG_2"; };
	case "WEST Recon":    { _unit forceAddUniform "U_B_GhillieSuit"; };
	case "WEST AT":       { _unit forceAddUniform "U_B_CTRG_1"; };
	case "WEST AA":       { _unit forceAddUniform "U_B_CTRG_1"; };
	case "WEST Medic":    { _unit forceAddUniform "U_B_CTRG_3"; };
	
	case "EAST Assault":  { _unit forceAddUniform "U_O_SpecopsUniform_ocamo"; };
	case "EAST Engineer": { _unit forceAddUniform "U_O_SpecopsUniform_ocamo"; };
	case "EAST Recon":    { _unit forceAddUniform "U_O_GhillieSuit"; };
	case "EAST AT":       { _unit forceAddUniform "U_O_SpecopsUniform_ocamo"; };
	case "EAST AA":       { _unit forceAddUniform "U_O_SpecopsUniform_ocamo"; };
	case "EAST Medic":    { _unit forceAddUniform "U_O_OfficerUniform_ocamo"; };
};

// Standard Issue
for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
// _unit linkItem "NVGoggles";
_unit addWeapon "Binocular";

// Side specific items
switch (_side) do {
	case west: { 
		_unit addVest "V_PlateCarrierL_CTRG"; 
		_unit addHeadgear "H_HelmetB_light_snakeskin";
		for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
		for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
	};
	case east: { 
		_unit addVest "V_TacVest_khk";
		_unit addHeadgear "H_HelmetO_ocamo";
		for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
		// Katiba does not have a marksman version so we're using the MXM.
		if (_className == "Recon") then {
			for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_65x39_caseless_mag_Tracer";};
		} else {
			for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
			for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_65x39_caseless_green_mag_Tracer";};
		};
	};
};

// Standard Issue (Moved here since the vest will most likely change).
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
_unit addItemToVest "I_IR_Grenade";

// Class specific items
// Super simple loadouts that will hopefully
// be replaced by a class weapon selection system.
switch (_sideClass) do {
	case "WEST Assault": {
		for "_i" from 1 to 4 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
		_unit addGoggles "G_Combat";

		_unit addWeapon "arifle_MX_GL_F";
		_unit addPrimaryWeaponItem "optic_Hamr";
	};
	case "WEST Engineer": {
		_unit addGoggles "G_Tactical_Clear";

		_unit addWeapon "arifle_MXC_F";
		_unit addPrimaryWeaponItem "optic_Aco";
	};
	case "WEST Recon": {
		_unit addWeapon "arifle_MXM_F";
		_unit addPrimaryWeaponItem "optic_SOS";
		_unit addWeapon "Rangefinder";
	};
	case "WEST AT": {
		_unit addWeapon "arifle_MXC_F";
		_unit addBackpack "B_Carryall_ocamo";
		_unit addWeapon "launch_B_Titan_short_F";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AT";};
		_unit addPrimaryWeaponItem "optic_Aco";
	};
	case "WEST AA": {
		_unit addWeapon "arifle_MXC_F";
		_unit addBackpack "B_Carryall_ocamo";
		_unit addWeapon "launch_B_Titan_F";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AA";};
		_unit addPrimaryWeaponItem "optic_Aco";
	};
	case "WEST Medic": {
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Hamr";
	};
	
	case "EAST Assault": { 
		for "_i" from 1 to 4 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
		_unit addGoggles "G_Combat";

		_unit addWeapon "arifle_Katiba_GL_F";
		_unit addPrimaryWeaponItem "optic_Hamr";
	};
	case "EAST Engineer": { 
		_unit addGoggles "G_Tactical_Clear";
	
		_unit addWeapon "arifle_Katiba_C_F";
		_unit addPrimaryWeaponItem "optic_Aco";
	};
	case "EAST Recon": { 
		_unit addWeapon "arifle_MXM_Black_F";
		_unit addPrimaryWeaponItem "optic_SOS";
		_unit addWeapon "Rangefinder";
	};
	case "EAST AT": { 
		_unit addWeapon "arifle_Katiba_C_F";
		_unit addPrimaryWeaponItem "optic_Aco";
		
		_unit addBackpack "B_Carryall_khk";
		_unit addWeapon "launch_O_Titan_short_F";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AT";};
	};
	case "EAST AA": { 
		_unit addWeapon "arifle_Katiba_C_F";
		_unit addPrimaryWeaponItem "optic_Aco";
		
		_unit addBackpack "B_Carryall_khk";
		_unit addWeapon "launch_O_Titan_F";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AA";};
	};
	case "EAST Medic": { 
		_unit addWeapon "arifle_Katiba_C_F";
		_unit addPrimaryWeaponItem "optic_Aco";
	};
};

// Added here so the rifle is the active weapon.
switch (_side) do {
	case west: { _unit addWeapon "hgun_P07_F"; };
	case east: { _unit addWeapon "hgun_Rook40_F"; };
};
_unit addPrimaryWeaponItem "acc_pointer_IR";