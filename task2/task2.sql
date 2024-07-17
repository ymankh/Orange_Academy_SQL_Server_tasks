create database School;

create table
    teachers (
        id int primary key identity (1, 1),
        name varchar(150),
    );

create table
    teacherDetails (
        id int primary key,
        birthDate DATE,
        address varchar(150),
        salary decimal,
        degree varchar(50),
        teacherId int unique,
        foreign key (teacherId) REFERENCES teachers (id) ON DELETE CASCADE
    );

create table
    courses (
        id int primary key,
        name varchar(50),
        teacherId int,
        foreign key (teacherId) REFERENCES teachers (id),
    );

create table
    students (
        id int primary key,
        name varchar(50),
        section varchar(50),
        grade varchar(50),
    );

create table
    studentsCourses (
        studentId int,
        courseId int,
        primary key (studentId, courseId),
        foreign key (studentId) REFERENCES students (id),
        foreign key (courseId) REFERENCES courses (id)
    )
INSERT INTO
    teachers (name)
VALUES
    ('Ayman Jaradat'),
    ('Dima Maree'),
    ('Lujian Azaam');

INSERT INTO
    teacherdetails (id, birthdate, address, salary, degree, teacherId)
VALUES
    (
        1,
        '1998-05-10',
        '123 Elm Street',
        550.00,
        'Masters',
        1
    ),
    (
        2,
        '1998-08-01',
        '456 Oak Street',
        650.00,
        'Engineer',
        2
    ),
    (
        3,
        '1998-08-18',
        '789 Pine Street',
        650.00,
        'Masters',
        3
    );

INSERT INTO
    courses (id, name, teacherId)
VALUES
    (1, 'Mathematics', 1),
    (2, 'Science', 2),
    (3, 'History', 3);

INSERT INTO
    students (id, name, section, grade)
VALUES
    (1, 'Michael Green', 'A', '10'),
    (2, 'Sarah White', 'B', '11'),
    (3, 'David Black', 'A', '12');

INSERT INTO
    studentsCourses (studentId, courseId)
VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (2, 3),
    (3, 1),
    (3, 3);

select * from courses;
select * from teachers;
select
    C.name as "Course Name",
    T.name as "Teacher Name",
    TD.salary as "Salary"
from
    courses C
    join teachers T on T.id = C.teacherId
    join teacherDetails TD on TD.teacherId = C.teacherId;