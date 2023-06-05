create table editoriales(
codigo varchar(50) not null primary key,
nombre varchar(100)not null
);

create table libros (
codigo varchar(50) not null primary key,
titulo varchar (50)not null,
codigo_editorial varchar(50) references editoriales(codigo)
);

--consulta tablas
select * from editoriales;
select * from libros;

--modifica columnas autor y precio
ALTER TABLE libros
ADD COLUMN autor VARCHAR(100),
ADD COLUMN precio DECIMAL(10,2)

INSERT INTO editoriales (codigo, nombre) VALUES ('Anaya', 'Anaya');
INSERT INTO editoriales (codigo, nombre) VALUES ('Andina', 'Andina');
INSERT INTO editoriales (codigo, nombre) VALUES ('S.M.', 'S.M.');

-- Insertar libros
INSERT INTO libros (codigo, titulo, codigo_editorial, autor, precio)
VALUES ('1', 'Don Quijote de La Mancha I', 'Anaya', 'Miguel de Cervantes', 150);
INSERT INTO libros (codigo, titulo, codigo_editorial, autor, precio)
VALUES ('2', 'El principito', 'Andina', 'Antoine Saint-Exupery', 120);
INSERT INTO libros (codigo, titulo, codigo_editorial, autor, precio)
VALUES ('3', 'El príncipe', 'S.M.', 'Maquiavelo', 180);
INSERT INTO libros (codigo, titulo, codigo_editorial, autor, precio)
VALUES ('4', 'Diplomacia', 'S.M.', 'Henry Kissinger', 170);
INSERT INTO libros (codigo, titulo, codigo_editorial, autor, precio)
VALUES ('5', 'Don Quijote de La Mancha II', 'Anaya', 'Miguel de Cervantes', 140);

--inserta nuevos libros

INSERT INTO libros (codigo, titulo, codigo_editorial, autor, precio)
VALUES ('6', 'Violeta', 'Anaya', 'isabel allende', 130);
INSERT INTO libros (codigo, titulo, codigo_editorial, autor, precio)
VALUES ('7', 'hijos sin padre', 'Andina', 'carlos pena', 170);

--

START TRANSACTION;

DELETE FROM libros WHERE codigo_editorial = 'Anaya';

ROLLBACK;
