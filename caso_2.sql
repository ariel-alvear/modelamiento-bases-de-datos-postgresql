CREATE DATABASE califications;

CREATE TABLE class_groups_table(
    id SERIAL,
    class_name VARCHAR(30),
    PRIMARY KEY (id)
);

CREATE TABLE teacher_departaments_table(
    id SERIAL,
    departament_name VARCHAR(40),
    PRIMARY KEY (id)
);

CREATE TABLE teachers_table(
    id SERIAL,
    teacher_name VARCHAR(40),
    teacher_departament INT,
    PRIMARY KEY (id),
    FOREIGN KEY (teacher_departament) REFERENCES teacher_departaments_table(id)
);

CREATE TABLE students_table(
    id SERIAL,
    rut VARCHAR(10), --en este campo va el rut, SIN PUNTOS Y CON GUION
    student_name VARCHAR(40),
    student_class INT,
    PRIMARY KEY (id),
    FOREIGN KEY (student_class) REFERENCES class_groups_table(id)
);

CREATE TABLE tests_califications_table(
    test_id SERIAL,
    calification INT,
    evaluator_id INT,
    student_id INT,
    PRIMARY KEY (test_id),
    FOREIGN KEY (evaluator_id) REFERENCES teachers_table(id),
    FOREIGN KEY (student_id) REFERENCES students_table(id)
);


--agregaremos datos a las tablas para probar que estén OK
--3 registros en nombres curso
INSERT INTO class_groups_table (class_name) VALUES ('4º medio A');
INSERT INTO class_groups_table (class_name) VALUES ('5º básico C');
INSERT INTO class_groups_table (class_name) VALUES ('8º básico D');

--3 registros en nombres departamentos
INSERT INTO teacher_departaments_table (departament_name) VALUES ('Lenguaje');
INSERT INTO teacher_departaments_table (departament_name) VALUES ('Matemáticas');
INSERT INTO teacher_departaments_table (departament_name) VALUES ('Ciencias Sociales');

--3 registros en tabla de profesores
INSERT INTO teachers_table (rut, teacher_name, teacher_departament) VALUES ('10000000-1', 'julio', 1);
INSERT INTO teachers_table (rut, teacher_name, teacher_departament) VALUES ('10000000-2', 'agustin', 2);
INSERT INTO teachers_table (rut, teacher_name, teacher_departament) VALUES ('10000000-3', 'ximena', 3);

--3registros en tabla de estudiantes
INSERT INTO students_table (rut, student_name, student_class) VALUES ('20000000-1', 'juanito', 1);
INSERT INTO students_table (rut, student_name, student_class) VALUES ('20000000-2', 'hernan', 1);
INSERT INTO students_table (rut, student_name, student_class) VALUES ('20000000-3', 'luz', 1);

--3 registros en tabla de notas
INSERT INTO tests_califications_table (calification, evaluator_id, student_id) VALUES (7, 1, 1);
INSERT INTO tests_califications_table (calification, evaluator_id, student_id) VALUES (5, 1, 1);
INSERT INTO tests_califications_table (calification, evaluator_id, student_id) VALUES (6.5, 2, 3);




--verificaremos las tablas
SELECT * FROM teacher_departaments_table;
SELECT * FROM teachers_table;
SELECT * FROM tests_califications_table;
SELECT * FROM students_table;
SELECT * FROM class_groups_table;
