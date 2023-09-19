CREATE DATABASE BD_BIBLIOTECA
USE BD_BIBLIOTECA

CREATE TABLE ALUMNO
(
Cve_matricula VARCHAR (10),
Nombre_alu VARCHAR (50),
Telefono VARCHAR (10),
Grupo VARCHAR(50),
CONSTRAINT pk_codalum PRIMARY KEY (Cve_matricula)
)

CREATE TABLE LIBRO
(
  Cve_libro VARCHAR (5),
  Titulo VARCHAR (30),
  Cod_edit1 VARCHAR (10),
  Cod_autor2 VARCHAR (10),
  Cod_gen3 VARCHAR (10),
   CONSTRAINT pk_codlibro PRIMARY KEY (Cve_libro),
   CONSTRAINT fk_edit1 FOREIGN KEY (Cod_edit1) REFERENCES EDITORIAL (Cod_edit),
   CONSTRAINT fk_autor FOREIGN KEY (Cod_autor2) REFERENCES AUTOR (Cod_autor),
   CONSTRAINT fk_gen FOREIGN KEY (Cod_gen3) REFERENCES Género (Cod_gen)
)


CREATE TABLE prestamos
(
	Fecha_prestamo VARCHAR(10),
	Dias_prestados VARCHAR(5),
	Fecha_entrega VARCHAR(10),
	Cve_libro1 VARCHAR(5),
	Cve_matricula2 VARCHAR(10),
	CONSTRAINT pf_1 PRIMARY KEY (Fecha_prestamo),
	CONSTRAINT fk_2 FOREIGN KEY (Cve_libro1) REFERENCES libro (Cve_libro),
	CONSTRAINT fk_3 FOREIGN KEY (Cve_matricula2) REFERENCES alumno (Cve_matricula)
)

CREATE TABLE EDITORIAL
(
  Cod_edit VARCHAR (10),
  Nombre_edit VARCHAR (30),
  CONSTRAINT pk_codedit PRIMARY KEY (Cod_edit)
)

CREATE TABLE AUTOR
(
 Cod_autor VARCHAR (10),
 Nombre_autor VARCHAR (30),
  CONSTRAINT pk_codautor PRIMARY KEY (Cod_autor)
)

CREATE TABLE Género
(
  Cod_gen VARCHAR (10),
  Clasificacion VARCHAR (30),
   CONSTRAINT pk_codgen PRIMARY KEY (Cod_gen)
)


INSERT INTO ALUMNO VALUES 
('COM12KL1','Gabriel Hernandez','331 466 212','PROGRAMACION-A'),
('COM13KL2','Sofia Trejo','351 423 124','3°PGA-A'),
('COM14KL3','Lucero Mendoza','352 421 222','PROGRAMACION-A'),
('COM15KL4','Andres Montes','444 222 134','2°PGA-A'),
('COM16KL5','Camilo Herrera','441 222 153','PROGRAMACION-A'),
('COM17KL6','Andrea Mata','623 141 789','1°PGA-B'),
('COM18KL7','Carlos Lugo','721 824 321','3°PGA-B'),
('COM19KL8','Estefania Herrera','932 721 111','PROGRAMACION-A'),
('COM20KL9','Juan Pérez','111 222 333','PROGRAMACION-A'),
('COM21KL10','Mateo Lopez','433 563 999','1°PGA-a')

 SELECT*FROM alumno
 
 INSERT INTO libro VALUES 
 ('P01','Dracula','33QSL','PSQT1','MST71'),
 ('P02','Somos nuestro cerebro','34QSL','PSQT2','MST73'),
 ('P03','El ascenso del hombre','35QSL','PSQT3','MST75'),
 ('P04','El jinete de bronce','36QSL','PSQT4','MST80'),
 ('P05','El amor en tiempo de colera','37QSL','PSQT5','MST78'),
 ('P06','La casa infernal','38QSL','PSQT6','MST76'),
 ('P07','Romeo y Julieta','39QSL','PSQT7','MST77'),
 ('P08','Grandes esperanzas','40QSL','PSQT8','MST74'),
 ('P09','Dune','41QSL','PSQT9','MST72'),
  ('P10','Yo,Robot','42QSL','PSQT10','MST79')
  
  SELECT*FROM libro 
  
  
  INSERT INTO prestamos VALUES 
 ('2022/04/14','8','2022/04/23','P03','COM13KL2'),
 ('2022/04/17','10','2022/04/27','P07','COM14KL3'),
 ('2022/04/18','9','2022/04/27','P08','COM12KL1'),
 ('2022/04/19','3','2022/04/22','P10','COM16KL5'),
 ('2022/05/15','1','2022/05/22','P02','COM15KL4'),
 ('2022/06/19','5','2022/06/24','P09','COM20KL9'),
 ('2022/06/22','15','2022/07/27','P05','COM17KL6'),
 ('2022/07/21','7','2022/07/28','P06','COM19KL8'),
 ('2022/07/22','8','2022/04/27','P04','COM18KL7'),
 ('2022/07/25','10','2022/04/27','P01','COM21KL10')

   SELECT*FROM prestamos
   
   INSERT INTO Autor VALUES 
