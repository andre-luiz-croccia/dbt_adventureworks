with fonte_compras_por_pedido as (
select *   
from {{ source('erp', 'raw_api_purchase_order_header') }}
)
, renomeado as (
    select

         cast(PurchaseOrderID as string) as id_compra
        , cast(RevisionNumber as string) as id_revisao
        , cast(Status as string) as status
        , cast(EmployeeID as string) as id_funcionario
        , cast(VendorID as string) as id_fornecedor
        , cast(ShipMethodID as string) as id_metedo_envio
        , cast(OrderDate as date) as data_pedido
        , cast(SubTotal as numeric(18,4)) as subtotal
        , cast(TaxAmt as numeric(18,4)) as taxamt
        , cast(Freight as numeric(18,4)) as frete
        , cast(TotalDue as numeric(18,4)) as total
   
    from fonte_compras_por_pedido
)

select *
from renomeado