with dim_motivo_venda as (
    select *
    from {{ ref('int_erp__motivo_venda_por_pedido') }}
)

select *
from dim_motivo_venda