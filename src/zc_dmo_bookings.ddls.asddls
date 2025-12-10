@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '.'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_dmo_bookings
  as projection on ZI_DMO_booking
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      /* Associations */
      _BOOKSUPPL : redirected to composition child zc_dmo_book_suppl,
//      _connection,
      _TRAVEL    : redirected to parent ZC_dmo_travel
}
