@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '.'
@Metadata.allowExtensions: true
define view entity ZC_DMO_BOOKING_01 
as projection on ZI_DMO_BOOKING_01
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    Passenger,
    Connec_Tile,
    CarrierId,
    Carrier,
    ConnectionId,
    FlightDate,
    FlightPrice,
    SeatsOccupied,
    SeatsMax,
    CurrencyCode,
    Departure,
    Arrival,
    /* Associations */
    _travel_01 : redirected to parent ZC_dmo_travel_01,
    _booking_suppl_01 : redirected to composition child ZC_DMO_BOOKING_SUPPL_01,
    _connection_01 : redirected to ZC_DMO_CONNECTION_01
}
