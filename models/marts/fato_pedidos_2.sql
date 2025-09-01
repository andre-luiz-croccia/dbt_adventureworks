with fk_pedidos as (
    select *
    from {{ ref('int_erp__fato_pedidos') }}
)

select *
from fk_pedidos