('PSQT1','Martín lopez'),
('PSQT2','Rosa Moreno'),
('PSQT3','Maria hernandez'),
('PSQT4','Juana perez'),
('PSQT5','Lucia Mendez'),
('PSQT6','Mariana Herrera'),
('PSQT7','Luciana Gonzales'),
('PSQT8','Macrina Mendoza'),
('PSQT9','Hector Hurtado'),
('PSQT10','Javier Mora')
SELECT*
FROM autor

   INSERT INTO Género VALUES 
   ('MST71','Terror'),
  ('MST72','Romantisismo'),
  ('MST73','Ciencia'),
 ('MST74','Historia'),
 ('MST75','Suspenso'),
 ('MST76','Ciencia ficcion'),
 ('MST77','Comedia'),
 ('MST78','Drama'),
 ('MST79','Biologia'),
 ('MST80','Informatica')
 SELECT*FROM género
 
 INSERT INTO Editorial VALUES 
('33QSL','Queretaro'),
('34QSL','Quintanarro'),
('35QSL','Mexico'),
('36QSL','España'),
('37QSL','Portugal'),
('38QSL','Toluca'),
('39QSL','Colima'),
('40QSL','Monte carlo'),
('41QSL','Peru'),
('42QSL','Japon')
SELECT*FROM editorial

DROP DATABASE BD_BIBLIOTECA

/*qUE LIBROS TIENEN PRESTADOS LOS ALUMNOS DE PROGRAMCION*/
SELECT Titulo, Grupo
FROM alumno INNER JOIN prestamos  
ON  prestamos.Cve_matricula2 = alumno.Cve_matricula
INNER JOIN libro
ON prestamos.Cve_Libro1 = libro.Cve_Libro
WHERE alumno.Grupo = 'PROGRAMACION-A'


 /* LIBRO,AUTOR,EDITORIAL,GENERO Y ALUMNO Q TIENEN PRESTADO EL LIBRO DE COMEDIA*/
SELECT Titulo,Nombre_autor,Nombre_edit,Clasificacion,Nombre_alu
FROM libro INNER JOIN autor
ON libro.Cod_autor2 = autor.Cod_autor
INNER JOIN editorial
ON libro.Cod_edit1 = editorial.Cod_edit
INNER JOIN Género
ON libro.Cod_gen3 = Género.Cod_gen
INNER JOIN prestamos
ON prestamos.cve_libro1 = libro.cve_libro
INNER JOIN alumno
ON prestamos.cve_matricula2 = alumno.Cve_matricula
WHERE Género.clasificacion = 'Comedia'

/*QUÉ LIBROS TIENEN MAS DE 8 DIAS PRESTADOS*/

SELECT Titulo,Dias_prestados,Nombre_alu
FROM  libro INNER JOIN prestamos
ON libro.cve_libro = prestamos.Cve_libro1
INNER JOIN alumno 
ON prestamos.Cve_matricula2 = alumno.Cve_matricula
WHERE prestamos.Dias_prestados='8'

SELECT Titulo,Dias_prestados,Nombre_alu
FROM  libro INNER JOIN prestamos
ON libro.cve_libro = prestamos.Cve_libro1
INNER JOIN alumno 
ON prestamos.Cve_matricula2 = alumno.Cve_matricula
WHERE prestamos.Dias_prestados='9'

SELECT Titulo,Dias_prestados,Nombre_alu
FROM  libro INNER JOIN prestamos
ON libro.cve_libro = prestamos.Cve_libro1
INNER JOIN alumno 
ON prestamos.Cve_matricula2 = alumno.Cve_matricula
WHERE prestamos.Dias_prestados='10'

SELECT Titulo,Dias_prestados,Nombre_alu
FROM  libro INNER JOIN prestamos
ON libro.cve_libro = prestamos.Cve_libro1
INNER JOIN alumno 
ON prestamos.Cve_matricula2 = alumno.Cve_matricula
WHERE prestamos.Dias_prestados='15'

 /* QUÉ ALUMNOS TIENEN LIBROS CON MENOS 8 DIAS DE PRESTAMO*/
