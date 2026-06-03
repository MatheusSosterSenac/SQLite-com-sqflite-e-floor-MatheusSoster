# controle_financeiro

Aluno: Matheus Henrique Soster

# Controle Financeiro

Aplicativo desenvolvido em Flutter utilizando SQLite e Floor para persistência local de dados financeiros.

## Descrição

O projeto tem como objetivo demonstrar a utilização do banco de dados SQLite em conjunto com o ORM Floor para armazenamento local de informações. A aplicação permite registrar lançamentos financeiros e exibi-los de forma dinâmica através do StreamBuilder.

## Funcionalidades Implementadas

* Cadastro de lançamentos financeiros
* Listagem automática de lançamentos com StreamBuilder
* Exclusão de lançamentos
* Relacionamento entre categorias e lançamentos utilizando chave estrangeira
* Persistência local de dados com SQLite
* Mapeamento ORM utilizando Floor
* Consulta SQL para cálculo de saldo total

## Estrutura do Banco de Dados

### Categoria

* id (PK)
* nome
* cor

### Lancamento

* id (PK)
* descricao
* valor
* tipo
* data
* categoriaId (FK)

## Relacionamento

Uma categoria pode possuir vários lançamentos, enquanto cada lançamento pertence a apenas uma categoria.

Categoria (1) → (N) Lancamento

## Tecnologias Utilizadas

* Flutter
* Dart
* SQLite
* Floor ORM
* StreamBuilder

## Autor

Matheus Henrique Soster
