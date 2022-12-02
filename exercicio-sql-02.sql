USE turma X;

CREATE SCHEMA escola;

CREATE TABLE escola.disciplina(
	cd_disciplina int primary key,
	nm_disciplina varchar(100),
	cd_escola int
);

CREATE TABLE escola.historico(
	foreign key (cd_matricula_aluno) references
		escola.aluno (cd_matricula_aluno),
	foreign key (nm_disciplina) references
		escola.disciplina(nm_disciplina),
	qt_nota_exame_final decimal
);

CREATE TABLE escola.aluno(
	cd_matricula_aluno int primary key,
	nm_aluno varchar(100)
);

CREATE TABLE escola.escola(
	cd_escola int primary key,
	sg_escola varchar(100),
	nm_escola varchar(100)
);

CREATE TABLE escola.docente(
	cd_docente int primary key,
	sg_escola varchar(100),
	dt_admissao_docente date,
	cd_escola int
);