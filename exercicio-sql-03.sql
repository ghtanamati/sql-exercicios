USE turma X;

CREATE SCHEMA padaria;

CREATE TABLE padaria.filial(
	cd_filial int primary key,
	nm_filial varchar(100)
);

CREATE TABLE padaria.fornecedor(
	cd_fornecedor int primary key,
	nm_fornecedor varchar(100)
);

CREATE TABLE padaria.materiaprima(
	cd_materia_prima int primary key,
	nm_materia_prima varchar(100)
);

CREATE TABLE padaria.fornecimento(
	foreign key (cd_materia_prima) references
		padaria.materiaprima (cd_materia_prima),
	foreign key (cd_fornecedor) references
		padaria.fornecedor (cd_fornecedor),
);

CREATE TABLE padaria.forno(
	cd_forno int primary key,
	cd_filial int,
	qt_producao_forno decimal
);

CREATE TABLE padaria.tipoproduto(
	cd_tipoproduto int primary key,
	nm_produto varchar(100)
);

CREATE TABLE produto(
	foreign key (cd_forno) references
		padaria.forno (cd_forno),
	foreign key (cd_tipoproduto) references
		padaria.tipoproduto (cd_tipoproduto),
	dt_producao datetime primary key,
	dt_validade date
);

CREATE TABLE receita(
	foreign key (cd_tipoproduto) references
		padaria.tipoproduto (cd_tipoproduto),
	foreign key (cd_materia_prima) references
		padaria.materiaprima (cd_materia_prima),
	qt_materia_prima decimal
);