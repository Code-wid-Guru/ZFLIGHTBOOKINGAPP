@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '.'
define view entity ZI_DMO_BOOKING_01 as select from ztb_dmo_booking
composition [0..*] of ZI_DMO_BOOKING_SUPPL_01 as _booking_suppl_01
association [1] to ZI_DMO_Connection_01 as _connection_01 on $projection.CarrierId = _connection_01.CarrierId 
                                                             and $projection.ConnectionId = _connection_01.ConnectionId 
association to parent ZI_dmo_travel_01 as _travel_01
    on $projection.TravelId = _travel_01.TravelId
association to /dmo/customer as _customer_01 on $projection.CustomerId = _customer_01.customer_id
association to /dmo/flight as _flight_01 on $projection.CarrierId = _flight_01.carrier_id 
                                         and $projection.ConnectionId = _flight_01.connection_id
                                         and $projection.FlightDate = _flight_01.flight_date
                                       
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    concat_with_space(_customer_01.first_name, _customer_01.last_name, 1) as Passenger,
    concat_with_space( 
                        concat(
                                concat(
                                        concat(
                                                substring(flight_date, length(flight_date)-1, 2 ),
                                                 '-'
                                              ), 
                                        concat(
                                                substring(flight_date, length(flight_date)-3, 2 )
                                                , '-'
                                              )
                                      ), 
                                      substring(flight_date, length(flight_date)-7, 4 )
                               )
                     , concat_with_space(_customer_01.first_name, _customer_01.last_name, 1), 5
                     ) as Connec_Tile,
    carrier_id as CarrierId,
    _connection_01.Carrier as Carrier,
    _connection_01.FromAirport as Departure,
    _connection_01.ToAirport as Arrival,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    _flight_01.seats_occupied as SeatsOccupied,
    _flight_01.seats_max as SeatsMax,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    createdby as Createdby,
    createdat as Createdat,
    lastchangedby as Lastchangedby,
    lastchangedat as Lastchangedat,
    _travel_01, // Make association public
    _booking_suppl_01,
    _connection_01
    
}
