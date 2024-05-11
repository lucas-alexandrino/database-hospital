CREATE DATABASE hospital;

USE hospital;

CREATE TABLE IF NOT EXISTS pacientes (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    data_nascimento DATE,
    endereco VARCHAR(255),
	telefone VARCHAR(15),
    email VARCHAR(255),
    cpf VARCHAR(15) UNIQUE,
    rg VARCHAR(10) UNIQUE,
	convenio_id INTEGER UNIQUE
);

CREATE TABLE IF NOT EXISTS medicos (
	id INTEGER PRIMARY KEY AUTO_INCREMENT, 
	cpf VARCHAR(15) UNIQUE,
	nome VARCHAR(255),
	telefone VARCHAR(15), 
	especialidades VARCHAR(255)
);

CREATE TABLE  IF NOT EXISTS  consultas (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	data DATE UNIQUE,
	medico INTEGER,
	paciente INTEGER,
	valor DECIMAL,
	convenio INTEGER,
	especialidade varchar(255),
    FOREIGN KEY (medico) REFERENCES medicos(id),
    FOREIGN KEY (paciente) REFERENCES pacientes(id),
    FOREIGN KEY (convenio) REFERENCES pacientes(convenio_id)
);

CREATE TABLE  IF NOT EXISTS  receita_medica (
	id INTEGER PRIMARY KEY AUTO_INCREMENT, 
	medico VARCHAR(255), 
	medicamentos VARCHAR(255), 
	quantidade VARCHAR(255), 
	instrucoes TEXT,
     FOREIGN KEY (medico) REFERENCES medicos(cpf)
);

DROP DATABASE hospital;


SELECT * FROM receita_medica;
SELECT * FROM medicos;
SELECT * FROM medicos WHERE cpf = 52911072343;
INSERT INTO receita_medica (medico,medicamentos,quantidade,instrucoes) VALUES ('52911072343','dipirona',10,'usar de vez em quando');
INSERT INTO receita_medica (medico,medicamentos,quantidade,instrucoes) VALUES ('5','dipirona',10,'usar de vez em quando');

INSERT INTO medicos (cpf,nome,telefone,especialidades) VALUES ('5','Joao da silva','119915387','Otorrinolaringologista');
INSERT INTO medicos (cpf,nome,telefone,especialidades) VALUES ('52911072343','JoaoZITO da silva','11989915347','Otorrinolaringologista,alguma outra');



