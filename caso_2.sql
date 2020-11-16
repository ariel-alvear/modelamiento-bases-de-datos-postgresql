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
    id VARCHAR(10), --en este campo va el rut, SIN PUNTOS Y CON GUION
    teacher_name VARCHAR(40),
    teacher_lastname VARCHAR(40),
    teacher_departament INT,
    PRIMARY KEY (id),
    FOREIGN KEY (teacher_departament) REFERENCES teacher_departaments_table(id)
);

CREATE TABLE tests_califications_table(
    test_id SERIAL,
    calification INT,
    evaluator_teacher VARCHAR(10),
    PRIMARY KEY (test_id),
    FOREIGN KEY (evaluator_teacher) REFERENCES teachers_table(id)
);


CREATE TABLE students_table(
    id VARCHAR(10), --en este campo va el rut, SIN PUNTOS Y CON GUION
    student_name VARCHAR(40),
    student_lastname VARCHAR(40),
    student_class INT,
    students_test INT,
    PRIMARY KEY (id),
    FOREIGN KEY (student_class) REFERENCES class_groups_table(id),
    FOREIGN KEY (students_test) REFERENCES tests_califications_table(test_id)
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
INSERT INTO teachers_table (id, teacher_name, teacher_lastname, teacher_departament) VALUES ('10000000-1', 'julio', 'rodriguez', 1);
INSERT INTO teachers_table (id, teacher_name, teacher_lastname, teacher_departament) VALUES ('10000000-2', 'agustin', 'hernandez', 2);
INSERT INTO teachers_table (id, teacher_name, teacher_lastname, teacher_departament) VALUES ('10000000-3', 'ximena', 'rojas', 3);

--3 registros en tabla de notas
INSERT INTO tests_califications_table (calification, evaluator_teacher) VALUES (7, '10000000-1');
INSERT INTO tests_califications_table (calification, evaluator_teacher) VALUES (5, '10000000-1');
INSERT INTO tests_califications_table (calification, evaluator_teacher) VALUES (6.5, '10000000-2');

--3registros en tabla de estudiantes
INSERT INTO students_table (id, student_name, student_lastname, student_class, students_test) VALUES ('20000000-1', 'juanito', 'perez', 1, 1);
INSERT INTO students_table (id, student_name, student_lastname, student_class, students_test) VALUES ('20000000-2', 'hernan', 'hernandez', 1, 2);
INSERT INTO students_table (id, student_name, student_lastname, student_class, students_test) VALUES ('20000000-3', 'luz', 'maria', 1, 3);

