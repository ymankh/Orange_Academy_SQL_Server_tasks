create database BooksLibrary;
create table Books (
BookID int primary key,
Title varchar(50),
AuthorID int,
PublishedYear Date,
CopiesAvailable int,
BookCategory varchar(20)
);

create table Authors (
AuthorID int primary key,
FirstName varchar(50),
LastName varchar(50),
BirthYear Date
);

INSERT INTO Authors (AuthorID, FirstName, LastName, BirthYear) VALUES
(1, 'George', 'Orwell', '1903-06-25'),
(2, 'Jane', 'Austen', '1775-12-16'),
(3, 'Mark', 'Twain', '1835-11-30'),
(4, 'J.K.', 'Rowling', '1965-07-31'),
(5, 'William', 'Shakespeare', '1564-04-23'),
(6, 'Charles', 'Dickens', '1812-02-07'),
(7, 'F. Scott', 'Fitzgerald', '1896-09-24'),
(8, 'Ernest', 'Hemingway', '1899-07-21'),
(9, 'Leo', 'Tolstoy', '1828-09-09'),
(10, 'Virginia', 'Woolf', '1882-01-25');

INSERT INTO Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) VALUES
(1, '1984', 1, '1949-06-08', 5, 'Dystopian'),
(2, 'Pride and Prejudice', 2, '1813-01-28', 3, 'Romance'),
(3, 'Adventures of Huckleberry Finn', 3, '1884-12-10', 7, 'Adventure'),
(4, 'Harry Potter and the Philosopher s Stone', 4, '1997-06-26', 12, 'Fantasy'),
(5, 'Hamlet', 5, '1603-01-01', 4, 'Tragedy'),
(6, 'Great Expectations', 6, '1861-01-01', 6, 'Novel'),
(7, 'The Great Gatsby', 7, '1925-04-10', 8, 'Novel'),
(8, 'The Old Man and the Sea', 8, '1952-09-01', 10, 'Fiction'),
(9, 'War and Peace', 9, '1869-01-01', 2, 'Historical'),
(10, 'To the Lighthouse', 10, '1927-05-05', 5, 'Modernist');

SELECT * from Books;

SELECT * from Authors;

SELECT * from Books
where CopiesAvailable = 
(SELECT MAX(CopiesAvailable) from books);

SELECT AVG(YEAR(PublishedYear)) from Books;

SELECT COUNT(*) from books;

TRUNCATE TABLE Books;

DROP table Authors;