@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '.'
@Metadata.allowExtensions: true
define root view entity ZC_DMO_CONNECTION_01 
provider contract transactional_query
as projection on ZI_DMO_Connection_01
{
    key CarrierId,
    key ConnectionId,
    Carrier,
    AirportFromId,
    AirportToId,
    FromAirport,
    ToAirport,
    DepartureTime,
    ArrivalTime,
    Distance,
    DistanceUnit,
    _BOOKING_01 : redirected to ZC_DMO_BOOKING_01  
}
