## Infra Challenge 20240202

Nesse desafio o objetivo é criar um servidor Ubuntu com Nginx na cloud AWS aplicando praticas de IaC e CI/DC.

Para alcansar o objetivo foram feitas algumas considerações de pre-existencia para aplicar o projeto.

VPC - Considerando que já exista uma VPC previamente criada vou chama-la de "main_vpc" com range de ip "10.0.0.0/16"

Subnet - considerando uma subnet no range "10.0.1.0/24"

Internet Gateway

Permissões AWS IAM

# Infraestrutura Como Código com Terraform e Ansible

Este repositório contém o código necessário para provisionar uma infraestrutura na AWS usando Terraform e configurar servidores usando Ansible a travez do Github Actions.

## Estrutura do Repositório

- **/terraform**: Contém todos os arquivos Terraform para provisionamento da infraestrutura, EC2 Ubuntu em uma instancia t3a.micro para produção, otimizando os custos.
- **/ansible**: Contém os playbooks e roles do Ansible para configuração do servidor.
- **/.github/workflows**: Contém os workflows do GitHub Actions para automação do Terraform e do Ansible.

## Como usar isoladamente

Para executar o Terraform:
1. Navegue até a pasta `terraform`.
2. Execute `terraform init` para inicializar o Terraform.
3. Execute `terraform plan` e `terraform apply` para aplicar as mudanças.

Para executar o Ansible:
1. Navegue até a pasta `ansible`.
2. Execute `ansible-playbook -i hosts playbooks/site.yml` para configurar os servidores.
Obs.: se faz necessario ajustar o arquivo hosts com o IP do servidor manualmente para esse teste isolado(Com o Github Action esse processo esta automatizado).

## Segurança

Estou usando GitHub Secrets para gerenciar credenciais e algumas variaveis.
