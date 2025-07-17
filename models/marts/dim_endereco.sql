with dim_endereco as (
    select *
    from {{ ref('int_erp__endereco_completo') }}
)

select *
from dim_endereco