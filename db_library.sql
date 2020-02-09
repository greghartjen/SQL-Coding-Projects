CREATE TABLE library_branch (
		BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BranchName VARCHAR(50) NOT NULL,
		Address VARCHAR(50) NOT NULL
	);

CREATE TABLE publisher (
		PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
		Address VARCHAR(50) NOT NULL,
		Phone VARCHAR(50) NOT NULL
	);

CREATE TABLE books (
		BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		Title VARCHAR(50) NOT NULL,
		PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
	);

CREATE TABLE book_authors (
		BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		AuthorName VARCHAR(50) NOT NULL
	);

CREATE TABLE book_copies (
		BookID INT NOT NULL CONSTRAINT fk_BookID1 FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		Number_Of_Copies INT NOT NULL
	);

CREATE TABLE borrower (
		CardNo INT PRIMARY KEY NOT NULL IDENTITY (2000,1),
		Name VARCHAR(50) NOT NULL,
		Address VARCHAR(50) NOT NULL,
		Phone VARCHAR(50) NOT NULL
	);

CREATE TABLE book_loans (
		BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL CONSTRAINT fk_BranchID1 FOREIGN KEY REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		DateOut Date NOT NULL,
		DateDue Date NOT NULL
	);

INSERT INTO library_branch
		(BranchName, Address)
		VALUES
		('Sharpstown', '3464 Main St'),
		('Central', '684 Central Ave'),
		('Rosewood', '3458 Rose Quarter Dr'),
		('Simi', '4386 Erringer Rd')
	;

INSERT INTO books
		(Title, PublisherName)
		VALUES
		('The Lost Tribe', 'Brightwood Books'),
		('The Stand', 'Walrus Books'),
		('Salems Lot', 'Walrus Books'),
		('Hardboiled Wonderland', 'Penguin Publishers'),
		('Norwegian Wood', 'Penguin Publishers'),
		('Mistborn', 'Scholastic Reading'),
		('The Age of Kings', 'Scholastic Reading'),
		('Name of the Wind', 'Brightwood Books'),
		('Wise Mans Fear', 'Brightwood Books'),
		('The Martian', 'Intergalactic Publishing'),
		('Beyond Space', 'Intergalactic Publishing'),
		('The Road', 'Penguin Publishers'),
		('Blood Meridian', 'Penguin Publishers'),
		('The Call of Cthulhu', 'Dark Books'),
		('At the Mountains of Madness', 'Dark Books'),
		('Annihilation', 'Walrus Books'),
		('Borne', 'Walrus Books'),
		('East of Eden', 'Classic Publishing'),
		('Of Mice and Men', 'Classic Publishing'),
		('The Long Road Home', 'Brightwood Books')
	;

INSERT INTO publisher
		(PublisherName, Address, Phone)
		VALUES
		('Brightwood Books', '365 Brightwood Ln', '503-234-7632'),
		('Classic Publishing', '96234 Briar Rd', '805-354-1238'),
		('Walrus Books', '9763 Sunset Blvd', '310-476-2365'),
		('Dark Books', '2514 Dreary Ln', '354-231-7698'),
		('Penguin Publishers', '723 Arctic Reach Rd', '818-565-5555'),
		('Intergalactic Publishing', '4242 Outer Reach Rd', '546-234-7787'),
		('Scholastic Reading', '234 Main St', '301-263-7254')
	;

INSERT INTO book_authors
		(BookID, AuthorName)
		VALUES
		(3, 'Stephen King'),
		(4, 'Stephen King'),
		(19, 'John Steinbeck'),
		(20, 'John Steinbeck'),
		(9, 'Patrick Rothfuss'),
		(10, 'Patrick Rothfuss'),
		(7, 'Brandon Sanderson'),
		(8, 'Brandon Sanderson'),
		(11, 'Andy Weir'),
		(12, 'Andy Weir'),
		(13, 'Cormac McCarthy'),
		(14, 'Cormac McCarthy'),
		(17, 'Jeff VanderMeer'),
		(18, 'Jeff VanderMeer'),
		(5, 'Haruki Murakami'),
		(6, 'Haruki Murakami'),
		(15, 'H.P. Lovecraft'),
		(16, 'H.P. Lovecraft'),
		(2, 'John Bellinger'),
		(21, 'John Bellinger')
	;

INSERT INTO borrower
		(Name, Address, Phone)
		VALUES
		('John Smith', '247 Clarktown Rd', '234-598-4753'),
		('Betty Jo', '9254 Country Rd', '452-652-2642'),
		('Barbara Ann', '215 Big Sky Dr', '735-264-7524'),
		('Greg Hart', '8433 43rd Ave', '576-476-2386'),
		('Mike Hill', '776 Wellton Blvd', '364-352-6677'),
		('Jeremy Rodriguez', '4422 Green Summit Ln', '573-256-6523'),
		('Lydia Frankerton', '253 Soft Clouds Rd', '264-623-6734'),
		('Margaret Belvue', '3355 Lost Canyon Blvd', '672-845-2345')
	;

