/**
*  fn_rotate
*
*  Rotate the platform cargo panel.
*
*  Domain: Client
**/

_object = _this select 0;
_value = _this select 1;
_source = _this select 2;

_object animateSource [_source, rad((_value / 10) * 180), true];