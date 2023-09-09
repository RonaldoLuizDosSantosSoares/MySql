create table vendedor (
cd_vendedor int NOT NULL,
nm_vendedor varchar(40) DEFAULT NULL,
ds_endereco varchar(40) DEFAULT NULL,
cd_cpf decimal(11),
nm_cidade varchar(20) DEFAULT NULL,
nm_bairro varchar(20) DEFAULT NULL,
sg_estado char(2) DEFAULT NULL,
cd_telefone varchar(20) DEFAULT NULL,
ds_email varchar(80) DEFAULT NULL
);

ALTER TABLE vendedor
ADD CONSTRAINT PK_vendedor PRIMARY KEY (cd_vendedor);

create table estado (
sg_estado char(2) NOT NULL,
nm_estado varchar(20) DEFAULT NULL
);

ALTER TABLE estado
ADD CONSTRAINT PK_estado PRIMARY KEY (sg_estado);

create table cidade (
cd_cidade int NOT NULL,
nm_cidade varchar(20) DEFAULT NULL,
sg_estado char(2) NOT NULL
);

ALTER TABLE cidade
ADD CONSTRAINT PK_cidade PRIMARY KEY (cd_cidade,sg_estado);


create table bairro (
cd_bairro int NOT NULL,
nm_bairro varchar(20) DEFAULT NULL,
cd_cidade int NOT NULL,
sg_estado char(2) NOT NULL
);

ALTER TABLE bairro
ADD CONSTRAINT PK_bairro PRIMARY KEY (cd_bairro,cd_cidade,sg_estado);


create table faixa_imovel (
cd_faixa int NOT NULL,
nm_faixa varchar(30) DEFAULT NULL,
vl_maximo decimal(10,2),
vl_minimo decimal(10,2)
);

ALTER TABLE faixa_imovel
ADD CONSTRAINT PK_faixa_imovel PRIMARY KEY (cd_faixa);

create table comprador (
cd_comprador int NOT NULL,
nm_comprador varchar(40) DEFAULT NULL,
ds_endereco varchar(40) DEFAULT NULL,
nm_cidade varchar(20) DEFAULT NULL,
nm_bairro varchar(20) DEFAULT NULL,
sg_estado varchar(2) DEFAULT NULL,
cd_telefone varchar(20) DEFAULT NULL,
ds_email varchar(80) DEFAULT NULL,
cd_cpf decimal(11)
);

ALTER TABLE comprador
ADD CONSTRAINT PK_comprador PRIMARY KEY (cd_comprador);

create table imovel (
cd_imovel int NOT NULL,
cd_vendedor int NOT NULL,
cd_bairro int NOT NULL,
cd_cidade int NOT NULL,
sg_estado char(2) DEFAULT NULL,
ds_endereco varchar(40) DEFAULT NULL,
qt_areautil decimal(10,2) NOT NULL,
qt_areatotal decimal(10,2) NOT NULL,
ds_imovel varchar(300) DEFAULT NULL,
vl_preco decimal (10,2),
qt_ofertas int,
ic_vendido char(1) DEFAULT NULL,
dt_lancto date DEFAULT NULL,
qt_imovelindicado int
);

ALTER TABLE imovel
ADD CONSTRAINT PK_imovel PRIMARY KEY (cd_imovel);

create table oferta (
cd_comprador int NOT NULL,
cd_imovel int NOT NULL,
vl_oferta decimal (10,2),
dt_oferta date
);

ALTER TABLE cidade
ADD CONSTRAINT FK_sg_estado FOREIGN KEY (sg_estado) REFERENCES estado (sg_estado);

ALTER TABLE bairro
ADD CONSTRAINT FK_cd_cidade FOREIGN KEY(cd_cidade,sg_estado) REFERENCES cidade(cd_cidade,sg_estado);

ALTER TABLE oferta
ADD CONSTRAINT FK_oferta_imovel FOREIGN KEY (cd_imovel) REFERENCES imovel (cd_imovel);

ALTER TABLE oferta
ADD CONSTRAINT FK_oferta_comprador FOREIGN KEY (cd_comprador) REFERENCES comprador (cd_comprador);

insert into estado(sg_estado, nm_estado) values ('SP','SÃO PAULO');
insert into estado(sg_estado, nm_estado) values ('RJ','RIO DE JANEIRO');

