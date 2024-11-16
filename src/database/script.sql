CREATE DATABASE individual;

USE individual;

CREATE TABLE cadastro(
idCadastro INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dtNasc DATE,
email VARCHAR(45),
telefone CHAR(14),
genero CHAR(8)
constraint chkGen CHECK(genero IN('Feminino'))
);

DESC cadastro;

CREATE TABLE historia(
idHistoria INT,
fkUser INT,
constraint pkComposta PRIMARY KEY(idHistoria, fkUser),
dtAborto DATE,
tempo INT,
motivo VARCHAR(45),
descricao VARCHAR(200),
autorizacao CHAR(3)
constraint chkAut CHECK(autorizacao IN('Sim', 'Não')),
constraint fkUserHist
FOREIGN KEY (fkUser) references cadastro(idCadastro)
);

DESC historia;

SELECT * FROM cadastro;