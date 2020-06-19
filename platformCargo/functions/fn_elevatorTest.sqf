/**
*  fn_elevatorTest
*
*  Elevate the platform cargo.
*
*  Domain: Client
**/

platform = _this select 0;
_position = _this select 1;
diff = _this select 2;
_step = _this select 3;

_length = PC_ELEVATOR_LENGTH;
platformPos = getPosASL platform;

[platform, false] remoteExec ["enableSimulation", 0];
[platform, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];

_vehs = nearestobjects [platform, ["Man"], 5];
sleep 0.1;

// Animate legs
_phase = ((100 - _position) / 100) * _length;
_coef = _length / 8.8;
platform animateSource ['Leg_1_move_source', _phase, _coef];
platform animateSource ['Leg_2_move_source', _phase, _coef];
platform animateSource ['Leg_3_move_source', _phase, _coef];
platform animateSource ['Leg_4_move_source', _phase, _coef];

diag_log(format ["from: %1", platformPos]);

platform setVelocityTransformation [
	platformPos,
	[platformPos select 0, platformPos select 1, (platformPos select 2) - diff],
	[0,0,0], 
	[0,0,0], 
	[0,1,0], 
	[0,1,0], 
	[0,0,1], 
	[0,0,1],
	0.25
];

diag_log(format ["to: %1", getPosASL platform]);

waitUntil {(platform animationSourcePhase "Leg_1_move_source") == _phase};

[platform, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];
[platform, true] remoteExec ["enableSimulation", 0];

// Add actions
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

[
	_object,
	[
		"<t color='#ffa500'>" + "Platform Cargo",
		"_this spawn platformCargo_fnc_openGui",
		"",1.5,false,false,"true","true",9
	]
] remoteExec ["addAction", 0, true];
