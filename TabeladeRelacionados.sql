	use master
go

	drop database tabelarelacionada
go

	create database tabelarelacionada
go

	use tabelarelacionada
go



create table tabelavendas(
       id_venda int primary key IDENTITY(1,1),
       id_cliente int not null,
	   id_item_vendido int not null,
       data date not null,
       desconto decimal(2,2))
GO

create table tabelaclientes(
       id_cliente int PRIMARY KEY IDENTITY(1,1),
       nome nvarchar(80) not null,
       endereco nvarchar(120),
       idade int NOT NULL,
       sexo char(1) NOT NULL,
       fone nvarchar(9),
       email nvarchar(80),)
GO
create table tabeladeitensvendidos(
       id_item_vendido int PRIMARY KEY identity(1,1),
       id_produto int not null,
       id_hardware int not null,
       qtde_item int not null,
       pco_vda decimal(8,2) not null)
GO
create table tabeladevendascanceladas(
       id_vendacancelada int PRIMARY KEY identity(1,1),
       id_itemvendido int not null,)
GO
create table tabeladeprodutos(
       id_produto int PRIMARY KEY IDENTITY(1,1),
       descricao nvarchar(80) not null,
       preco_unit decimal NOT NULL,
       qtde_atual int NOT NULL,
       qtde_minima int,)
GO


alter table tabeladeitensvendidos
      ADD CONSTRAINT fk_id_produto
      FOREIGN KEY (id_produto) REFERENCES tb_produtos(id_produto)
	  go

	  alter table tabeladevendas
      ADD CONSTRAINT fk_id_item_vendido
      FOREIGN KEY (id_item_vendido) REFERENCES tb_itens_vendidos(id_item_vendido)
	  go

	  alter table tabeladeclientes
      ADD CONSTRAINT fk_id_cliente
      FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
	  go

	  alter table tabeladevendascanceladas
      ADD CONSTRAINT fk_item_vendido
      FOREIGN KEY (id_item_vendido) REFERENCES tb_itens_vendidos(id_item_vendido)
	  go

