CLASS zcl_dmo_dataprovider DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dmo_dataprovider IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
*    select * frOM /dmo/travel into table @data(lt_dmo_travel).
*    if sy-subrc = 0.
*        inseRT ztb_dmo_travel from table @lt_dmo_travel.
*    endif.
    inserT ztb_dmo_travel from
    ( select * frOM /dmo/travel ).
    insert ztb_dmo_booking from
    ( select * from /dmo/booking ).
    insert ztb_dmo_suppl from
    ( select * from /dmo/book_suppl ).
    insert ztb_dmo_connec from
    ( select * from /dmo/connection ).
    out->write( |Inserted.| ).
  ENDMETHOD.
ENDCLASS.
