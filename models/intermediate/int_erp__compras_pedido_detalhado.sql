with
produtos as ( 
    select * from {{ ref('int_erp__produtos') }} 
),

pedidos_detalhe as (
 select * from {{ ref('stg_erp__compras_por_pedido_detalhado') }} 
),   -- join produtos em pedidos detalhe

pedido_detalhe_por_produto as (
    select
        pd.id_pedido,
        pd.id_pedido_detalhado,
        pd.data_pedido,
        pd.qtde,
        pd.id_produto,
        p.nome_do_produto,
        p.nome_subcategoria,
        pd.preco_unitario,
        pd.total,
        pd.qtde_recebida,
        pd.qtde_rejeitada,
        pd.taxamt

    from pedidos_detalhe pd
    left join produtos p on pd.id_produto = p.produto_id )
    

select *
from pedido_detalhe_por_produto