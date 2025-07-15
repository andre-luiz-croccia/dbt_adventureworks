with fonte_pessoa_cliente as (
select *   
from {{ source('erp', 'raw_customer') }}

)
, renomeado as (
    select
       cast(customerid as string) as id_cliente
        , cast(personid as string) as id_person
        , cast(storeid as string) as id_loja
        , cast(territoryid as string) as id_territorio
        

    from fonte_pessoa_cliente
)

select *
from renomeado