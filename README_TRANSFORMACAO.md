
# 📄 README - Transformação de Dados (dbt Project)

## 📌 Objetivo
Este projeto de transformação tem como objetivo organizar e padronizar os dados extraídos do MySQL e da API, criando modelos analíticos prontos para consumo em dashboards e análises de negócio.

O pipeline foi desenvolvido utilizando o **dbt Cloud** integrado ao **Databricks SQL Warehouse**.

---

## 🗂️ Estrutura de Camadas

| Camada          | Descrição                                                                 |
|-----------------|---------------------------------------------------------------------------|
| **staging**     | Modelos brutos: aplica apenas renomeações de colunas, castings e filtragens básicas. Fonte principal: tabelas criadas após extração. |
| **intermediate**| Modelos intermediários: aplica joins, cálculos intermediários e pré-aggrega alguns dados. |
| **marts**       | Modelos finais: modelos prontos para consumo analítico, métricas calculadas e tabelas otimizadas para dashboards. |

---

## 🏷️ Organização de Modelos

- `models/staging/` → fontes brutas do MySQL e API
- `models/intermediate/` → tratamentos intermediários
- `models/marts/` → fato e dimensões finais
- `models/docs/` → documentação (opcional)
- `snapshots/` → não utilizado (ou descrever se for usado)
- `tests/` → testes de qualidade (unique, not_null, etc.)

---

## 🛠️ Ordem de Execução (dependências):
```plaintext
stg_* (staging) → int_* (intermediate) → mart_* (marts)
```

Exemplo:
```
stg_customers → int_customers_orders → mart_customer_lifetime_value
```

---

## ✅ Boas Práticas Aplicadas

- **Naming Convention**: `stg_`, `int_`, `mart_`
- **Tests**: Aplicados `not_null`, `unique` em campos críticos
- **Documentação**: `.yml` de descrição dos modelos e colunas
- **Materialization**: incremental para tabelas grandes; view para tabelas leves
- **Ref() Usage**: sempre utilizar `ref()` para rastreabilidade de lineage

---

## 🔍 Observações

- O projeto utiliza **Databricks SQL Warehouse** como engine de transformação.
- A orquestração do `dbt run` ocorre após a extração via notebook do **Databricks**.
- Eventuais alterações em schemas upstream exigem atualização nas `sources` no `staging`.