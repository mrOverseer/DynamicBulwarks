_object = _this select 0;
_caller = _this select 1;
_action = _this select 2;

detach _object;

{
	[_object, _x] remoteExec ['enableCollisionWith', 0];
} forEach playableUnits;

[_caller] remoteExec ["removeAllActions", 0];

_object setVehiclePosition [_object, [], 0, 'CAN_COLLIDE'],

[
	_object,
	[
		'<t color="#ff0000">Remove Object</t>',
		'[_this select 0, _this select 1] call build_fnc_sell;',
		'', 1, false, false, 'true', 'true', 5
	]
] remoteExec ['addAction', 0];

[
	_object,
	[
		'<t color="#00ffff">Move Up</t>',
		'[_this select 0, _this select 3, _this select 1] call build_fnc_move;',
		[0,0,0.25],2,false,false,'true','true',5
	]
] remoteExec ['addAction', 0];

[
	_object,
	[
		'<t color="#00ff00">Move Down</t>',
		'[_this select 0, _this select 3, _this select 1] call build_fnc_move;',
		[0,0,-0.25],2,false,false,'true','true',5
	]
] remoteExec ['addAction', 0];

[
	_object,
	[
		'<t color="#ffffff">Pickup</t>',
		'[_this select 0, _this select 1] call build_fnc_pickup;',
		[0,0,0.25],2,false,false,'true','true',5
	]
] remoteExec ['addAction', 0];

[
	_object,
	[
		'<t color="#ffff00">Reset Rotation</t>',
		'[_this select 0, _this select 1] call build_fnc_reset;',
		[0,0,0.25],2,false,false,'true','true',5
	]
] remoteExec ['addAction', 0];

if (typeOf _object == PC_CLASS_NAME) then {
	// Update start position
	{
		if ((str _object splitstring ": " select 1) == _x select 0) exitWith {
			PC_START_POSITION set [_forEachIndex, [_x select 0, getPosATL _object]];
			publicVariable "PC_START_POSITION";
		};
	} forEach PC_START_POSITION;

	[
		_object,
		[
			"<t color='#ffa500'>" + "Platform Cargo",
			"_this spawn platformCargo_fnc_openGui",
			"",2.5,false,false,"true","true",9
		]
	] remoteExec ["addAction", 0];
};

_caller setVariable ["buildItemHeld", false, true];
_object setVariable ["buildItemHeld", false, true];
[mainZeus, [[_object], true]] remoteExec ["addCuratorEditableObjects", 0, true];
PLAYER_OBJECT_LIST pushBack _object;
sleep 0.1;
[[_object], 'bulwark\solidObject.sqf'] remoteExec ['execVM', 2];
