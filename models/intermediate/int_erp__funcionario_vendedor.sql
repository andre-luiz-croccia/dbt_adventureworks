with
pessoa as (
    select * from {{ ref('stg_erp__pessoa') }}
),

funcionarios as (
    select * from {{ ref('stg_erp__pessoa_funcionario') }}
),

vendedores as (
    select * from {{ ref('stg_erp__pessoa_funcionario_vendas') }} 
),

joined as (
    select

         f.id_funcionario
        , p.nome_cliente as nome_funcionario
        , f.id_numero_nacional
        , f.cargo
        , f.data_nascimento

    from funcionarios f
    inner join pessoa p on f.id_funcionario = p.id_pessoa ) ,
    
    joined_2 as (
    select 

         v.id_vendedor
        , v.id_territorio
        , j.nome_funcionario
        , j.cargo
        , j.data_nascimento

from vendedores v
inner join joined j on v.id_vendedor = j.id_funcionario )

select *
from joined_2