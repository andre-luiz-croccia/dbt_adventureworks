with dim_clientes as (
    select *
    from {{ ref('int_erp__clientes') }}
)

select *
from dim_clientes