/**
*  fn_killed
*
*  Event handler for unit death.
*
*  Domain: Event
**/

params ["_unit", "_killer", "_instigator"];

if (isServer) then {
    if (isPlayer _instigator) then {
        _kilPointMulti = _unit getVariable "killPointMulti";
        [_instigator, (SCORE_KILL * _kilPointMulti)] call killPoints_fnc_add;
        _killPoints = (SCORE_KILL * _kilPointMulti);
        _pointsArr = _unit getVariable "points";
        {
          _killPoints = _killPoints + _x;
        } forEach _pointsArr;

        [_unit, round (SCORE_KILL * _kilPointMulti), [0.1, 1, 0.1]] remoteExec ["killPoints_fnc_hitMarker", _instigator];
    };
};
