PLATFORM_CARGO = tower;
PLATFORM_INIT_HEIGHT = getPosATL PLATFORM_CARGO;

publicVariable "PLATFORM_CARGO";
publicVariable "PLATFORM_INIT_HEIGHT";

[PLATFORM_CARGO, ["<t color='#ffa500'>" + "Platform Cargo", "[] spawn platformCargo_fnc_openGui; idAction = _this select 2","",1.5,false,false,"true","true",9]] remoteExec ["addAction", 0, true];