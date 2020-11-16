CREATE DATABASE workers;

CREATE TABLE departaments_table(
    id SERIAL,
    departament_name VARCHAR(200),
    PRIMARY KEY (id)
);

CREATE TABLE workers_table(
    id VARCHAR(10), --en este campo va el rut, SIN PUNTOS Y CON GUION
    worker_name VARCHAR(40),
    worker_lastname VARCHAR(40),
    direction VARCHAR(200),
    departament_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (departament_id) REFERENCES departaments_table(id)
);

CREATE TABLE salaries_table(
    id SERIAL,
    worker_dni VARCHAR(10),
    PRIMARY KEY (id),
    FOREIGN KEY (worker_dni) REFERENCES workers_table(id)
);

CREATE TABLE drive_files_table(
    id SERIAL,
    file_name VARCHAR(30) UNIQUE,
    salary_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (salary_id) REFERENCES salaries_table(id)
);

ALTER TABLE salaries_table
ADD drive_file VARCHAR(30);

ALTER TABLE salaries_table
ADD CONSTRAINT drive_file
FOREIGN KEY (drive_file) 
REFERENCES drive_files_table(file_name);


--ahora agregaremos datos falsos para probar que este todo OK.
--3 registros en tabla departamentos
INSERT INTO departaments_table (departament_name) VALUES ('Finanzas');
INSERT INTO departaments_table (departament_name) VALUES ('Soporte');
INSERT INTO departaments_table (departament_name) VALUES ('Gerencia Comercial');

--3 registro en tabla trabajadores
INSERT INTO workers_table (id, worker_name, worker_lastname, direction, departament_id) VALUES ('17700000-1', 'juan', 'perez', 'bustamente 48, santiago centro', 1);
INSERT INTO workers_table (id, worker_name, worker_lastname, direction, departament_id) VALUES ('17700000-2', 'juan pablo', 'pereira', 'el golf 50, las condes', 2);
INSERT INTO workers_table (id, worker_name, worker_lastname, direction, departament_id) VALUES ('17700000-3', 'tomas', 'hernandez', 'salesianos 300, san miguel', 3);

--3 registros en tabla salarios
INSERT INTO salaries_table (worker_dni) VALUES ('17700000-1');
INSERT INTO salaries_table (worker_dni) VALUES ('17700000-2');
INSERT INTO salaries_table (worker_dni) VALUES ('17700000-3');

--3 registros en tabla archivos
INSERT INTO drive_files_table(file_name) VALUES ('sueldo_marzo_17700000-1');
INSERT INTO drive_files_table(file_name) VALUES ('sueldo_marzo_17700000-2');
INSERT INTO drive_files_table(file_name) VALUES ('sueldo_marzo_17700000-3');

--3 registros para terminar actualizar la tabla salarios
UPDATE salaries_table drive_file SET drive_file='sueldo_marzo_17700000-1' WHERE id=1;
UPDATE salaries_table drive_file SET drive_file='sueldo_marzo_17700000-2' WHERE id=2;
UPDATE salaries_table drive_file SET drive_file='sueldo_marzo_17700000-3' WHERE id=3;


--3 registros para actualizar la tabla archivos
UPDATE drive_files_table salary_id SET salary_id=1 WHERE id=1;
UPDATE drive_files_table salary_id SET salary_id=2 WHERE id=2;
UPDATE drive_files_table salary_id SET salary_id=3 WHERE id=3;

--revisamos
SELECT * FROM departaments_table;
SELECT * FROM workers_table;
SELECT * FROM salaries_table;
SELECT * FROM drive_files_table;
