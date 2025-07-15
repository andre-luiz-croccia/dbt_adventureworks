with fonte_pessoa_funcionario as (
select *   
from {{ source('erp', 'raw_employee') }}

)
, renomeado as (
    select
     
         cast(businessentityid as string) as id_funcionario
        , cast(nationalidnumber as string) as id_numero_nacional
        , cast(jobtitle as string) as cargo
        , cast(birthdate as date) as data_nascimento
       

    from fonte_pessoa_funcionario
)

select *
from renomeado