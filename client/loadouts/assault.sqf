removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

_this forceAddUniform "U_B_CTRG_1";

// Standard Issue
for "_i" from 1 to 2 do {_this addItemToUniform "FirstAidKit";};
for "_i" from 1 to 2 do {_this addItemToUniform "16Rnd_9x21_Mag";};
_this addVest "V_PlateCarrierL_CTRG";
for "_i" from 1 to 4 do {_this addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {_this addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 2 do {_this addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_this addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_green";};
_this addItemToVest "I_IR_Grenade";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
_this linkItem "NVGoggles";

// Assault Specific
for "_i" from 1 to 3 do {_this addItemToVest "3Rnd_HE_Grenade_shell";};
_this addHeadgear "H_HelmetB_light_snakeskin";
_this addGoggles "G_Combat";

_this addWeapon "arifle_MX_GL_F";
_this addPrimaryWeaponItem "acc_pointer_IR";
_this addPrimaryWeaponItem "optic_Hamr";
_this addWeapon "hgun_P07_F";
_this addWeapon "Binocular";