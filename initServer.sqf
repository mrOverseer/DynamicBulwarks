// Do lobby-specific server initialization here, such as calculating
// default parameters and options based on loaded mods.
[] call factions_fnc_getAllFactions params ["_hostileFactions","_lootFactions"];
factionOptions = _hostileFactions;
publicVariable "factionOptions";
lootFactionOptions = _lootFactions;
publicVariable "lootFactionOptions";

/* List points for transfer */
BULWARK_TRANSFERPOINT = [
    100,
    500,
    1000,
    5000,
    10000,
    20000
];

publicVariable "BULWARK_TRANSFERPOINT";

// Platform cargo
[] execVM "platformCargo\init.sqf";
