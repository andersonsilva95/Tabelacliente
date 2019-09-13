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
       fone nvarchar(15),
       email nvarchar(80),)
GO
create table tb_itens_vendidos(
       id_itens_vendidos int PRIMARY KEY identity(1,1),
       id_produto int not null,
       id_hardware int null,
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



insert into tb_clientes (nome, endereco, idade, sexo, fone, email) values
	('André','Rua Sebastiao de assuncao',20,'M','(11)9999-9999','email@hotmail.com'),
	('Anderson','Diamante negro',30,'M','(11)8888-7777','gmail.@gmailcom'),
	('Patrique','Serra de Bragança',15,'M','(11)1111-2222','teuemail@gmail.com'),
	('Amanda','Itaipu',20,'F','(11)4444-6666','teste@hotmail.com');
	go
	
select *from tb_clientes 

go
insert into tb_produtos (descricao, preco_unit, qtde_atual, qtde_minima) values
	('Pen drive','35','20','10'),
	('memoria ram', '320','50','20'),
	('mouse','100','60','10');
	go
select *from tb_produtos
go

go
 insert into tb_itens_vendidos(id_produto,qtde_item,pco_vda) values
	('1','200','20'),
	('3','50','60'),
	('1','500','18');
	go
select *from tb_produtos
go

go
insert into tb_vendas (id_cliente,id_itens_vendidos,data,desconto) values
	('1','1','2010-10-10','10'),
	('3','1','2011-02-10','8'),
	('4','3','2012-01-03','5');
	go
	select *from tb_vendas
go