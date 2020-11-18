CREATE DATABASE workers;

CREATE TABLE departaments_table(
    id SERIAL,
    departament_name VARCHAR(200),
    PRIMARY KEY (id)
);

CREATE TABLE workers_table(
    id SERIAL,
    rut VARCHAR(10), --en este campo va el rut, SIN PUNTOS Y CON GUION
    worker_name VARCHAR(40),
    direction VARCHAR(200),
    departament_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (departament_id) REFERENCES departaments_table(id)
);

CREATE TABLE salaries_table(
    id SERIAL,
    worker_dni VARCHAR(10),
    drive_file VARCHAR(30),
    PRIMARY KEY (id),
    FOREIGN KEY (worker_dni) REFERENCES workers_table(id)
);


--ahora agregaremos datos falsos para probar que este todo OK.
--3 registros en tabla departamentos
INSERT INTO departaments_table (departament_name) VALUES ('Finanzas');
INSERT INTO departaments_table (departament_name) VALUES ('Soporte');
INSERT INTO departaments_table (departament_name) VALUES ('Gerencia Comercial');

--3 registro en tabla trabajadores
INSERT INTO workers_table (rut, worker_name, direction, departament_id) VALUES ('17700000-1', 'juan', 'bustamente 48, santiago centro', 1);
INSERT INTO workers_table (rut, worker_name, direction, departament_id) VALUES ('17700000-2', 'juan pablo', 'el golf 50, las condes', 2);
INSERT INTO workers_table (rut, worker_name, direction, departament_id) VALUES ('17700000-3', 'tomas', 'salesianos 300, san miguel', 3);

--3 registros en tabla salarios
INSERT INTO salaries_table (worker_dni, drive_file) VALUES (1, 'sueldo_marzo_17700000-1');
INSERT INTO salaries_table (worker_dni, drive_file) VALUES (1, 'sueldo_abril_17700000-1');
INSERT INTO salaries_table (worker_dni, drive_file) VALUES (1, 'sueldo_mayo_17700000-1');
INSERT INTO salaries_table (worker_dni, drive_file) VALUES (2, 'sueldo_marzo_17700000-2');
INSERT INTO salaries_table (worker_dni, drive_file) VALUES (3, 'sueldo_marzo_17700000-3');


--revisamos
SELECT * FROM departaments_table;
SELECT * FROM workers_table;
SELECT * FROM salaries_table;
