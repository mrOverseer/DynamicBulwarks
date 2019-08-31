/**
*  fn_openGui
*
*  Displays GUI for platform cargo.
*
*  Domain: Client
**/

platform = _this select 0;

disableSerialization;

createDialog "platformCargo_Dialog";
waitUntil {!isNull (findDisplay 7777);};

_display = findDisplay 7777;

_display displayAddEventHandler ["Unload", {
	params ["_display", "_exitCode"];

	if (2 == _exitCode) then {
		[platform] spawn pc_fnc_restoreActions;
	};
}];

arrayPanelRotate = [
	[7102, "Panel_1_rotate_source"],
	[7202, "Panel_2_rotate_source"],
	[7302, "Panel_3_rotate_source"],
	[7402, "Panel_4_rotate_source"]
];
{
	_ctrl = _display displayCtrl (_x select 0);

	// Set value
	_phase = platform animationSourcePhase (_x select 1);
	_ctrl sliderSetPosition ((deg _phase / 180) * 10);

	// Set event handle
	_ctrl ctrlAddEventHandler [
		"SliderPosChanged",
		{
			params ["_control", "_newValue"];
			_idc = ctrlIDC _control;
			{
				if (_idc == (_x select 0)) exitWith {
					[platform, _newValue, (_x select 1)] spawn platformCargo_fnc_rotatePanel;
				};
			} forEach arrayPanelRotate;
		}
	];
} forEach arrayPanelRotate;

arrayPanelToggle = [
	[7104, "Panel_1_hide_source"],
	[7204, "Panel_2_hide_source"],
	[7304, "Panel_3_hide_source"],
	[7404, "Panel_4_hide_source"]
];
{
	_ctrl = _display displayCtrl (_x select 0);

	// Set value
	_phase = platform animationSourcePhase (_x select 1);
	if (_phase > 0) then {
		_ctrl cbSetChecked true;
	} else {
		_ctrl cbSetChecked false;
	};

	// Set event handle
	_ctrl ctrlAddEventHandler [
		"CheckedChanged",
		{
			params ["_control", "_checked"];
			_idc = ctrlIDC _control;
			{
				if (_idc == (_x select 0)) exitWith {
					[platform, _checked, (_x select 1)] spawn platformCargo_fnc_togglePanel;
				};
			} forEach arrayPanelToggle;
		}
	];
} forEach arrayPanelToggle;
