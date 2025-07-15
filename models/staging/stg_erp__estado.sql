with fonte_estado as (
select *   
from {{ source('erp', 'raw_stateprovince') }}

)
, renomeado as (
    select

        cast(stateprovinceid as string) as estado_id
        ,cast(stateprovincecode as string) as estado_sigla
        ,cast(countryregioncode as string) as pais_do_estado
        ,cast(name as string) as nome_do_estado
        ,cast(territoryid as string) as territorio_id

    from fonte_estado
)

select *
from renomeado