insert into cidade(cd_cidade, nm_cidade, sg_estado) values (1,'SÃO PAULO','SP');
insert into cidade(cd_cidade, nm_cidade, sg_estado) values (2,'SANTO ANDRÉ','SP');
insert into cidade(cd_cidade, nm_cidade, sg_estado) values (3,'CAMPINAS','SP');
insert into cidade(cd_cidade, nm_cidade, sg_estado) values (1,'RIO DE JANEIRO','RJ');
insert into cidade(cd_cidade, nm_cidade, sg_estado) values (2,'NITEROI', 'RJ');

insert into bairro(cd_bairro, nm_bairro, cd_cidade, sg_estado) values (1,'JARDINS',1,'SP');
insert into bairro(cd_bairro, nm_bairro, cd_cidade, sg_estado) values (2,'MORUMBI',1,'SP');
insert into bairro(cd_bairro, nm_bairro, cd_cidade, sg_estado) values (3,'AEROPORTO',1,'SP');
insert into bairro(cd_bairro, nm_bairro, cd_cidade, sg_estado) values (1,'AEROPORTO',1,'RJ');
insert into bairro(cd_bairro, nm_bairro, cd_cidade, sg_estado) values (2,'NITEROI',2,'SP');

insert into vendedor(cd_vendedor, nm_vendedor, ds_endereco, ds_email) values (1,'MARIA DA SILVA','RUA DO GRITO,45','msilva@nova.com');
insert into vendedor(cd_vendedor, nm_vendedor, ds_endereco, ds_email) values (2,'MARIA DA SILVA','AV. DA SAUDADE,325','mandrade@nova.com');
insert into vendedor(cd_vendedor, nm_vendedor, ds_endereco, ds_email) values (3,'ANDRÉ CARDOSO','AV. BRASIL,401','acardoso@nova.com');
insert into vendedor(cd_vendedor, nm_vendedor, ds_endereco, ds_email) values (4,'TATIANA SOUZA','RUA DO IMPERADOR,778','tsouza@nova.com');

insert into imovel(cd_imovel, cd_vendedor, cd_bairro, cd_cidade, sg_estado, ds_endereco, qt_areautil, qt_areatotal, vl_preco) values (1, 1, 1, 1,'SP','AL. TIETE, 3304/101', 250, 400, 180000);
insert into imovel(cd_imovel, cd_vendedor, cd_bairro, cd_cidade, sg_estado, ds_endereco, qt_areautil, qt_areatotal, vl_preco) values (2, 1, 2, 1,'SP','AV. MORUMBI, 2230', 150, 250, 135000);
insert into imovel(cd_imovel, cd_vendedor, cd_bairro, cd_cidade, sg_estado, ds_endereco, qt_areautil, qt_areatotal, vl_preco) values (3, 2, 1, 1,'RJ','R. GAL. OSORIO, 445/34', 250, 400, 185000);
insert into imovel(cd_imovel, cd_vendedor, cd_bairro, cd_cidade, sg_estado, ds_endereco, qt_areautil, qt_areatotal, vl_preco) values (4, 2, 2, 2,'RJ','R. D. PEDRO I, 882', 120, 200, 110000);
insert into imovel(cd_imovel, cd_vendedor, cd_bairro, cd_cidade, sg_estado, ds_endereco, qt_areautil, qt_areatotal, vl_preco) values (5, 3, 3, 1,'SP','AV. RUBEN BERTA, 2355', 110, 200, 95000);
insert into imovel(cd_imovel, cd_vendedor, cd_bairro, cd_cidade, sg_estado, ds_endereco, qt_areautil, qt_areatotal, vl_preco) values (6, 4, 1, 1,'RJ','R. GETULIO VARGAS, 552', 200, 300, 99000);

insert into comprador(cd_comprador, nm_comprador, ds_endereco, ds_email) values (1, 'EMMANUEL ANTUNES', 'R. SARAIVA,452','eantunes@nova.com');
insert into comprador(cd_comprador, nm_comprador, ds_endereco, ds_email) values (2, 'JOANA PEREIRA', 'AV. PORTUGAL,52','jpereira@nova.com');
insert into comprador(cd_comprador, nm_comprador, ds_endereco, ds_email) values (3, 'RONALDO CAMPELO', 'R. ESTADOS UNIDOS,13','rcampelo@nova.com');
insert into comprador(cd_comprador, nm_comprador, ds_endereco, ds_email) values (4, 'MANFRED AUGUSTO', 'AV. BRASIL,351','maugusto@nova.com');

