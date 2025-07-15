with fonte_pessoa_funcionario_vendas as (
select *   
from {{ source('erp', 'raw_salesperson') }}
)
, renomeado as (
    select
     
         cast(businessentityid as string) as id_vendedor
        , cast(territoryid as string) as id_territorio
       -- , cast(salesquota as int) 
       --  , cast(bonus as int) 
       -- , cast(commissionpct as int) 
        -- , cast(salesytd as int) 
       -- , cast(saleslastyear as int) 
       
    from fonte_pessoa_funcionario_vendas
)

select *
from renomeado