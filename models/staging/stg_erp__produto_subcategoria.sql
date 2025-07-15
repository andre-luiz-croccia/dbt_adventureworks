with fonte_subcategoria_produto as (
select *   
from {{ source('erp', 'raw_productsubcategory') }}

)
, renomeado as (
    select
        cast(productsubcategoryid as string) as subcategoria_id
        ,cast(productcategoryid as string) as categoria_id
        ,cast(name as string) as nome_subcategoria
   
    from fonte_subcategoria_produto
)

select *
from renomeado