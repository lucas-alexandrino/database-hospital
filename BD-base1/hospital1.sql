CREATE DATABASE hospital;

USE hospital;

CREATE TABLE IF NOT EXISTS pacientes (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    data_nascimento DATE,
    endereco VARCHAR(255),
	telefone integer(15),
    email VARCHAR(255),
    cpf VARCHAR(11) UNIQUE,
    rg VARCHAR(9) UNIQUE,
	convenio_id INTEGER UNIQUE
);

CREATE TABLE IF NOT EXISTS medicos (
	id INTEGER PRIMARY KEY AUTO_INCREMENT, 
	cpf INTEGER UNIQUE,
	nome VARCHAR(255),
	telefone INTEGER(15),
	especialidades VARCHAR(255)
);

CREATE TABLE  IF NOT EXISTS  consultas (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	data DATE UNIQUE,
	medico VARCHAR(255),
	paciente INTEGER,
	valor DECIMAL,
	convenio INTEGER,
	especialidade varchar(255),
    FOREIGN KEY (paciente) REFERENCES pacientes(id),
    FOREIGN KEY (convenio) REFERENCES pacientes(convenio_id)
);

CREATE TABLE  IF NOT EXISTS  receita_medica (
	id INTEGER PRIMARY KEY AUTO_INCREMENT, 
	medico VARCHAR(255), 
	medicamentos VARCHAR(255), 
	quantidade INTEGER, 
	instrucoes text,
	FOREIGN KEY (medico) REFERENCES medicos(cpf)
);

