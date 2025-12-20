@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '.'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity zc_dmo_book_suppl
  as projection on ZI_DMO_book_suppl
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      /* Associations */
      _booking : redirected to parent ZC_dmo_bookings,
      _travel  : redirected to ZC_dmo_travel
}
