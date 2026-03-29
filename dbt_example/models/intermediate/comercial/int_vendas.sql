{{ config(
    tags=["comercial"]
) }}

with orders as (
    select
        extract(month from safe_cast(order_date as datetime)) as mes,
        extract(year from safe_cast(order_date as datetime)) as ano,
        freight as total_frete
    from {{ ref("stg_orders") }}
    where safe_cast(order_date as datetime) is not null
),

vendas as (
    select
        mes,
        ano,
        sum(total_frete) as total_frete
    from orders
    group by mes, ano
)

select *
from vendas