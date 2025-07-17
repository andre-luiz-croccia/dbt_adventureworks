with dim_cc as (
    select *
    from {{ ref('stg_erp__cartao_de_credito') }}
)

select *
from dim_cc