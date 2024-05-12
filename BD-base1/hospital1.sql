CREATE DATABASE hospital;
USE hospital;

DROP DATABASE hospital;

CREATE TABLE IF NOT EXISTS pacientes (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    data_nascimento DATE,
    endereco VARCHAR(255),
	telefone VARCHAR(15),
    email VARCHAR(255),
    cpf VARCHAR(15) UNIQUE,
    rg VARCHAR(10) UNIQUE,
	convenio_id VARCHAR(255) UNIQUE
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
	convenio VARCHAR(255),
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

CREATE TABLE IF NOT EXISTS  tipo_quarto (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(255),
	valor_diaria DECIMAL
);

CREATE TABLE IF NOT EXISTS quartos (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	tipo INTEGER,
    numero VARCHAR(255),
	FOREIGN KEY (tipo) REFERENCES tipo_quarto(id),
    INDEX (numero)
);

CREATE TABLE IF NOT EXISTS internacao (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	paciente INTEGER,
	medico INTEGER,
    quarto VARCHAR(255),
	data_entrada DATE,
	data_prev_alta DATE,
	data_alta DATE,
	procedimento TEXT,
    FOREIGN KEY (paciente) REFERENCES pacientes(id),
    FOREIGN KEY (medico) REFERENCES medicos(id),
    FOREIGN KEY (quarto) REFERENCES quartos(numero)
);

CREATE TABLE IF NOT EXISTS enfermeiro (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255),
	cpf VARCHAR(15) UNIQUE,
	cre VARCHAR(255) UNIQUE
);

-- TABELA PARA MUITOS
CREATE TABLE IF NOT EXISTS enfermeiro_internacao (
	enfermeiro_id INTEGER,
    internacao_id INTEGER,
    FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiro(id),
    FOREIGN KEY (internacao_id) REFERENCES internacao(id)
);



-- PERGUNTAR PROFESSOR : COMO REALIZAR UMA CONEXÃO MANY TO MANY NO BD, RELACIONADO A ENFERMEIRO E INTERNAÇÃO.
-- CONSULTA USANDO A TABELA ACIMA

-- SELECT enfermeiro.id,internacao.id
-- FROM enfermeiro
-- INNER JOIN enfermeiro_internacao ON enfermeiro.id = enfermeiro_internacao.enfermeiro_id
-- INNER JOIN internacao ON enfermeiro_internacao.internacao_id = internacao.id
-- WHERE enfermeiro.id = '1';
--

SELECT enfermeiro.id AS id_enfermeiro,internacao.id AS internacao_id
FROM enfermeiro
INNER JOIN enfermeiro_internacao ON enfermeiro.id = enfermeiro_internacao.enfermeiro_id
INNER JOIN internacao ON enfermeiro_internacao.internacao_id = internacao.id
WHERE enfermeiro.id = '1';

SELECT * FROM enfermeiro;
SELECT * FROM internacao;
SELECT * FROM internacao WHERE paciente = '1';
SELECT * FROM pacientes;
SELECT * FROM receita_medica;
SELECT * FROM medicos;
SELECT * FROM medicos WHERE cpf = 52911072343;
INSERT INTO receita_medica (medico,medicamentos,quantidade,instrucoes) VALUES ('52911072343','dipirona',10,'usar de vez em quando');
INSERT INTO receita_medica (medico,medicamentos,quantidade,instrucoes) VALUES ('5','dipirona',10,'usar de vez em quando');

INSERT INTO pacientes (nome,data_nascimento,endereco,telefone,email,cpf,rg,convenio_id) VALUES ('Paciente1','20040122','rua dos boboss','11989915357','lucas.alexalgooo@gmail.com','52311072857','574839157','140');
INSERT INTO pacientes (nome,data_nascimento,endereco,telefone,email,cpf,rg,convenio_id) VALUES ('Paciente2','20040122','rua dos boboss','11989915357','lucas.alexalgooo@gmail.com','52311072858','574838158','130');
INSERT INTO pacientes (nome,data_nascimento,endereco,telefone,email,cpf,rg,convenio_id) VALUES ('Paciente3','20040122','rua dos boboss','11989915357','lucas.alexalgooo@gmail.com','52311072859','574837159','120');
INSERT INTO pacientes (nome,data_nascimento,endereco,telefone,email,cpf,rg,convenio_id) VALUES ('Paciente4','20040122','rua dos boboss','11989915357','lucas.alexalgooo@gmail.com','52311072850','574837150','110');
INSERT INTO pacientes (nome,data_nascimento,endereco,telefone,email,cpf,rg,convenio_id) VALUES ('Paciente5','20040122','rua dos boboss','11989915357','lucas.alexalgooo@gmail.com','52311072819','574837111','0100');

INSERT INTO medicos (cpf,nome,telefone,especialidades) VALUES ('5','Joao da silva','119915387','Otorrinolaringologista');
INSERT INTO medicos (cpf,nome,telefone,especialidades) VALUES ('52911072343','JoaoZITO da silva','11989915347','Otorrinolaringologista,alguma outra');

INSERT INTO enfermeiro (nome,cpf,cre) VALUES ('Enfermeiro do SUS','52911072756','CRE123');
INSERT INTO enfermeiro_internacao (enfermeiro_id,internacao_id) VALUES ('1','5');

INSERT INTO tipo_quarto (descricao,valor_diaria) VALUES ('Tipo de quarto 1','200');
INSERT INTO quartos (tipo,numero) VALUES ('1','2');

INSERT INTO internacao (paciente,medico,quarto,data_entrada,data_prev_alta,data_alta,procedimento) VALUES ('1','1','2','20031023','20031123','20031201','procedimento da internacao');
INSERT INTO internacao (paciente,medico,quarto,data_entrada,data_prev_alta,data_alta,procedimento) VALUES ('2','2','2','20031023','20031123','20031201','procedimento da internacao');



