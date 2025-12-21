@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '.'
define root view entity ZI_DMO_Connection_01 as select from ztb_dmo_connec
association [1..*] to ZI_DMO_BOOKING_01 as _BOOKING_01 on $projection.CarrierId = _BOOKING_01.CarrierId
                                                       and $projection.ConnectionId = _BOOKING_01.ConnectionId
association to /dmo/carrier as _carrier_01 on $projection.CarrierId = _carrier_01.carrier_id      
association to /dmo/airport as _airportfrom_01 on $projection.AirportFromId = _airportfrom_01.airport_id
association to /dmo/airport as _airportto_01 on $projection.AirportToId = _airportto_01.airport_id
{
    key carrier_id as CarrierId,
    key connection_id as ConnectionId,
    _carrier_01.name as Carrier,
    airport_from_id as AirportFromId,
    airport_to_id as AirportToId,
    _airportfrom_01.name as FromAirport,
    _airportto_01.name as ToAirport,
    departure_time as DepartureTime,
    arrival_time as ArrivalTime,
    @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
    cast(distance as abap.dec(15,2)) as Distance,
    distance_unit as DistanceUnit,
    _BOOKING_01
}
