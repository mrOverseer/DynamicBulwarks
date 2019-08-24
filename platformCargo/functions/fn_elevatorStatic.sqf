/**
*  fn_elevatorStatic
*
*  Elevate the platform cargo.
*
*  Domain: Client
**/

_object = _this select 0;
_position = _this select 1;
_diff = _this select 2;
_step = _this select 3;

_length = PLATFORM_ELEVATOR_LENGTH;
_objectPos = getPosATL _object;
_dir = getDir _object;

[_object, false] remoteExec ["enableSimulation", 0];
[_object, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];

// Animate legs
_phase = ((100 - _position) / 100) * _length;
_coef = _length / 8.8;
_object animateSource ['Leg_1_move_source', _phase, _coef];
_object animateSource ['Leg_2_move_source', _phase, _coef];
_object animateSource ['Leg_3_move_source', _phase, _coef];
_object animateSource ['Leg_4_move_source', _phase, _coef];

// Static object
_elevator = createVehicle [
	"RoadCone_L_F", [
		_objectPos select 0,
		(_objectPos select 1) + 3.5,
		(_objectPos select 2) + _length
	], [], 0, "CAN_COLLIDE"
];
[_elevator, false] remoteExec ["enableSimulation", 0];
_elevator setDir _dir;
_elevator allowDamage false;

_object attachTo [_elevator, [0, 0, -30]];

_height = 0;
_i = 1;
while {_height < _diff} do {
	[_elevator, true] remoteExec ["enableSimulation", 0];
	[_elevator, [
		_objectPos select 0,
		_objectPos select 1,
		(_objectPos select 2) + (_i * _step)
	]] remoteExec ["setPosATL", 0];
	// _elevator setPosATL [
	// 	_objectPos select 0,
	// 	_objectPos select 1,
	// 	(_objectPos select 2) + (_i * _step)
	// ];
	[_elevator, false] remoteExec ["enableSimulation", 0];
	diag_log(format ["height: %1 - motor: %2 - tower: %3", _height, getPosATL _elevator, getPosATL _object]);

	_height = _i * PLATFORM_ELEVATOR_STEP;
	_i = _i + 1;

	sleep 0.01;
};

detach _object;
deleteVehicle _elevator;

waitUntil {(_object animationSourcePhase "Leg_1_move_source") == _phase};

[_object, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];
[_object, true] remoteExec ["enableSimulation", 0];

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
