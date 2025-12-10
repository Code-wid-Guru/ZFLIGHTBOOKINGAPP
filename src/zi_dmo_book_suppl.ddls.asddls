@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'booking suppl'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_DMO_book_suppl
  as select from ztb_dmo_suppl
  association to parent ZI_DMO_booking as _booking on  $projection.TravelId  = _booking.TravelId
                                                   and $projection.BookingId = _booking.BookingId
  association to ZI_DMO_Travel         as _travel  on  $projection.TravelId = _travel.TravelId
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      _booking, // Make association public
      _travel
}