SELECT Titulo,Dias_prestados,Nombre_alu
FROM  libro INNER JOIN prestamos
ON libro.cve_libro = prestamos.Cve_libro1
INNER JOIN alumno 
ON prestamos.Cve_matricula2 = alumno.Cve_matricula
WHERE prestamos.Dias_prestados='1'

SELECT Titulo,Dias_prestados,Nombre_alu
FROM  libro INNER JOIN prestamos
ON libro.cve_libro = prestamos.Cve_libro1
INNER JOIN alumno 
ON prestamos.Cve_matricula2 = alumno.Cve_matricula
WHERE prestamos.Dias_prestados='3'

SELECT Titulo,Dias_prestados,Nombre_alu
FROM  libro INNER JOIN prestamos
ON libro.cve_libro = prestamos.Cve_libro1
INNER JOIN alumno 
ON prestamos.Cve_matricula2 = alumno.Cve_matricula
WHERE prestamos.Dias_prestados='5'

SELECT Titulo,Dias_prestados,Nombre_alu
FROM  libro INNER JOIN prestamos
ON libro.cve_libro = prestamos.Cve_libro1
INNER JOIN alumno 
ON prestamos.Cve_matricula2 = alumno.Cve_matricula
WHERE prestamos.Dias_prestados='7'

/* QUÉ LIBROS,QUÉ ALUMNOS,GÉNERO FUERON PRESTADOS DESDE ABRIL HASTA JUNIO*/
SELECT Titulo,nombre_alu,clasificacion,fecha_prestamo
FROM libro INNER JOIN género 
ON libro.cod_gen3 = género.Cod_gen
INNER JOIN prestamos 
ON libro.cve_libro = prestamos.cve_libro1
INNER JOIN alumno
ON prestamos.cve_matricula2= alumno.cve_matricula
WHERE prestamos.Fecha_prestamo

SELECT Titulo,nombre_alu,clasificacion,fecha_prestamo
FROM libro INNER JOIN género 
ON libro.cod_gen3 = género.Cod_gen
INNER JOIN prestamos 
ON libro.cve_libro = prestamos.cve_libro1
INNER JOIN alumno
ON prestamos.cve_matricula2= alumno.cve_matricula
WHERE prestamos.Fecha_prestamo='2022/04/14'

SELECT Titulo,nombre_alu,clasificacion,fecha_prestamo
FROM libro INNER JOIN género 
ON libro.cod_gen3 = género.Cod_gen
INNER JOIN prestamos 
ON libro.cve_libro = prestamos.cve_libro1
INNER JOIN alumno
ON prestamos.cve_matricula2= alumno.cve_matricula
WHERE prestamos.Fecha_prestamo='2022/04/17'

SELECT Titulo,nombre_alu,clasificacion,fecha_prestamo
FROM libro INNER JOIN género 
ON libro.cod_gen3 = género.Cod_gen
INNER JOIN prestamos 
ON libro.cve_libro = prestamos.cve_libro1
INNER JOIN alumno
ON prestamos.cve_matricula2= alumno.cve_matricula
WHERE prestamos.Fecha_prestamo='2022/04/18'

SELECT Titulo,nombre_alu,clasificacion,fecha_prestamo
FROM libro INNER JOIN género 
ON libro.cod_gen3 = género.Cod_gen
INNER JOIN prestamos 
ON libro.cve_libro = prestamos.cve_libro1
INNER JOIN alumno
ON prestamos.cve_matricula2= alumno.cve_matricula
WHERE prestamos.Fecha_prestamo='2022/04/19'

SELECT Titulo,nombre_alu,clasificacion,fecha_prestamo
FROM libro INNER JOIN género 
ON libro.cod_gen3 = género.Cod_gen
INNER JOIN prestamos 
ON libro.cve_libro = prestamos.cve_libro1
INNER JOIN alumno
ON prestamos.cve_matricula2= alumno.cve_matricula
WHERE prestamos.Fecha_prestamo='2022/05/15'


SELECT Titulo,nombre_alu,clasificacion,fecha_prestamo
FROM libro INNER JOIN género 
ON libro.cod_gen3 = género.Cod_gen
INNER JOIN prestamos 
ON libro.cve_libro = prestamos.cve_libro1
INNER JOIN alumno
ON prestamos.cve_matricula2= alumno.cve_matricula
WHERE prestamos.Fecha_prestamo='2022/06/19'

SELECT Titulo,nombre_alu,clasificacion,fecha_prestamo
FROM libro INNER JOIN género 
ON libro.cod_gen3 = género.Cod_gen
INNER JOIN prestamos 
ON libro.cve_libro = prestamos.cve_libro1
INNER JOIN alumno
ON prestamos.cve_matricula2= alumno.cve_matricula
WHERE prestamos.Fecha_prestamo='2022/06/22'




