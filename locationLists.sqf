List_SpecificPoint = [getMarkerPos "specBulwarkLoc", ""];
deleteMarker "specBulwarkLoc";

_zoneMarkers = [];
{
    _currMarker = toArray _x;
    if(count _currMarker >= 4) then {
        _currMarker resize 8;
        _currMarker = toString _currMarker;
        if(_currMarker == "bulwark_") then{
            _zoneMarkers append [getMarkerPos _x];
            deleteMarker _x;
        };
    };
} foreach allMapMarkers;

_allLocations = [];
{
    _allLocations append [locationPosition _x];
} forEach nearestLocations [[0,0,0], ["Name", "Strategic", "StrongpointArea", "FlatArea", "FlatAreaCity", "FlatAreaCitySmall", "CityCenter", "Airport", "NameMarine", "NameCityCapital", "NameCity", "NameVillage", "NameLocal", "Hill", "ViewPoint", "RockArea"], 40000];

List_LocationMarkers = _zoneMarkers;
List_AllCities = _allLocations;
