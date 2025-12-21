@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '.'
@Metadata.allowExtensions: true
define root view entity ZI_DMO_SUPPL_INFO_01 as select from /dmo/supplement
association [0..1] to /dmo/suppl_text as _suppl_txt_01 on $projection.SupplementId = _suppl_txt_01.supplement_id
                                                       and _suppl_txt_01.language_code = $session.system_language
association to /dmo/supplcat_t as _supplcattxt_01 on _supplcattxt_01.supplement_category = $projection.SupplementCategory
                                                  and _supplcattxt_01.language_code = $session.system_language
{
    key supplement_id as SupplementId,
    supplement_category as SupplementCategory,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price as Price,
    currency_code as CurrencyCode,
    local_created_by as LocalCreatedBy,
    local_created_at as LocalCreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt,
    _suppl_txt_01,
    _supplcattxt_01
}
