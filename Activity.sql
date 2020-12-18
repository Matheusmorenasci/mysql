CREATE DATABASE cars;
USE cars;

CREATE TABLE brand (
	code INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(200) NOT NULL,
	country VARCHAR(20) NOT NULL
);

CREATE TABLE model (
	code INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(200) NOT NULL,
	category VARCHAR(100) NOT NULL,
	color VARCHAR(100) NOT NULL,
	brand_code INT NOT NULL
);

ALTER TABLE model
	ADD CONSTRAINT FK_brand
	FOREIGN KEY (brand_code)
	REFERENCES brand (code);
	
INSERT INTO brand (name, country) VALUES ('Volkswagen', 'Germany'), ('Ford', 
'USA'), ('Fiat', 'Italy'), ('GM', 'USA');

INSERT INTO model (name, category, color, brand_code) VALUES ('Gol', 'Hatch', 
'black', 1), ('Palio', 'Hatch', 'red', 3), ('Ecosport', 'SUV', 'blue', 2), 
('Fox', 'Family', 'black', 1);

UPDATE model SET color='gray' WHERE code = 4;

SELECT br.name, br.country, COUNT(mo.brand_code) AS qt_cars
FROM brand AS br
LEFT JOIN model AS mo
ON br.code = mo.brand_code
GROUP BY br.name

DELETE FROM brand WHERE codigo = 4;
