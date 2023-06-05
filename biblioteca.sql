CREATE TABLE editoriales (
  codigo SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE libros (
  codigo SERIAL PRIMARY KEY,
  titulo VARCHAR(50) NOT NULL,
  codigo_editorial INT REFERENCES editoriales(codigo)
);

-- Consultar tablas
SELECT * FROM editoriales;
SELECT * FROM libros;

-- Insertar editoriales
INSERT INTO editoriales (nombre) VALUES ('Anaya');
INSERT INTO editoriales (nombre) VALUES ('Andina');
INSERT INTO editoriales (nombre) VALUES ('S.M.');

--update editoriales set nombre = 'andina' where codigo= 2;

-- Modificar columnas autor y precio
ALTER TABLE libros
ADD COLUMN autor VARCHAR(100),
ADD COLUMN precio DECIMAL(10,2);

-- Insertar libros
INSERT INTO libros (titulo, codigo_editorial, autor, precio)
VALUES ('Don Quijote de La Mancha I', 1, 'Miguel de Cervantes', 150),
       ('El principito', 2, 'Antoine Saint-Exupery', 120),
       ('El príncipe', 3, 'Maquiavelo', 180),
       ('Diplomacia', 3, 'Henry Kissinger', 170),
       ('Don Quijote de La Mancha II', 1, 'Miguel de Cervantes', 140);


--Insertar 2 nuevos libros

-- Insertar nuevos libros
INSERT INTO libros (codigo, titulo, codigo_editorial, autor, precio)
VALUES (6, 'Violeta', (SELECT codigo FROM editoriales WHERE nombre = 'Anaya'), 'isabel allende', 130);

INSERT INTO libros (codigo, titulo, codigo_editorial, autor, precio)
VALUES (7, 'hijos sin padre', (SELECT codigo FROM editoriales WHERE nombre = 'Andina'), 'carlos pena', 170);

-- Eliminar los libros de la editorial Anaya, solo en memoria (ROLLBACK)
BEGIN;
DELETE FROM libros
WHERE codigo_editorial = (SELECT codigo FROM editoriales WHERE nombre = 'Anaya');
ROLLBACK;

-- Actualizar el nombre de la editorial Andina a Iberlibro en memoria, y actualizar el nombre de la editorial S.M. a Mountain en disco duro (SAVEPOINT / ROLLBACK TO)
-- actualiza nombres editorial Andina
BEGIN;

SAVEPOINT actualizar_editoriales;
UPDATE editoriales
SET nombre = 'Iberlibro'
WHERE nombre = 'Andina';

SAVEPOINT actualizar_nombres;
UPDATE editoriales
SET nombre = 'Mountain'
WHERE nombre = 'S.M.';

COMMIT;

ROLLBACK TO actualizar_nombres;