INSERT INTO book_copies
		(BookID, BranchID, Number_Of_Copies)
		VALUES
		(2, 1, 10),
		(3, 1, 4),
		(5, 1, 2),
		(6, 1, 8),
		(7, 1, 5),
		(8, 1, 5),
		(19, 1, 6),
		(9, 1, 4),
		(10, 1, 4),
		(13, 1, 5),
		(3, 2, 5),
		(4, 2, 5),
		(2, 2, 2),
		(15, 2, 4),
		(17, 2, 3),
		(21, 2, 4),
		(19, 2, 3),
		(11, 2, 6),
		(10, 2, 3),
		(8, 2, 9),
		(21, 3, 4),
		(20, 3, 4),
		(19, 3, 4),
		(17, 3, 6),
		(15, 3, 5),
		(13, 3, 4),
		(11, 3, 5),
		(10, 3, 4),
		(9, 3, 4),
		(4, 3, 4),
		(4, 4, 3),
		(5, 4, 4),
		(7, 4, 4),
		(9, 4, 3),
		(11, 4, 6),
		(13, 4, 5),
		(15, 4, 3),
		(17, 4, 4),
		(18, 4, 5),
		(19, 4, 4)
	;

INSERT INTO book_loans
		(BookID, BranchID, CardNo, DateOut, DateDue)
		VALUES
		(2, 1, 2000, '2020-02-04', '2020-03-11'),
		(3, 1, 2000, '2020-02-04', '2020-03-11'),
		(4, 1, 2000, '2020-02-04', '2020-03-11'),
		(7, 1, 2000, '2020-01-30', '2020-03-06'),
		(9, 1, 2000, '2020-01-30', '2020-03-06'),
		(10, 1, 2000, '2020-01-31', '2020-03-07'),
		(12, 1, 2000, '2020-01-31', '2020-03-07'),
		(19, 1, 2000, '2020-01-31', '2020-03-07'),
		(20, 1, 2000, '2020-01-31', '2020-03-07'),
		(21, 1, 2000, '2020-01-31', '2020-03-07'),
		(5, 2, 2001, '2020-02-04', '2020-03-11'),
		(8, 2, 2001, '2020-02-04', '2020-03-11'),
		(13, 2, 2001, '2020-02-04', '2020-03-11'),
		(15, 2, 2001, '2020-02-04', '2020-03-11'),
		(2, 3, 2003, '2020-02-04', '2020-03-11'),
		(5, 3, 2003, '2020-02-04', '2020-03-11'),
		(8, 2, 2003, '2020-02-01', '2020-03-08'),
		(9, 1, 2003, '2020-01-31', '2020-03-07'),
		(11, 1, 2003, '2020-01-31', '2020-03-07'),
		(14, 1, 2003, '2020-01-31', '2020-03-07'),
		(17, 1, 2003, '2020-01-31', '2020-03-07'),
		(21, 1, 2003, '2020-01-31', '2020-03-07'),
		(3, 4, 2004, '2020-02-04', '2020-03-11'),
		(5, 4, 2004, '2020-02-04', '2020-03-11'),
		(7, 4, 2004, '2020-02-04', '2020-03-11'),
		(11, 4, 2004, '2020-02-01', '2020-03-08'),
		(6, 3, 2005, '2020-01-27', '2020-03-03'),
		(2, 2, 2006, '2020-02-04', '2020-03-11'),
		(4, 2, 2006, '2020-02-04', '2020-03-11'),
		(5, 2, 2006, '2020-02-04', '2020-03-11'),
		(8, 3, 2006, '2020-01-31', '2020-03-07'),
		(9, 3, 2006, '2020-01-31', '2020-03-07'),
		(10, 3, 2006, '2020-01-31', '2020-03-07'),
		(12, 3, 2006, '2020-01-30', '2020-03-06'),
		(14, 3, 2006, '2020-01-29', '2020-03-05'),
		(17, 3, 2006, '2020-01-29', '2020-03-05'),
		(18, 2, 2006, '2020-01-28', '2020-03-04'),
		(19, 2, 2006, '2020-01-28', '2020-03-04'),
		(20, 2, 2006, '2020-01-28', '2020-03-04'),
		(2, 1, 2007, '2020-02-04', '2020-03-11'),
		(7, 1, 2007, '2020-02-04', '2020-03-11'),
		(8, 1, 2007, '2020-02-04', '2020-03-11'),
		(10, 1, 2007, '2020-02-04', '2020-03-11'),
		(11, 1, 2007, '2020-02-04', '2020-03-11'),
		(12, 1, 2007, '2020-02-04', '2020-03-11'),
		(14, 1, 2007, '2020-01-14', '2020-02-21'),
		(17, 1, 2007, '2020-01-14', '2020-02-21'),
		(18, 1, 2007, '2020-01-14', '2020-02-21'),
		(20, 1, 2007, '2020-01-10', '2020-02-17'),
		(21, 1, 2007, '2020-01-10', '2020-02-17')
	;