 with fonte_pessoa as (
     select *   
     from {{ source('erp', 'raw_person') }}
 ),
 renomeado as (
     select
         cast(businessentityid as string) as id_pessoa
         , cast(persontype as string) as pessoa_tipo
         , coalesce(firstname, '') || ' ' || 
          coalesce(middlename, '') || ' ' || 
          coalesce(lastname, '') as nome_cliente
     from fonte_pessoa
 )
 
 select *
 from renomeado

-- with fonte_pessoa as ( -- verificar quais nomes estão duplicados
--     select *   
--     from {{ source('erp', 'raw_person') }}
-- ),
-- renomeado as (
--     select
--         cast(businessentityid as int) as id_pessoa
--         , cast(persontype as string) as pessoa_tipo
--         , coalesce(firstname, '') || ' ' || 
--         coalesce(middlename, '') || ' ' || 
--         coalesce(lastname, '') as nome_cliente
--     from fonte_pessoa
-- )
-- , duplicados as (
--     select 
--         nome_cliente, 
--         count(*) as qtd_ocorrencias
--     from renomeado
--     group by nome_cliente
--     having count(*) > 1
-- )
-- 
-- select * 
-- from duplicados
-- order by qtd_ocorrencias desc