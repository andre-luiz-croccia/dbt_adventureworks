with fonte_pais as (
select *   
from {{ source('erp', 'raw_countryregion') }}

)
, renomeado as (
    select
    cast (countryregioncode as string) as pais_id
    , cast (name as string) as nome_pais

    from fonte_pais
)

select *
from renomeado