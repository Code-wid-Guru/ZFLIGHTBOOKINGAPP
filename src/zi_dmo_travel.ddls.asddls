@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'travel'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_DMO_Travel
  as select from ztb_dmo_travel
  composition [1..*] of ZI_DMO_booking  as _BOOKING
  association [1..1] to /DMO/I_Agency   as _agency   on $projection.AgencyId = _agency.AgencyID
  association [1..1] to /DMO/I_Customer as _customer on $projection.CustomerId = _customer.CustomerID
{
  key travel_id     as TravelId,
      agency_id     as AgencyId,
      customer_id   as CustomerId,
      begin_date    as BeginDate,
      end_date      as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee   as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,
      currency_code as CurrencyCode,
      description   as Description,
      status        as Status,
      createdby     as Createdby,
      createdat     as Createdat,
      lastchangedby as Lastchangedby,
      lastchangedat as Lastchangedat,
      _BOOKING, // Make association public
      _agency,
      _customer
}
