with fonte_motivo_venda_tipo as (
select *   
from {{ source('erp', 'raw_salesreason') }}

)
, renomeado as (
    select
    cast(salesreasonid as string) as id_motivo
    ,cast(name as string) as motivo_de_venda
    ,cast(reasontype as string) as motivo_tipo
    from fonte_motivo_venda_tipo
)

select *
from renomeado