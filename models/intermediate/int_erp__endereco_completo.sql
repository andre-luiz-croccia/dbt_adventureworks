with
paises as (
    select * from {{ ref('stg_erp__pais') }}
),

estados as (
    select * from {{ ref('stg_erp__estado') }}
),

enderecos as (
    select * from {{ ref('stg_erp__endereco') }} 
),

estados_paises as (
    select  
        e.estado_id
        , e.estado_sigla
        , e.nome_do_estado
        , e.territorio_id
        , e.pais_do_estado
        , p.nome_pais
    from estados e
    inner join paises p on e.pais_do_estado = p.pais_id ) ,
    
    endereco_completo as (
    select 
        en.endereco_id
        , en.endereco
        , en.endereco2
        , en.cidade
        , en.estado
        , ep.estado_sigla
        , ep.nome_do_estado
        , ep.nome_pais
from enderecos en
inner join estados_paises ep on en.estado = ep.estado_id )

select *
from endereco_completo