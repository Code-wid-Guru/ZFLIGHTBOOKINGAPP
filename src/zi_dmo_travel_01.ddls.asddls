@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '.'
define root view entity ZI_dmo_travel_01 as select from ztb_dmo_travel
composition [1..*] of ZI_DMO_BOOKING_01  as _BOOKING_01  
{
    key travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    booking_fee as BookingFee,
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    status as Status,
    createdby as Createdby,
    createdat as Createdat,
    lastchangedby as Lastchangedby,
    lastchangedat as Lastchangedat,
    _BOOKING_01
}
