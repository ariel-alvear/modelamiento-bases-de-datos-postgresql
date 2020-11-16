CREATE DATABASE workers;

CREATE TABLE departaments_table(
    id SERIAL,
    departament_name VARCHAR(200),
    PRIMARY KEY (id)
);

CREATE TABLE workers_table(
    id INT, --en este campo va el rut
    worker_name VARCHAR(40),
    worker_lastname VARCHAR(40),
    direction VARCHAR(200),
    departament_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (departament_id) REFERENCES departaments_table(id)
);

CREATE TABLE salaries_table(
    id INT,
    worker_dni INT,
    PRIMARY KEY (id),
    FOREIGN KEY (worker_dni) REFERENCES workers_table(id)
);

CREATE TABLE drive_files_table(
    id INT,
    file_name VARCHAR(20) UNIQUE,
    salary_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (salary_id) REFERENCES salaries_table(id)
);

ALTER TABLE salaries_table
ADD drive_file VARCHAR(20);

ALTER TABLE salaries_table
ADD CONSTRAINT drive_file
FOREIGN KEY (drive_file) 
REFERENCES drive_files_table(file_name);
