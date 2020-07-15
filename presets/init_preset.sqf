#include "..\shared\bulwark.hpp"

presetParameter = BULWARK_PARAM_FILTER_PRESET call shared_fnc_getCurrentParamValue;
//to add more presets you need to add another preset in this switch, you also need to add it to the lobby parameters. If you just want one preset for personal use, the custom one is meant for that.
switch (presetParameter) do {
	case 0: { call compile preprocessFileLineNumbers "presets\vanilla.sqf";};
	case 1: { call compile preprocessFileLineNumbers "presets\lib.sqf";};
	case 2: { call compile preprocessFileLineNumbers "presets\gm.sqf";};
	case 3: { call compile preprocessFileLineNumbers "presets\lib_winter.sqf";};
	case 4: { call compile preprocessFileLineNumbers "presets\custom.sqf";};
	case 5: { call compile preprocessFileLineNumbers "presets\cup_ace.sqf";};
	case 6: { call compile preprocessFileLineNumbers "presets\cup_afrf.sqf";};
	case 7: { call compile preprocessFileLineNumbers "presets\cup_taki.sqf";};
	case 8: { call compile preprocessFileLineNumbers "presets\cup_sla.sqf";};

};