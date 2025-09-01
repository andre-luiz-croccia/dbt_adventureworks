with fonte_compras_por_pedido_detalhado as (
select *   
from {{ source('erp', 'raw_api_purchase_order_detail') }}
)
, renomeado as (
    select

         cast(PurchaseOrderID as string) as id_pedido
        , cast(PurchaseOrderDetailID as string) as id_pedido_detalhado
        , cast(DueDate as date) as data_pedido
        , cast(OrderQty as int) as qtde
        , cast(ProductID as string) as id_produto
        , cast(UnitPrice as numeric(18,4)) as preco_unitario
        , cast(LineTotal as numeric(18,4)) as total
        , cast(ReceivedQty as int) as qtde_recebida
        , cast(RejectedQty as int) as qtde_rejeitada
        , cast(StockedQty as int) as taxamt
   
    from fonte_compras_por_pedido_detalhado
)

select *
from renomeado