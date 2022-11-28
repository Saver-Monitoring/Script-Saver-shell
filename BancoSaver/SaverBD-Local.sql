-- Script: Projeto grupo 4 P&I 
-- Saver

-- Usar banco de dados:
-- create database saver;
use saver;

-- Criação da tabela 'Empresa':
create table empresa (
idEmpresa int primary key auto_increment,
nome varchar (45) not null,
cnpj char (14) not null,
email varchar(50) not null,
senha varchar(45) not null,
cep char (8),
rua varchar (50),
numero int
);

-- Criação da tabela 'Usuário':
create table usuario (
idUsuario int primary key auto_increment,
nomeUsuario varchar (20) not null,
email varchar (60) not null,
senha varchar (45) not null,
cargo varchar(50) not null,
fkEmpresa int,
fkAdministrador int,
foreign key (fkEmpresa) references empresa(idEmpresa),
foreign key (fkAdministrador) references usuario(idUsuario)
);

-- Criação da tabela 'Rack':
create table rack (
idRack int primary key auto_increment,
nome varchar (45),
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa)
);

-- Criação da tabela 'Acesso':
create table acesso (
fkUsuario int,
fkEmpresa int,
fkRack int,
dataHora datetime default current_timestamp,
foreign key (fkUsuario) references usuario(idUsuario),
foreign key (fkEmpresa) references empresa(idEmpresa),
foreign key (fkRack) references rack(idRack)
);

-- Criação da tabela 'Computador':
create table computador (
idComputador int primary key auto_increment,
fkRack int,
sistOperacional varchar (45),
processador varchar (45), 
qtdRAM int,
qtdHDD int,
foreign key (fkRack) references rack(idRack)
);

-- Criação da tabela 'Histórico dados':
create table historicoDados (
idDados int primary key auto_increment,
fkComputador int,
fkRack int,
temperatura double,
usoRAM double,
usoCPU double,
usoHDD double,
dataHora datetime default current_timestamp,
foreign key (fkComputador) references computador(idComputador),
foreign key (fkRack) references rack(idRack)
);

-- Criação da tabela 'Limites':
create table limite (
idLimite int primary key auto_increment,
limRAM double,
limHDD double,
limCPU double,
fkComputador int,
fkRack int,
foreign key (fkComputador) references computador(idComputador),
foreign key (fkRack) references rack(idRack)
);