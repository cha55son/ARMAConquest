private ["_unit", "_loadoutName"];
_unit = _this select 0;
_loadoutName = _this select 1;

switch (_loadoutName) do {
	case "Engineer": {
		hint "Apply Engineer speciality";
	};
	case "Medic": {
		hint "Apply Medic speciality";
	};
};