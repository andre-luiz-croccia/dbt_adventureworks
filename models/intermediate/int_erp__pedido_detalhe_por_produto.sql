with
produtos as ( 
    select * from {{ ref('int_erp__produtos') }} 
),

pedidos_detalhe as (
 select * from {{ ref('stg_erp__vendas_por_pedido_detalhe') }} 
),   -- join produtos em pedidos detalhe

pedido_detalhe_por_produto as (
    select
   
       id_pedido
        , pd.id_pedido_detalhe
        , pd.qtde
        , p.produto_id
        , p.nome_do_produto as produto
        , p.nome_subcategoria
        , pd.preco_unitario
        , pd.preco_unitario_desconto
        , pd.valor_total

    from pedidos_detalhe pd
    left join produtos p on pd.id_produto = p.produto_id )
    

select *
from pedido_detalhe_por_produto