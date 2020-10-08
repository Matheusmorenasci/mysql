CREATE DATABASE carros;
USE carros;

CREATE TABLE marca (
	codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(200) NOT NULL,
	pais VARCHAR(20) NOT NULL
);

CREATE TABLE modelo (
	codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(200) NOT NULL,
	categoria VARCHAR(100) NOT NULL,
	cor VARCHAR(100) NOT NULL,
	codigo_marca INT NOT NULL
);

ALTER TABLE modelo
	ADD CONSTRAINT FK_marca
	FOREIGN KEY (codigo_marca)
	REFERENCES marca (codigo);
	
INSERT INTO marca (nome, pais) VALUES ('Volkswagen', 'Alemanha'), ('Ford', 
'EUA'), ('Fiat', 'Itália'), ('GM', 'EUA');

INSERT INTO modelo (nome, categoria, cor, codigo_marca) VALUES ('Gol', 'Hatch', 
'preto', 1), ('Palio', 'Hatch', 'vermelho', 3), ('Ecosport', 'SUV', 'azul', 2), 
('Fox', 'Família', 'preto', 1);

UPDATE modelo SET cor='cinza' WHERE codigo = 4;

SELECT ma.nome, ma.pais, COUNT(mo.codigo_marca) AS qtd_carros
FROM marca AS ma
LEFT JOIN modelo AS mo
ON ma.codigo = mo.codigo_marca
GROUP BY ma.nome

DELETE FROM marca WHERE codigo = 4;
