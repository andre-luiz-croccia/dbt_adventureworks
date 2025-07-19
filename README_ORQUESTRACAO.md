# 📄 README - Orquestração Databricks + dbt Cloud

## 📌 Objetivo
Este projeto tem como objetivo orquestrar um fluxo completo de dados usando o **Databricks** para a extração de dados (MySQL, API) e o **dbt Cloud** para a transformação de dados. A integração garante que o pipeline de transformação (`dbt run`,`dbt test` ou `dbt build`) só execute após a finalização da extração.

---

## 🎯 Fluxo Resumido

1. **Databricks Job**:
   - **Task 1**: Executa notebooks de extração do MySQL e API.
   - **Task 2**: Após concluir a extração, dispara o Job no **dbt Cloud** via API.

2. **dbt Cloud Job**:
   - Realiza o `dbt run`,`dbt build` e `dbt test` para transformar e modelar os dados extraídos.

---

## 🚀 Como Funciona

### 1. Token e IDs Necessários (dbt Cloud):
- **Account ID**: `70471823477460`
- **Job ID**: `70471823485733`
- **API Token**: `dbtu_...` (armazenado de forma segura no Databricks).

> Obs: O **API Token** é gerado no **dbt Cloud** em `Settings > API Access`.

---

### 2. Notebook Trigger dbt Cloud

O segundo notebook do Databricks utiliza a biblioteca **requests** para chamar a API do dbt Cloud logo após finalizar a extração.

```python
import requests

DBT_ACCOUNT_ID = "70471823477460"
DBT_JOB_ID = "70471823485733"
DBT_API_TOKEN = "seu_token_aqui"

url = f"https://re982.us1.dbt.com/api/v2/accounts/{DBT_ACCOUNT_ID}/jobs/{DBT_JOB_ID}/run/"

payload = {"cause": "Triggered from Databricks notebook"}

headers = {
    "Authorization": f"Token {DBT_API_TOKEN}",
    "Content-Type": "application/json"
}

response = requests.post(url, headers=headers, json=payload)

if response.status_code == 200:
    run_id = response.json()["data"]["id"]
    print(f"✅ dbt Cloud job triggered successfully. Run ID: {run_id}")
else:
    print(f"❌ Failed to trigger dbt job: {response.status_code} - {response.text}")
```

---

### 3. Organização do Job no Databricks

| Task                  | Descrição                                      | Dependência                  |
|------------------------|-----------------------------------------------|------------------------------|
| `extracao_de_dados_AW` | Notebook responsável por extração de dados.   | Nenhuma                      |
| `Dbt_project_job`      | Notebook responsável por disparar dbt Cloud. | Depende da extração completar |

#### Exemplo visual da estrutura no Databricks:
```
extracao_de_dados_AW
        ↓
Dbt_project_job
```

---

## 📝 Observações Importantes
- O Databricks é o **orquestrador principal** da pipeline.
- O **dbt Cloud** é chamado apenas após finalização bem-sucedida da extração.
- A trigger entre Databricks ➡️ dbt Cloud é realizada via **API REST** usando Python.

---

## ✅ Benefícios desta Abordagem
- Orquestração simples, sem necessidade de Airflow ou ferramentas externas.
- Fluxo controlado inteiramente no Databricks.
- Fácil de monitorar via Jobs no Databricks e Logs do dbt Cloud.