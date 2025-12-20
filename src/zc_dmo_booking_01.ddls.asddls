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
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    /* Associations */
    _travel_01 : redirected to parent ZC_dmo_travel_01
}
