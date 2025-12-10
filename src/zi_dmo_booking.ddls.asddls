@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_DMO_booking
  as select from ztb_dmo_booking
  composition [0..*] of ZI_DMO_book_suppl as _BOOKSUPPL
  association        to parent ZI_DMO_Travel     as _TRAVEL on  $projection.TravelId = _TRAVEL.TravelId
  association [0..1] to ztb_dmo_connec    as _connection    on  $projection.CarrierId    = _connection.carrier_id
                                                            and $projection.ConnectionId = _connection.connection_id
{
  key travel_id     as TravelId,
  key booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'Currencycode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode,
      _TRAVEL, // Make association public
      _BOOKSUPPL,
      _connection
}
