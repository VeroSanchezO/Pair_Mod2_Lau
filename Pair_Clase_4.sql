CREATE SCHEMA tienda_zapatillas;
USE tienda_zapatillas;
 
CREATE TABLE clientes(
	id_cliente INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(45) NOT NULL,
    numero_telefono INT NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45) NULL,
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(45) NOT NULL,
	PRIMARY KEY (id_cliente)
    );

CREATE TABLE empleados(
	id_empleado INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT NULL,
    fecha_incorporacion DATE NOT NULL,
    PRIMARY KEY (id_empleado)
    );

CREATE TABLE zapatillas(
	id_zapatilla INT NOT NULL AUTO_INCREMENT,
	modelo VARCHAR(45) NOT NULL,
    color VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_zapatilla)
    );

CREATE TABLE facturas(
	id_factura INT NOT NULL AUTO_INCREMENT,
    numero_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatilla INT NOT NULL,
    id_empleado INT NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id_factura),
    CONSTRAINT fk_zapatillas
		FOREIGN KEY (id_zapatilla) 
        REFERENCES zapatillas(id_zapatilla),
	CONSTRAINT fk_empleados
		FOREIGN KEY (id_empleado) 
        REFERENCES empleados(id_empleado),
	CONSTRAINT fk_clientes
		FOREIGN KEY (id_cliente) 
        REFERENCES clientes(id_cliente)
        ); 
        
	
ALTER TABLE zapatillas
	ADD COLUMN marca VARCHAR(45) NOT NULL,
    ADD COLUMN talla INT NOT NULL;

ALTER TABLE empleados  
	MODIFY COLUMN salario FLOAT NOT NULL; 

ALTER TABLE clientes
	DROP COLUMN pais;
    
ALTER TABLE facturas
	ADD COLUMN total FLOAT;
    
INSERT INTO zapatillas (modelo, color, marca, talla)
VALUES ('XQYUN', 'Negro', 'Nike', 42),
('UOPMN', 'Rosas', 'Nike', 39),
('OPNYT', 'Verdes', 'Adidas', 35);

INSERT INTO empleados (nombre, tienda, salario, fecha_incorporacion)
VALUES ('Laura', 'Alcobendas', 25987, '2010-09-03'),
('Maria', 'Sevilla', 0, '2021-04-11'),
('Ester', 'Oviedo', 30165.98, '2000-11-29');

INSERT INTO clientes (numero_telefono, email, direccion, ciudad, provincia, codigo_postal)
VALUES ('Monica', 123456728, 'monica@email.com', 'Calle Felicidad', 'Móstoles', 'Madrid', '28176'),
('Lorena', 289345678, 'lorena@email.com', 'Calle Alegria', 'Barcelona', 'Barcelona', '12346'),
('Carmen', 298463759, 'carmen@email.com', 'Calle del Color', 'Vigo', 'Pontevedra', '23456');