/* stored procedure for determining how many copies of "The Lost Tribe" are at the Sharpstown Library. */

USE db_library
GO
CREATE PROC dbo.uspLostTribe @Library VARCHAR(50) = NULL, @Book VARCHAR(50) = NULL
AS
SELECT Number_Of_Copies, BranchName, Title
FROM book_copies
	INNER JOIN library_branch ON book_copies.BranchID = library_branch.BranchID
	INNER JOIN books ON book_copies.BookID = books.BookID
WHERE BranchName = @Library AND Title = @Book

EXEC dbo.uspLostTribe @Library = 'Sharpstown', @Book = 'The Lost Tribe'


/* stored procedure for determining how many copies of "The Lost Tribe" are owned by each library branch. */

USE db_library
GO
CREATE PROC dbo.uspLostTribeLibraryCount
AS
SELECT Number_Of_Copies, BranchName, Title
FROM book_copies
	INNER JOIN library_branch ON book_copies.BranchID = library_branch.BranchID
	INNER JOIN books ON book_copies.BookID = books.BookID
WHERE BranchName IN ('Sharpstown', 'Central', 'Rosewood', 'Simi') AND Title = 'The Lost Tribe'

EXEC dbo.uspLostTribeLibraryCount


/* stored procedure for identifying what borrowers do not have a book currently checked out. */

USE db_library
GO
CREATE PROC dbo.uspNoBooksCheckedOut
AS
SELECT Name
FROM borrower
	LEFT OUTER JOIN book_loans ON borrower.CardNo = book_loans.CardNo
WHERE ISNULL(book_loans.CardNo, '') = '';

EXEC dbo.uspNoBooksCheckedOut



/* stored procedure for finding out what books are loaned out from Sharpstown with a due date of today. */

USE db_library
GO
CREATE PROC dbo.uspSharpstownBookLoans @Date VARCHAR(50) = NULL
AS
SELECT Title, Name, borrower.Address
FROM book_loans
	INNER JOIN books ON book_loans.BookID = books.BookID
	INNER JOIN borrower ON book_loans.CardNo = borrower.CardNo
	INNER JOIN library_branch ON book_loans.BranchID = library_branch.BranchID
WHERE DateDue = @Date AND BranchName = 'Sharpstown'

EXEC dbo.uspSharpstownBookLoans @Date = '2020-02-17'


/* stored procedure for finding out the total number of books loaned out from each branch. */

USE db_library
GO
CREATE PROC dbo.uspTotalBookLoans
AS
SELECT book_loans.BranchID,
	sum(case when book_loans.BranchID = 1 then 1 else 0 end)BooksLoaned,
	sum(case when book_loans.BranchID = 2 then 1 else 0 end)BooksLoaned,
	sum(case when book_loans.BranchID = 3 then 1 else 0 end)BooksLoaned,
	sum(case when book_loans.BranchID = 4 then 1 else 0 end)BooksLoaned,
	BranchName
FROM book_loans
	INNER JOIN library_branch ON book_loans.BranchID = library_branch.BranchID
GROUP BY book_loans.BranchID, BranchName

EXEC dbo.uspTotalBookLoans


/* stored procedure for finding out who has more than 5 books checked out. */

USE db_library
GO
CREATE PROC dbo.uspMoreThanFiveLoaned
AS
SELECT book_loans.CardNo,
	sum(case when book_loans.CardNo = 2000 then 1 else 0 end) CheckedOut,
	sum(case when book_loans.CardNo = 2001 then 1 else 0 end) CheckedOut,
	sum(case when book_loans.CardNo = 2002 then 1 else 0 end) CheckedOut,
	sum(case when book_loans.CardNo = 2003 then 1 else 0 end) CheckedOut,
	sum(case when book_loans.CardNo = 2004 then 1 else 0 end) CheckedOut,
	sum(case when book_loans.CardNo = 2005 then 1 else 0 end) CheckedOut,
	sum(case when book_loans.CardNo = 2006 then 1 else 0 end) CheckedOut,
	sum(case when book_loans.CardNo = 2007 then 1 else 0 end) CheckedOut,
	Name, Address
FROM book_loans
	INNER JOIN borrower ON book_loans.CardNo = borrower.CardNo
GROUP BY book_loans.CardNo, Name, Address 
HAVING count(*) >= 5

EXEC dbo.uspMoreThanFiveLoaned


/* stored procedure for finding out the title and number of books by the author Stephen King at the Central branch. */

USE db_library
GO
CREATE PROC dbo.uspStephenKing
AS
SELECT Title, Number_Of_Copies, BranchName
FROM books
	INNER JOIN book_copies ON books.BookID = book_copies.BookID
	INNER JOIN book_authors ON books.BookID = book_authors.BookID
	INNER JOIN library_branch ON book_copies.BranchID = library_branch.BranchID
WHERE AuthorName = 'Stephen King' AND BranchName = 'Central'

EXEC dbo.uspStephenKing