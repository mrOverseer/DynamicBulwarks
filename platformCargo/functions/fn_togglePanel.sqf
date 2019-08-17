/**
*  fn_toggle
*
*  Toggle the platform cargo panel.
*
*  Domain: Client
**/

_object = _this select 0;
_value = _this select 1;
_source = _this select 2;

_object animateSource [_source, rad(_value * 180), true];