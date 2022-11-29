 use turmaX;

 create table ordem_compra.fornecedor(
	cd_fornecedor int primary key identity (1,1),
	nm_fornecedor varchar(50) not null
);

create table ordem_compra.material(
	cd_material int primary key identity (1,1),
	nm_material varchar(50) not null,
	ds_material varchar(100)
);

create table ordem_compra.ordemcompra(
	cd_ordem_compra int primary key identity (1,1),
	dt_emissao_ordem_compra date not null,
	cd_fornecedor int not null,
	foreign key (cd_fornecedor) references
		ordem_compra.fornecedor(cd_fornecedor)
);

create table ordem_compra.itemordemcompra(
	cd_ordem_compra int not null,
	cd_material int not null,
	qt_material decimal(5,2) not null,
	vl_material money not null,
	primary key (cd_ordem_compra, cd_material),
	foreign key (cd_ordem_compra) references
		ordem_compra.ordemcompra(cd_ordem_compra),
	foreign key (cd_material) references
		ordem_compra.material(cd_material)
);