insert into oferta(cd_comprador, cd_imovel, vl_oferta, dt_oferta) values (1, 1, 170000, '10/01/09');
insert into oferta(cd_comprador, cd_imovel, vl_oferta, dt_oferta) values (1, 3, 180000, '10/01/09');
insert into oferta(cd_comprador, cd_imovel, vl_oferta, dt_oferta) values (2, 2, 135000, '15/01/09');
insert into oferta(cd_comprador, cd_imovel, vl_oferta, dt_oferta) values (2, 4, 100000, '15/02/09');
insert into oferta(cd_comprador, cd_imovel, vl_oferta, dt_oferta) values (3, 1, 160000, '05/01/09');
insert into oferta(cd_comprador, cd_imovel, vl_oferta, dt_oferta) values (3, 2, 140000, '20/02/09');

UPDATE imovel SET vl_preco = (vl_preco * 0.10 + vl_preco);
UPDATE imovel SET vl_preco = ((vl_preco) - (vl_preco * 0.05)) where cd_vendedor = 1;

UPDATE oferta SET vl_oferta = (vl_oferta * 0.05 + vl_oferta) where cd_comprador = 2;
UPDATE oferta SET vl_oferta = 101000 where cd_comprador = 2 and cd_imovel = 4;

UPDATE comprador SET ds_endereco = 'R. ANANÁS, 45',sg_estado = 'RJ' where cd_comprador = 3;

DELETE FROM oferta where cd_comprador = 3 and cd_imovel = 1;
DELETE FROM cidade where cd_cidade = 3 and sg_estado = 'SP';

insert into faixa_imovel(cd_faixa, nm_faixa, vl_minimo, vl_maximo) values (1,'BAIXO',0,105000);
insert into faixa_imovel(cd_faixa, nm_faixa, vl_minimo, vl_maximo) values (2,'MÉDIO',105001,180000);
insert into faixa_imovel(cd_faixa, nm_faixa, vl_minimo, vl_maximo) values (3,'ALTO',180001,999999);

-- Select * FROM imovel;
-- Select * FROM comprador;
-- Select * FROM oferta;
-- Select * FROM vendedor;
-- Select * FROM estado;
-- Select * FROM cidade;
-- Select * FROM bairro;
-- Select * FROM faixa_imovel;

-- Lista 3
-- 1 -- Select cd_comprador, nm_comprador, ds_email from comprador;
-- 2 -- Select cd_vendedor, nm_vendedor, ds_email from vendedor order by nm_vendedor desc;
-- 3 -- Select cd_imovel, cd_vendedor, vl_preco from imovel where cd_vendedor = 2;
-- 4 -- Select cd_imovel, cd_vendedor, vl_preco, sg_estado from imovel where vl_preco<150000 and sg_estado = 'RJ';
-- 5 -- Select cd_imovel, cd_vendedor, vl_preco, sg_estado from imovel where vl_preco<150000 and cd_vendedor != 2;
-- 6 -- Select cd_comprador, nm_comprador, ds_endereco, sg_estado from comprador where sg_estado is null;
-- 7 -- Select vl_oferta from oferta where vl_oferta >=100000 and vl_oferta <=150000;
-- 8 -- Select * from oferta where dt_oferta between '01/01/2009' and '01/03/2009';
-- 9 -- Select nm_vendedor from vendedor where nm_vendedor like 'M%'
-- 10 -- Select nm_vendedor from vendedor where nm_vendedor like '%A';
-- 11 -- Select nm_comprador from comprador where nm_comprador like '%U%';
-- 12 -- Select * from imovel where cd_imovel = 2 or cd_imovel = 3 order by ds_endereco asc;
-- 13 -- Select * from oferta where cd_imovel = 2 or cd_imovel = 3 and vl_oferta >=140000 order by dt_oferta desc;
-- 14 -- Select * from imovel where (cd_vendedor = 4) or vl_preco >=110000 and vl_preco <=200000 order by qt_areautil asc;
-- 15 -- Select MAX(vl_oferta), MIN(vl_oferta), AVG(vl_oferta) from oferta;
-- 16 -- Select MAX(vl_preco), MIN(vl_preco), COUNT(vl_preco), AVG(vl_preco) from imovel;
-- 17 -- Select SUM(vl_oferta) from oferta Where year(dt_oferta) between 2008 and 2010;


