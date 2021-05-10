USE book_shop;
SELECT count(title) AS "Number of Books" FROM books;
-- should have done count(*)
SELECT released_year, COUNT(title)
FROM books
GROUP BY released_year
ORDER BY released_year;
SELECT sum(stock_quantity) FROM books;
SELECT author_fname, author_lname, AVG(released_year) FROM books
GROUP BY author_lname, author_fname;
SELECT CONCAT
(
	author_fname, ' ', author_lname
) AS author,
pages FROM books 
WHERE pages=
(
SELECT MAX(pages) FROM books
);
SELECT released_year AS year,
count(title) AS "# books",
AVG(pages) AS 'avg pages' FROM books
GROUP BY released_year
ORDER BY released_year; 
