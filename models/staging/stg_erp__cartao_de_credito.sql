with fonte_cartao as (
select *   
from {{ source('erp', 'raw_creditcard') }}

)
, renomeado as (
    select
        
        cast(creditcardid as int) as cartao_de_credito_id
        ,cast(cardtype as string) as tipo_cartao_de_credito
        ,cast(cardnumber as int) as numero_do_cartao
   
    from fonte_cartao
)

select *
from renomeado