-- Lista 4
-- 1 -- Select imovel.cd_imovel, vendedor.cd_vendedor, vendedor.nm_vendedor, vendedor.sg_estado FROM imovel INNER JOIN vendedor ON imovel.cd_vendedor = vendedor.cd_vendedor;
-- 2 -- Select comprador.cd_comprador, comprador.nm_comprador, oferta.cd_imovel, oferta.vl_oferta FROM comprador INNER JOIN oferta ON comprador.cd_comprador = oferta.cd_comprador;
-- 3 -- Select imovel.cd_imovel, imovel.vl_preco, imovel.cd_bairro FROM imovel INNER JOIN vendedor ON imovel.cd_vendedor = vendedor.cd_vendedor WHERE vendedor.cd_vendedor = 3;
-- 4 -- Select distinct cd_imovel FROM oferta;
-- 5 -- Select imovel.cd_imovel, oferta.vl_oferta FROM imovel LEFT JOIN oferta ON imovel.cd_imovel = oferta.cd_imovel;
-- 6 -- Select comprador.cd_comprador, comprador.nm_comprador, oferta.cd_imovel, oferta.vl_oferta FROM comprador LEFT JOIN oferta ON comprador.cd_comprador = oferta.cd_comprador;
-- 7 -- Select comprador.cd_comprador, comprador.nm_comprador, oferta.cd_imovel, oferta.vl_oferta from comprador LEFT JOIN oferta ON comprador.cd_comprador = oferta.cd_comprador;
-- 8 -- Select imovel.ds_endereco, imovel.sg_estado, imovel.cd_bairro, case when imovel.vl_preco < 100000 then 'Preço Baixo' when imovel.vl_preco >= 100000 and imovel.vl_preco <= 500000 then 'Preço Médio' else 'Preço Alto' end as price_level from imovel;*/
-- 9 -- Select vendedor.nm_vendedor, COUNT(*) as total_de_propriedades from imovel INNER JOIN vendedor ON imovel.cd_vendedor = vendedor.cd_vendedor group by vendedor.nm_vendedor order by total_de_propriedades desc;
-- 10 -- Select MAX(vl_preco) - MIN(vl_preco) as diferenca_de_preco from imovel;
-- 11 -- Select imovel.cd_vendedor, MIN(vl_preco) as Menor_preco from imovel where vl_preco >= 10000 group by imovel.cd_vendedor;
-- 12 -- Select oferta.cd_comprador, comprador.nm_comprador, AVG(oferta.vl_oferta) as Média_do_valor_das_ofertas, COUNT(oferta.cd_imovel) as Número_de_ofertas from comprador LEFT JOIN oferta ON comprador.cd_comprador = oferta.cd_comprador group by oferta.cd_comprador, comprador.nm_comprador;

-- Lista 5
-- 1 -- Select * from imovel where cd_bairro = (Select cd_bairro from imovel where cd_imovel = 2) and cd_imovel != 2;
-- 2 -- Select * from imovel where vl_preco > (Select AVG(vl_preco) from imovel);
-- 3 -- Select distinct comprador.* from comprador INNER JOIN oferta ON comprador.cd_comprador = oferta.cd_comprador where vl_oferta > 70000;
-- 4 -- Select * from oferta where vl_oferta > (Select AVG(vl_oferta) from oferta);
-- 5 -- Select * from imovel where vl_preco > (Select AVG(vl_preco) from imovel where cd_bairro = (Select cd_bairro from imovel where cd_imovel = 2));
-- 6 -- Select cd_bairro, MAX(vl_preco) AS Preço_alto from imovel group by cd_bairro having Preço_alto > (Select AVG(vl_preco) from imovel) order by Preço_alto desc;
-- 7 -- Select * from imovel where vl_preco = (Select MIN(vl_preco) from imovel where cd_vendedor = cd_vendedor) and cd_vendedor IN (Select cd_vendedor from vendedor);
-- 8 -- Select * from imovel where vl_preco = (Select MIN(vl_preco) from imovel where cd_vendedor != 3) and cd_vendedor != 3;
-- 9 -- Select * from oferta where vl_oferta < (Select MIN(vl_oferta) from oferta where cd_comprador = 2 and cd_imovel != oferta.cd_imovel) and cd_comprador != 2;
-- 10 -- Select * from imovel where sg_estado = (Select sg_estado from imovel where cd_vendedor = 3) and cd_cidade = (Select cd_cidade from imovel where cd_vendedor = 3) and cd_vendedor != 3;
-- 11 -- Select distinct cd_bairro from imovel where sg_estado = (Select sg_estado from imovel where cd_imovel = 5) and cd_cidade = (Select cd_cidade from imovel where cd_imovel = 5) and cd_bairro != (Select cd_bairro from imovel where cd_imovel = 5);