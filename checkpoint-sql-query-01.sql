USE turmaBenner;

CREATE SCHEMA locacao;

CREATE TABLE locacao.cliente(
	cd_cliente int primary key identity(1,1),
	nm_cliente varchar(50) not null
);

CREATE TABLE locacao.classificacao(
	cd_classificacao int primary key identity(1,1),
	vl_locacao_diaria money not null
);

CREATE TABLE locacao.categoria(
	sg_categoria char(1) primary key,
	nm_categoria varchar(30) not null
);

CREATE TABLE locacao.solicitacao(
	cd_solicitacao int primary key identity(1,1),
	cd_cliente int not null,
	dt_solicitacao date not null

	foreign key (cd_cliente) references locacao.cliente(cd_cliente)
		on delete cascade
		on UPDATE cascade
);

CREATE TABLE locacao.filme(
	cd_filme int primary key identity(1,1),
	nm_filme varchar(50) not null,
	sg_categoria char(1),
	cd_classificacao int,

	foreign key (sg_categoria) references locacao.categoria(sg_categoria)
		on delete set null
		on UPDATE cascade,

	foreign key (cd_classificacao) references locacao.classificacao(cd_classificacao)
		on delete set null
		on UPDATE cascade,
);

CREATE TABLE locacao.solicitacao_filme(
	cd_filme int not null,
	cd_solicitacao int not null,
	dt_devolucao_prevista date not null,
	dt_devolucao_real date,

	primary key(cd_filme, cd_solicitacao),

	foreign key(cd_filme) references locacao.filme(cd_filme)
		on delete cascade
		on UPDATE cascade,

	foreign key(cd_solicitacao) references locacao.solicitacao(cd_solicitacao)
		on delete cascade
		on UPDATE cascade,
);

begin transaction;

insert into locacao.categoria (sg_categoria, nm_categoria)
values ('D', 'Drama'), ('T', 'Terror'), ('S', 'Suspense'), ('C', 'Comedia'), ('R', 'Romance')

commit;

select * from locacao.categoria;


begin transaction;

insert into locacao.classificacao(vl_locacao_diaria)
values (0.99), (1.99), (2.99), (3.99)

commit;

select * from locacao.classificacao;


begin transaction;

insert into locacao.cliente(nm_cliente)
values ('Gustavo'), ('Gabriel'), ('Kauan'), ('Marcelo'), ('Erinaldo')

commit;

select * from locacao.cliente;


begin transaction;

insert into locacao.filme(nm_filme,sg_categoria, cd_classificacao)
values ('Operação Lava Jato', 'D', 1), ('11 Homens e 1 segredo', 'S', 2), ('O Exterminador do Futuro', 'R', 3), ('A Freira', 'T', 4), ('Os Trapalhões', 'C', 1)

commit;

select * from locacao.filme;


begin transaction;

insert into locacao.solicitacao(cd_cliente, dt_solicitacao)
values (1, '2022-01-16'), (2, '2022-01-16'), (3, '2022-01-16'), (4, '2022-01-16'), (5, '2022-01-16'), (1, '2022-01-20'), (2, '2022-01-20'), (3, '2022-01-20'), (4, '2022-01-20'), (5, '2022-01-20')

commit;

select * from locacao.solicitacao;


begin transaction;

insert into locacao.solicitacao_filme(cd_filme, cd_solicitacao, dt_devolucao_prevista, dt_devolucao_real)
values (11, 1, '2022-01-16', '2022-01-16'), (12, 1, '2022-01-16', '2022-01-16'), (13, 2, '2022-01-16', '2022-01-16'), (14, 2, '2022-01-16', '2022-01-16'), (15, 3, '2022-01-16', '2022-01-16'), (11, 3,  '2022-01-20', '2022-01-16'), (12, 4,  '2022-01-20', '2022-01-16'), (13, 4,  '2022-01-20', '2022-01-16'), (14, 5, '2022-01-20', '2022-01-16'), (15, 5, '2022-01-20', '2022-01-16'), (11, 6, '2022-01-16', '2022-01-16'), (12, 6, '2022-01-16', '2022-01-16'), (13, 7, '2022-01-16', '2022-01-16'), (14, 7,  '2022-01-16', '2022-01-16'), (15, 8, '2022-01-16', '2022-01-16'), (11, 8, '2022-01-20', '2022-01-16'), (12, 9,  '2022-01-20', '2022-01-16'), (13, 9, '2022-01-20', '2022-01-16'), (14, 10, '2022-01-20', '2022-01-16'), (15, 10, '2022-01-20', '2022-01-16')

commit;

select * from locacao.solicitacao_filme;