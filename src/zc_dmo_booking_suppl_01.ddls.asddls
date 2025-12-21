@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '.'
@Metadata.allowExtensions: true
define view entity ZC_DMO_BOOKING_SUPPL_01 as projection on ZI_DMO_BOOKING_SUPPL_01
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    Supplement,
    Category,
    Price,
    CurrencyCode,
    /* Associations */
    _Booking_01 : redirected to parent ZC_DMO_BOOKING_01,
    _travel_01 : redirected to ZC_dmo_travel_01
}
