with fk_pedidos as (
    select *
    from {{ ref('int_erp__compras_pedido_detalhado') }}
)

select *
from fk_pedidos