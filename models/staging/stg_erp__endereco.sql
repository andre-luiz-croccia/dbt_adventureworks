with fonte_endereco as (
select *   
from {{ source('erp', 'raw_address') }}

)
, renomeado as (
    select
        cast(addressid as string) as endereco_id
        ,cast(addressline1 as string) as endereco
        ,cast(addressline2 as string) as endereco2
        ,cast(city as string) as cidade
        ,cast(stateprovinceid as int) as estado
   
    from fonte_endereco
)

select *
from renomeado