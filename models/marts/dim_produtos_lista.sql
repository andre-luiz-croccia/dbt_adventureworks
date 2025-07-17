with dim_produtos_lista as (
    select *
    from {{ ref('int_erp__produtos') }}
)

select *
from dim_produtos_lista