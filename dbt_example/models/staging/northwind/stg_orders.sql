with orders as (
    select
        orderID         as order_id,
        customerID      as customer_id,
        employeeID      as employee_id,
        orderDate       as order_date,
        requiredDate    as required_date,
        shippedDate     as shipped_date,
        shipVia         as ship_via,
        freight,
        shipName        as ship_name,
        shipAddress     as ship_address,
        shipCity        as ship_city,
        shipRegion      as ship_region,
        shipPostalCode  as ship_postal_code,
        shipCountry     as ship_country,
        case
            when shippedDate is null then 'Pending shipment'
            else 'Sent'
        end as status_shipping
    from {{ source('northwind', 'orders') }}
)

select *
from orders