CREATE DATABASE LibraryManagement;

USE LibraryManagement;

CREATE TABLE Authors
(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50),
    birth_date DATE,
    death_date DATE,
    nationality VARCHAR(50),
    bio VARCHAR(500)
);

CREATE TABLE Books
(
    id INT PRIMARY KEY IDENTITY(1,1),
    title VARCHAR(50) NOT NULL,
    publisher VARCHAR(50),
    yearPublished INT,
    numberOfCopies INT,
    authorId INT,
    FOREIGN KEY (authorId) REFERENCES Authors (id)
);

CREATE TABLE section
(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
);

CREATE TABLE book_categories
(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
	section_id INT NOT NULL
	foreign key (section_id) REFERENCES section
);

CREATE TABLE book_category_books
(
    bookId INT,
    categoryId INT,
    FOREIGN KEY (bookId) REFERENCES Books (id),
    FOREIGN KEY (categoryId) REFERENCES book_categories (id)
);

CREATE TABLE users
(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    membership_type VARCHAR(50)
);

CREATE TABLE employees
(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary INT,
    employment_type VARCHAR(50)
);

CREATE TABLE borrowed_books
(
    id INT PRIMARY KEY IDENTITY(1,1),
    book_id INT,
    user_id INT,
    borrowed_date DATE,
    due_date DATE,
    return_date DATE,
    lateness_fee DECIMAL(6,2),
    FOREIGN KEY (book_id) REFERENCES Books (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);


-- Insert data into Authors
INSERT INTO Authors (name, address, birth_date, death_date, nationality, bio)
VALUES 
('Naguib Mahfouz', 'Cairo, Egypt', '1911-12-11', '2006-08-30', 'Egyptian', 'Egyptian writer who won the Nobel Prize in Literature.'),
('Gibran Khalil Gibran', 'Bsharri, Lebanon', '1883-01-06', '1931-04-10', 'Lebanese', 'Lebanese-American writer, poet, and visual artist.'),
('Taha Hussein', 'Maghagha, Egypt', '1889-11-14', '1973-10-28', 'Egyptian', 'Pioneer of modern Arabic literature.'),
('Nizar Qabbani', 'Damascus, Syria', '1923-03-21', '1998-04-30', 'Syrian', 'Renowned Syrian diplomat and poet.');

-- Insert data into Books
INSERT INTO Books (title, publisher, yearPublished, numberOfCopies, authorId)
VALUES 
('The Cairo Trilogy', 'Dar Al-Shorouk', 1956, 7, 1),
('The Prophet', 'Knopf', 1923, 5, 2),
('The Days', 'Dar Al-Hilal', 1929, 10, 3),
('You Are Mine', 'Naufal', 1994, 8, 4),
('Miramar', 'Dar Al-Maaref', 1967, 6, 1),
('Broken Wings', 'Naufal', 1912, 4, 2);

-- Insert data into section
INSERT INTO section (name)
VALUES 
('Literature'),
('Philosophy'),
('Egyptian Literature'),
('Lebanese Literature'),
('Syrian Literature'),
('Modern Poetry'),
('Classical Philosophy');

-- Insert data into book_categories
INSERT INTO book_categories (name, section_id)
VALUES 
('Fiction', 1),
('Philosophy', 2),
('Poetry', 1),
('Biography', 1),
('Drama', 1);

-- Insert data into book_category_books
INSERT INTO book_category_books (bookId, categoryId)
VALUES 
(1, 1),
(2, 2),
(2, 3),
(3, 4),
(4, 3),
(5, 1),
(6, 1);

-- Insert data into users
INSERT INTO users (name, email, membership_type)
VALUES 
('Ahmad Al-Farsi', 'ahmad.alfarsi@example.com', 'Regular'),
('Layla Al-Hassan', 'layla.alhassan@example.com', 'Premium'),
('Mona Youssef', 'mona.youssef@example.com', 'Regular'),
('Youssef Al-Salem', 'youssef.alsalem@example.com', 'Premium'),
('Fatima Zahran', 'fatima.zahran@example.com', 'Regular');

-- Insert data into employees
INSERT INTO employees (name, department, salary, employment_type)
VALUES 
('Omar Khaled', 'IT', 500, 'Full-Time'),
('Sara Ibrahim', 'HR', 450, 'Part-Time'),
('Hassan Al-Badr', 'Admin', 400, 'Full-Time'),
('Nour Hanif', 'Library Management', 550, 'Full-Time'),
('Rana Saleh', 'Customer Service', 420, 'Part-Time');

-- Insert data into borrowed_books
INSERT INTO borrowed_books (book_id, user_id, borrowed_date, due_date, return_date, lateness_fee)
VALUES 
(1, 1, '2024-07-01', '2024-07-15', NULL, 0),
(2, 2, '2024-07-05', '2024-07-19', NULL, 0),
(3, 3, '2024-07-08', '2024-07-22', '2024-07-21', 0),
(4, 4, '2024-07-10', '2024-07-24', '2024-07-26', 1.50),
(5, 5, '2024-07-12', '2024-07-26', NULL, 0),
(6, 1, '2024-07-14', '2024-07-28', NULL, 0),
(1, 2, '2024-07-16', '2024-07-30', '2024-08-01', 2.00),
(3, 3, '2024-07-18', '2024-08-01', NULL, 0);


SELECT B.title, C.name as category from Books B 
Left join book_category_books BC on BC.bookId = B.id 
join book_categories C on C.id = categoryId;


-- list off barrowd books
select Distinct b.title as title from books B 
join borrowed_books BB on BB.book_id = B.id

-- List of not returned books
select Distinct b.title as 'Not returned books' from books B 
join borrowed_books BB on BB.book_id = B.id  
Where BB.return_date is Null

-- List of not returned books
select Distinct b.title as 'Not returned books' from books B 
Right join borrowed_books BB on BB.book_id = B.id  

