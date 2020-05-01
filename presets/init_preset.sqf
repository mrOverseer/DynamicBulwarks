presetParameter = "FILTER_PRESET" call BIS_fnc_getParamValue;
//to add more presets you need to add another preset in this switch, to add it to the parameter edit line 215,216 in description.ext
switch (presetParameter) do {
	case 0: {_preset = [] execVM "presets\vanilla.sqf";};
	case 1: {_preset = [] execVM "presets\cup_ace.sqf";};
	case 2: {_preset = [] execVM "presets\cup_afrf.sqf";};
	case 3: {_preset = [] execVM "presets\cup_taki.sqf";};
	case 4: {_preset = [] execVM "presets\cup_sla.sqf";};
	case 5: {_preset = [] execVM "presets\gm.sqf";};	
	case 6: {_preset = [] execVM "presets\lib.sqf";};
	case 7: {_preset = [] execVM "presets\lib_winter.sqf";};
	case 8: {_preset = [] execVM "presets\custom.sqf";};
};