with pessoa as ( 
    select * from {{ ref('stg_erp__pessoa') }}
),

pessoa_cliente as (
     select * from {{ ref('stg_erp__pessoa_cliente') }} 
), 

clientes as (
    select
   
         pc.id_cliente
        , pc.id_person
        , pc.id_loja
        , pc.id_territorio
        , p.pessoa_tipo
        , p.nome_cliente

    from pessoa_cliente pc
    inner join pessoa p on pc.id_person = p.id_pessoa 
    )
    

select * 
from clientes

-- select count(*) as total
-- from clientes