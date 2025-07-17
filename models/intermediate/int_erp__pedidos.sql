with
pedidos as ( 
    select * from {{ ref('stg_erp__vendas_por_pedido') }} 
),

endereco as (
    select * from {{ ref('dim_endereco') }} 
),   

cliente as ( 
    select * from {{ ref('dim_clientes') }} 
),

-- motivo_venda as ( select * from {{ ref('dim_motivo_venda') }} ),

cartao_de_credito as ( 
    select * from {{ ref('dim_cartao_de_credito') }} 
),

vendedor as ( 
    select * from {{ ref('dim_vendedor') }} 
),

joined as (
    select

         p.id_pedido
        , p.data_de_venda
       -- , p.data_de_vencimento
       -- , p.data_de_envio
        , p.status
       -- , p.numero_da_conta
        , p.id_cliente
        , c.nome_cliente
        , p.id_vendedor
        , v.nome_funcionario as vendedor
       -- , p.id_territorio
        , e.endereco_id
        , e.cidade
        , e.nome_do_estado as estado
        , e.nome_pais as pais
       -- , p.id_metodo_envio
       -- , p.id_cartao_tipo
        , p.id_cartao_tipo
        , cc.tipo_cartao_de_credito as cartao_de_credito
        , p.subtotal
        , p.taxamt
        , p.frete
        , p.valor_total
       -- , m.motivo_de_venda

    from pedidos p
    left join endereco e on p.id_endereco = e.endereco_id 
    left join cliente c on p.id_cliente = c.id_cliente
   -- left join motivo_venda m on p.id_pedido = m.id_pedido
    left join cartao_de_credito cc on p.id_cartao_tipo = cc.cartao_de_credito_id
    left join vendedor v on p.id_vendedor = v.id_vendedor

    )
    

select *
from joined