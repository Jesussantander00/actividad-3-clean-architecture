CREATE DATABASE actividad4;
CREATE DATABASE bd_grupo_xyz;
USE bd_grupo_xyz;
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(150)
);
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);
-- Insertar clientes
INSERT INTO clientes (nombre, correo, telefono, direccion)
VALUES 
('Ana Torres', 'ana@example.com', '3001234567', 'Cra 10 #20-30'),
('Luis Pérez', 'luis@example.com', '3017654321', 'Cl 45 #15-12');

-- Insertar productos
INSERT INTO productos (nombre, descripcion, precio)
VALUES 
('Laptop Lenovo', 'Portátil Core i5, 8GB RAM', 2500000),
('Mouse inalámbrico', 'Mouse óptico con batería recargable', 75000);

-- Insertar pedidos
INSERT INTO pedidos (cliente_id, producto_id, cantidad, fecha)
VALUES 
(1, 1, 1, '2025-07-08'),
(2, 2, 2, '2025-07-09');

SELECT * FROM clientes;

SELECT nombre AS Columna1, correo AS Columna2
FROM clientes;

SELECT COUNT(*) AS total_registros
FROM clientes;

CREATE TABLE investigador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO investigador (nombre, especialidad, email) VALUES
('Ana Pérez', 'Biología', 'ana@correo.com'),
('Luis Gómez', 'Química', 'luis@correo.com'),
('Sofía Ramírez', 'Física', 'sofia@correo.com');

SELECT * FROM investigador ORDER BY id DESC;

SELECT COUNT(*) AS EL_CONTEO FROM investigador;

CREATE TABLE productoinvestigacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    tipo VARCHAR(100),
    puntos INT
);
INSERT INTO productoinvestigacion (titulo, tipo, puntos) VALUES
('Artículo A', 'Artículo', 10),
('Libro B', 'Libro', 20),
('Informe C', 'Informe', 15);
 
SELECT SUM(puntos) AS LA_SUMATORIA
FROM productoinvestigacion;

SELECT AVG(puntos) AS El_PROMEDIO
FROM productoinvestigacion;

SELECT MAX(puntos) AS El_MAXIMO
FROM productoinvestigacion;

SELECT MIN(puntos) AS El_MINIMO
FROM productoinvestigacion;

SELECT CONCAT(nombre, ' - ', especialidad) AS VALORES_UNIDOS
FROM investigador;

SELECT 
    UPPER(nombre) AS EN_MAYUSCULA,
    LOWER(especialidad) AS EN_MINUSCULA
FROM investigador;


ALTER TABLE productoinvestigacion
ADD COLUMN fechaPublicacion DATE;
UPDATE productoinvestigacion
SET fechaPublicacion = '2023-05-20'
WHERE id = 1;

SELECT YEAR(fechaPublicacion) AS EL_AÑO
FROM productoinvestigacion;

ALTER TABLE productoinvestigacion
ADD COLUMN fechaPublicacion DATE;

UPDATE productoinvestigacion
SET fechaPublicacion = '2024-06-15'
WHERE id = 1;

UPDATE productoinvestigacion
SET fechaPublicacion = '2023-11-22'
WHERE id = 2;

UPDATE productoinvestigacion
SET fechaPublicacion = '2025-01-05'
WHERE id = 3;

SELECT 
    MONTH(fechaPublicacion) AS EL_MES
FROM productoinvestigacion;

SELECT 
    DAY(fechaPublicacion) AS EL_DIA
FROM productoinvestigacion;

SELECT 
    DATE_FORMAT(fechaPublicacion, '%d@%m@%Y') AS FECHA_RARA
FROM productoinvestigacion;

SELECT CURRENT_DATE() AS FECHA_ACTUAL;

ALTER TABLE productoinvestigacion
ADD COLUMN proyecto_id INT;
 
 SELECT 
  puntos + proyecto_id AS LA_SUMA,
  puntos - proyecto_id AS LA_RESTA,
  puntos * proyecto_id AS LA_MULTIPLICACION
FROM productoinvestigacion;
SET SQL_SAFE_UPDATES = 0;
UPDATE productoinvestigacion
SET proyecto_id = FLOOR(1 + (RAND() * 10));

SELECT 
  puntos + proyecto_id AS LA_SUMA,
  puntos - proyecto_id AS LA_RESTA,
  puntos * proyecto_id AS LA_MULTIPLICACION
FROM productoinvestigacion;

SELECT DISTINCT nombre FROM clientes;

SELECT DISTINCT tipo FROM productoinvestigacion;

SELECT * FROM investigador
WHERE id = 3; 

ALTER TABLE investigador ADD rol VARCHAR(50);
UPDATE investigador SET rol = 'Líder' WHERE id = 1;
UPDATE investigador SET rol = 'Colaborador' WHERE id = 2;
UPDATE investigador SET rol = 'Asistente' WHERE id = 3;
SELECT * FROM investigador
WHERE rol = 'Líder';

