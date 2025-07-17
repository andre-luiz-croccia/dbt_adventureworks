with fk_pdp as (
    select *
    from {{ ref('int_erp__pedido_detalhe_por_produto') }}
)

select *
from fk_pdp