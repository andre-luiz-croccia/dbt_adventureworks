with dim_vendedor as (
    select *
    from {{ ref('int_erp__funcionario_vendedor') }}
)

select *
from dim_vendedor