SELECT * FROM investigador
WHERE rol <> 'Líder';

UPDATE investigador SET grupo_id = 1 WHERE id = 1;
UPDATE investigador SET grupo_id = 3 WHERE id = 2;
UPDATE investigador SET grupo_id = 5 WHERE id = 3;

SELECT * FROM investigador WHERE grupo_id < 4;

SELECT * FROM investigador
WHERE grupo_id > 4;

SELECT * FROM investigador
WHERE grupo_id BETWEEN 2 AND 5;

SELECT * FROM investigador
WHERE rol IS NULL;

SELECT * FROM investigador
WHERE rol IS NOT NULL;

ALTER TABLE investigador ADD correo VARCHAR(100);
UPDATE investigador
SET especialidad = 'Biotecnología',
    email = 'cmartinez@example.com'
WHERE nombre = 'Carlos Martínez';
ALTER TABLE investigador DROP COLUMN correo;

SELECT * FROM investigador
WHERE nombre LIKE '%Martínez%';

INSERT INTO investigador (nombre, especialidad, email, grupo_id)
VALUES ('María González', 'Biología Molecular', 'maria@example.com', 2);

SELECT * FROM investigador
WHERE nombre LIKE 'Mar%';

SELECT * FROM investigador
WHERE rol LIKE '%dor';

SELECT * FROM investigador
WHERE rol IN ('Líder', 'Asistente', 'Investigador');

CREATE TABLE grupoinvestigacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    facultad VARCHAR(100),
    linea_investigacion VARCHAR(150)
);

INSERT INTO grupoinvestigacion (nombre, facultad, linea_investigacion)
VALUES 
('Grupo de Innovación', 'Ingeniería de Sistemas', 'IA y Big Data'),
('BioAvanzado', 'Biología', 'Biotecnología Molecular');

SELECT 
    I.*
FROM investigador I
JOIN grupoinvestigacion G ON I.grupo_id = G.id;

SELECT 
    I.*
FROM investigador I
LEFT JOIN grupoinvestigacion G ON I.grupo_id = G.id
WHERE G.id IS NULL;

SELECT 
    G.*
FROM grupoinvestigacion G
JOIN investigador I ON G.id = I.grupo_id;

-- Grupos relacionados con investigadores
INSERT INTO grupoinvestigacion (nombre, facultad, linea_investigacion)
VALUES 
('Grupo Alfa', 'Ingeniería', 'Inteligencia Artificial'),
('Grupo Beta', 'Ciencias', 'Bioinformática');

-- Grupos NO relacionados con ningún investigador
INSERT INTO grupoinvestigacion (nombre, facultad, linea_investigacion)
VALUES 
('Grupo Gamma', 'Educación', 'Didáctica de las Matemáticas'),
('Grupo Delta', 'Salud', 'Epidemiología y Salud Pública');

SELECT 
    G.*
FROM grupoinvestigacion G
LEFT JOIN investigador I ON G.id = I.grupo_id
WHERE I.id IS NULL;

SELECT 
    G.*
FROM grupoinvestigacion G
LEFT JOIN investigador I ON G.id = I.grupo_id
WHERE I.id IS NULL;

INSERT INTO proyectoinvestigacion (titulo, tipo, fechaInicio, fechaFin)
VALUES 
  ('Sistema de Monitoreo Ambiental', 'Investigación', '2024-01-10', '2024-06-30'),
  ('Aplicación Móvil Educativa', 'Desarrollo', '2024-02-01', '2024-07-15'),
  ('Estudio sobre Energía Solar', 'Investigación', '2024-03-05', '2024-08-20');

UPDATE productoinvestigacion
SET proyecto_id = 1
WHERE id = 1;

UPDATE productoinvestigacion
SET proyecto_id = 2
WHERE id = 2;

UPDATE productoinvestigacion
SET proyecto_id = 3
WHERE id = 3;
ALTER TABLE productoinvestigacion
ADD COLUMN investigador_id INT;
ALTER TABLE productoinvestigacion
ADD CONSTRAINT fk_investigador
FOREIGN KEY (investigador_id) REFERENCES investigador(id);
UPDATE productoinvestigacion SET investigador_id = 1 WHERE id = 1;
UPDATE productoinvestigacion SET investigador_id = 2 WHERE id = 2;
UPDATE productoinvestigacion SET investigador_id = 3 WHERE id = 3;

SELECT 
    I.id AS id_investigador,
    I.nombre AS nombre_investigador,
    P.id AS id_producto,
    PR.id AS id_proyecto,
    PR.titulo AS nombre_proyecto
FROM investigador I
JOIN productoinvestigacion P ON I.id = P.investigador_id
JOIN proyectoinvestigacion PR ON P.proyecto_id = PR.id;

SELECT 
    I.*, 
    PR.*
FROM investigador I
JOIN productoinvestigacion PI ON I.id = PI.investigador_id
JOIN proyectoinvestigacion PR ON PI.proyecto_id = PR.id
WHERE I.id = 5;







