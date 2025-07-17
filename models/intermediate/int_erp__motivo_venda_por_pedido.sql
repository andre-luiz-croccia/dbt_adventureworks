with 
mp as (
    select * from {{ ref('stg_erp__motivo_venda_por_pedido') }}
),
mt as (
    select * from {{ ref('stg_erp__motivo_venda_tipo') }}
),
mp_mt as (
    select 
        mp.id_pedido
        , mp.id_motivo
        , mt.motivo_de_venda
        , mt.motivo_tipo
        
    from mp
    inner join mt on mp.id_motivo = mt.id_motivo
)

select * from mp_mt
