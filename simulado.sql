drop database simulado;

create database simulado;
use simulado;

create table tbl_deptos(
id_depto int auto_increment primary key,
nome_depto varchar (100),
gestor_depto varchar(100)
);

create table tbl_pessoas(
id_pessoa int auto_increment primary key,
nome_pessoa varchar (100),
nasc_pessoa date,
depto_pessoa int,
constraint foreign key (depto_pessoa) references tbl_deptos (id_depto)
);

insert into tbl_deptos (nome_depto, gestor_depto)values
('produtos', 'matheus melo'),
('T.I', 'adriana carvalho'),
('inovação', 'isaac ferreira'),
('R.H', 'michaela vicare'),
('operações', 'denise senise');

insert into tbl_pessoas (nome_pessoa, nasc_pessoa, depto_pessoa)values
('gabriel moura', '2000-08-15', 1),
('guilherme faria', '1986-12-19', 3),
('kelly silva','1977-01-30', 5),
('andrea paiva','1980-09-07', 4),
('ariele santos','2003-03-03',2);

update tbl_pessoas set nome_pessoa = 'Gabriel Silva' where id_pessoa =1;

select 		tbl_pessoas.nome_pessoa,
			tbl_deptos.nome_depto,
			tbl_pessoas.nasc_pessoa,
			tbl_deptos.gestor_depto
		
from   		tbl_pessoas
		
inner join 	tbl_deptos
on			tbl_deptos.id_depto = tbl_pessoas.depto_pessoa
   
order by gestor_depto   
;

select 		tbl_deptos.gestor_depto,
			tbl_pessoas.id_pessoa,
			tbl_pessoas.nome_pessoa,
			tbl_pessoas.nasc_pessoa,
			tbl_deptos.nome_depto

from   		tbl_pessoas

inner join 	tbl_deptos
on			tbl_deptos.id_depto = tbl_pessoas.depto_pessoa

where nome_pessoa not like '%m%' and gestor_depto not like '%o%' or id_depto = 1
;

alter table tbl_deptos rename column nome_depto to departamento; 

alter table tbl_deptos modify column gestor_depto varchar(261);

/*delete from tbl_deptos where id_depto = 5; */

update tbl_deptos set gestor_depto = "mikaela souza" where id_depto = 4;
