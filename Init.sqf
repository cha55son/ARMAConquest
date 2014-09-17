[] execVM "globals.sqf";

if (isDedicated) then {
	[] execVM "server\init.sqf";
} else {
	[] execVM "client\init.sqf";
}

["AI: %1", unitLoadoutForAssaultBLUFOR] call BIS_fnc_logFormat;
/* [unitLoadoutAssaultBLUFOR, "Assault" ] call CQ_applyLoadoutToAI;
[unitLoadoutEngiBLUFOR,    "Engineer"] call CQ_applyLoadoutToAI;
[unitLoadoutReconBLUFOR,   "Recon"   ] call CQ_applyLoadoutToAI;
[unitLoadoutATBLUFOR,      "AT"      ] call CQ_applyLoadoutToAI;
[unitLoadoutAABLUFOR,      "AA"      ] call CQ_applyLoadoutToAI;
[unitLoadoutMedicBLUFOR,   "Medic"   ] call CQ_applyLoadoutToAI; */