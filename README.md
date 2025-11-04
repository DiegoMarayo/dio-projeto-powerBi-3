# 📊 DIO Company — Workforce & Projects Dashboard (Power BI + Azure SQL)

Este projeto foi desenvolvido como parte do desafio da Digital Innovation One (DIO), consumindo dados do **Azure SQL Database** para criação de um dashboard corporativo no **Power BI** com foco em projetos, colaboradores e horas trabalhadas.

---

## 🚀 Tecnologias Utilizadas

- Azure SQL Database  
- Power BI Desktop  
- Power Query (ETL)  
- DAX  
- GitHub  

---

## 🎯 Objetivos do Projeto

- Monitorar projetos e produtividade
- Acompanhar horas trabalhadas por funcionário
- Visualizar colaboradores por gerente
- Avaliar horas trabalhadas por departamento e projeto
- Criar painel gerencial interativo

---

## ✅ Indicadores Criados (KPIs)

| KPI | Valor |
|---|---|
Total Projects | **6**
Total Managers | **3**
Total Employees | **8**
Total Hours Worked | **275 horas**

---

## 📂 Modelagem de Dados

### Tabelas

- employee
- project
- works_on
- department

### Relacionamentos Principais

| De | Para | Relacionamento |
|---|---|---|
employee.Ssn | works_on.Essn | 1 : N
project.Pnumber | works_on.Pno | 1 : N
department.Dnumber | project.Dnum | 1 : N

> Dados tratados e normalizados no Power Query (remoção de duplicados, colunas desnecessárias e criação de coluna Manager).

---

## 🧠 Medidas DAX

Total Projects = DISTINCTCOUNT(project[Pname])
Total Managers = DISTINCTCOUNT(employee[Manager])
Total Employees = DISTINCTCOUNT(employee[FullName])
Total Hours = SUM(works_on[Hours])

---

📈 Visualizações no Dashboard

- Cards: KPIs de projetos, gestores, funcionários e horas totais
- Barra Clássica: Horas x Tamanho da equipe por projeto
- Barra Horizontal: Horas por departamento
- Treemap: Horas por colaborador
- Pizza: Funcionários por gerente
- Slicer: Filtragem por gerente
- Botão: Clear Filters

---

📚 Aprendizados

- Conexão com banco de dados em nuvem (Azure SQL)
- ETL e limpeza avançada com Power Query
- Modelagem relacional para BI
- Criação de indicadores com DAX
- Construção de dashboard corporativo no Power BI

---

🙌 Créditos

Desenvolvido como parte do bootcamp da Digital Innovation One (DIO).

Autor: Diego Marayo
