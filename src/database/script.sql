CREATE DATABASE individual;

USE individual;

CREATE TABLE cadastro(
idCadastro INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dtNasc DATE,
email VARCHAR(45),
telefone CHAR(14),
genero CHAR(8)
constraint chkGen CHECK(genero IN('Feminino')),
senha VARCHAR(255)
);

DESC cadastro;

CREATE TABLE historia(
idHistoria INT AUTO_INCREMENT,
fkUser INT,
constraint pkComposta PRIMARY KEY(idHistoria, fkUser),
dtAborto DATE,
tempo INT,
motivo VARCHAR(45),
descricao VARCHAR(200),
filhos CHAR(3)
constraint chkFilho CHECK(filhos IN('Sim', 'Não')),
repeticao CHAR(3)
constraint chkRep CHECK(repeticao IN('Sim', 'Não')),
autorizacao CHAR(3)
constraint chkAut CHECK(autorizacao IN('Sim', 'Não')),
constraint fkUserHist
FOREIGN KEY (fkUser) references cadastro(idCadastro)
);

DESC historia;

INSERT INTO cadastro (nome, dtNasc, email, telefone, genero, senha) VALUES
('Julia', '2005-03-02', 'julia@gmail.com', '(11)98765-4321', 'feminino', MD5('34@Teste'));

SELECT * FROM cadastro;

SELECT idCadastro, nome, dtNasc, email, telefone, genero FROM cadastro WHERE email = 'julia@gmail.com' AND senha = MD5('34@Teste');

select * from historia;