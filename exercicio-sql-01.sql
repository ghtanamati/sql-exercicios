USE turma X;

CREATE SCHEMA despachante;

CREATE TABLE despachante.proprietario(
	cd_cpf_proprietario varchar(100) primary key,
	nm_proprietario varchar(100)
);

CREATE TABLE despachante.veiculo(
	cd_veiculo varchar(100) primary key,
	nm_veiculo varchar(100),
	cd_cpf_proprietario varchar(100)
);

CREATE TABLE despachante.licenciamento(
	foreign key (cd_veiculo) references
		despachante.veiculo(cd_veiculo),
	dt_licenciamento date primary key,
	vl_licenciamento money
);