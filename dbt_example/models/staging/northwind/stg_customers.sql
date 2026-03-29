with customers as (
    select
        customerID,
        companyName,
        contactName,
        contactTitle,
        address,
        city,
        region,
        postalCode,
        country,
        phone,
        fax
    from {{ source('northwind', 'customers') }}
)

select *
from customers