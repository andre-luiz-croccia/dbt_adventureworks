with
produtos_categoria as (
    select * from {{ ref('stg_erp__produto_categoria') }} 
),

produtos_subcategoria as (
    select * from {{ ref('stg_erp__produto_subcategoria') }} 
),

produtos_fonte as (
    select * from {{ ref('stg_erp__produto') }}  
),

categoria_subcategoria as (
    select
    s.subcategoria_id  
    , s.categoria_id
    , s.nome_subcategoria
    , c.nome_categoria

    from produtos_subcategoria s
    left join produtos_categoria c on s.categoria_id = c.categoria_id 
    ) ,
    
    produtos_lista as (
    select 
    pl.produto_id
    , pl.nome_do_produto
    , pl.numero_do_produto
    , cs.nome_subcategoria
    , cs.nome_categoria

from produtos_fonte pl
left join categoria_subcategoria cs on pl.subcategoria_id = cs.subcategoria_id
)

select *
from produtos_lista