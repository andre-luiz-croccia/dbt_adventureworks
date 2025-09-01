with
pedidos as ( 
    select * from {{ ref('int_erp__pedidos') }} 
),

pedidos_detalhados as (
    select * from {{ ref('int_erp__pedido_detalhe_por_produto') }} 
),

joined as (
    select

        p.id_pedido
        , p.data_de_venda
        , p.status
        , p.id_cliente
        , p.nome_cliente
        , p.cartao_de_credito
        , p.vendedor
        , p.endereco_id
        , p.cidade
        , p.estado
        , p.pais

        , pd.id_pedido_detalhe
        , pd.qtde
        , pd.produto_id
        , pd.produto
        , pd.nome_subcategoria
        , pd.nome_categoria
        , pd.custo_padrao
        , pd.preco_unitario
        , pd.preco_unitario_desconto
        , pd.valor_total


    from pedidos_detalhados pd
    left join pedidos p on pd.id_pedido = p.id_pedido
    )
    

select *
from joined


