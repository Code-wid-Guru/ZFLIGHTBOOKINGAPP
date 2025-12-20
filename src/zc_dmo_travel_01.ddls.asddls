@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '.'
@Metadata.allowExtensions: true
define root view entity ZC_dmo_travel_01 
provider contract transactional_query
as projection on ZI_dmo_travel_01
{
    key TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
    Description,
    Status,
    Createdby,
    Createdat,
    Lastchangedby,
    Lastchangedat,
    _BOOKING_01 : redirected to composition child ZC_DMO_BOOKING_01
}
