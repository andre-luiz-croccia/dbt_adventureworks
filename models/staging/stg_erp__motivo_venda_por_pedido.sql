with fonte_motivo_venda_por_pedido as (
select *   
from {{ source('erp', 'raw_salesorderheadersalesreason') }}

)
, renomeado as (
    select

    cast(salesorderid as string) as id_pedido
    ,cast(salesreasonid as string) as id_motivo

from fonte_motivo_venda_por_pedido
)

select *
from renomeado