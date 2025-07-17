with fk_pedidos as (
    select *
    from {{ ref('int_erp__pedidos') }}
)

select *
from fk_pedidos