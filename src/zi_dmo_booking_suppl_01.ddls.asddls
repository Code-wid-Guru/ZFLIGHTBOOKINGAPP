@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '.'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_DMO_BOOKING_SUPPL_01 as select from ztb_dmo_suppl
association to parent ZI_DMO_BOOKING_01 as _Booking_01
    on $projection.BookingId = _Booking_01.BookingId and $projection.TravelId = _Booking_01.TravelId
association to ZI_dmo_travel_01 as _travel_01 on $projection.TravelId = _travel_01.TravelId
association to /dmo/supplement as _suppl_01 on $projection.SupplementId = _suppl_01.supplement_id
//association [0..1] to /dmo/suppl_text as _suppl_txt_01 on $projection.SupplementId = _suppl_txt_01.supplement_id
//                                                       and _suppl_txt_01.language_code = $session.system_language
//association to /dmo/supplcat_t as _supplcattxt_01 on _supplcattxt_01.supplement_category = $projection.CategoryID 
//                                                  and _supplcattxt_01.language_code = $session.system_language       
association to ZI_DMO_SUPPL_INFO_01 as _suppl_info_01 on $projection.SupplementId = _suppl_info_01.SupplementId                
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    key booking_supplement_id as BookingSupplementId,
    supplement_id as SupplementId,
    _suppl_info_01._suppl_txt_01.description as Supplement,
    _suppl_01.supplement_category as CategoryID,
    _suppl_info_01._supplcattxt_01.description as Category,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price as Price,
    currency_code as CurrencyCode,
    createdby as Createdby,
    createdat as Createdat,
    lastchangedby as Lastchangedby,
    lastchangedat as Lastchangedat,
    _Booking_01, // Make association public
    _travel_01
}
