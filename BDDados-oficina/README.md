# Sistema Oficina 

Projeto de banco de dados desenvolvido em MySQL para gerenciamento de uma oficina

O sistema possui controle de:

- Clientes
- Veículos
- Mecânicos
- Serviços
- Ordens de Serviço

---

# Tecnologias

- MySQL
- SQL

---

#  Estrutura do Banco

## Tabelas

- clientes
- veiculos
- mecanicos
- servicos
- ordem_servicos
- itens_servicos

---

#  Relacionamentos

- Um cliente pode ter vários veículos
- Um veículo pode possuir várias ordens de serviço
- Um mecânico pode realizar várias ordens
- Uma ordem pode conter vários serviços

---

#  Como Executar

1. Abra o MySQL Workbench
2. Execute o arquivo `.sql`
3. Utilize o banco `oficina`
