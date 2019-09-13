	use master
Go

	drop database tabelarelacionada
Go

	create database tabelarelacionada
Go

	use tabelarelacionada
Go



create table tb_vendas(
       id_venda int primary key IDENTITY(1,1),
       id_cliente int not null,
	   id_itens_vendidos int not null,
       data date not null,
       desconto decimal(2,2))
GO
create table tb_clientes(
       id_cliente int PRIMARY KEY IDENTITY(1,1),
       nome nvarchar(80) not null,
       endereco nvarchar(120),
       idade int NOT NULL,
       sexo char(1) NOT NULL,
       fone nvarchar(9),
       email nvarchar(80),)
GO
create table tb_itens_vendidos(
       id_itens_vendidos int PRIMARY KEY identity(1,1),
       id_produto int not null,
       id_hardware int not null,
       qtde_item int not null,
       pco_vda decimal(8,2) not null)
GO
create table tb_vendas_canceladas(
       id_vendacancelada int PRIMARY KEY identity(1,1),
       id_itens_vendidos int not null,)
GO
create table tb_produtos(
       id_produto int PRIMARY KEY IDENTITY(1,1),
       descricao nvarchar(80) not null,
       preco_unit decimal NOT NULL,
       qtde_atual int NOT NULL,
       qtde_minima int,)
GO
alter table tb_itens_vendidos
      ADD CONSTRAINT fk_id_produto
      FOREIGN KEY (id_produto) REFERENCES tb_produtos(id_produto)
	  go

	  alter table tb_vendas
      ADD CONSTRAINT fk_id_itens_vendidos
      FOREIGN KEY (id_itens_vendidos) REFERENCES tb_itens_vendidos(id_itens_vendidos)
	  go

	  alter table tb_clientes
      ADD CONSTRAINT fk_id_cliente
      FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
	  go

	  alter table tb_vendas_canceladas
      ADD CONSTRAINT fk_itens_vendidos
      FOREIGN KEY (id_itens_vendidos) REFERENCES tb_itens_vendidos(id_itens_vendidos)
	  go
