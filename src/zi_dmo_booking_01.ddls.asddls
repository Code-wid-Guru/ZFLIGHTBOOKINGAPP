@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '.'
define view entity ZI_DMO_BOOKING_01 as select from ztb_dmo_booking
association to parent ZI_dmo_travel_01 as _travel_01
    on $projection.TravelId = _travel_01.TravelId
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    _travel_01 // Make association public
}
