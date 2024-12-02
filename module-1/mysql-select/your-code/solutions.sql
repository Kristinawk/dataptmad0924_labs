-- Write your queries bellow

--- Challenge 1:

SELECT authors.au_id AS [AUTHOR ID], au_lname AS [LAST NAME], au_fname AS [FIRST NAME], title AS [TITLE], pub_name AS [PUBLISHER]
FROM authors
    INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
    INNER JOIN titles ON titleauthor.title_id = titles.title_id
    INNER JOIN publishers ON titles.pub_id = publishers.pub_id
    
    
--- Challenge 2:

SELECT authors.au_id AS [AUTHOR ID], au_lname AS [LAST NAME], au_fname AS [FIRST NAME], pub_name AS [PUBLISHER], COUNT(DISTINCT titles.title_id) AS [TITLE COUNT]
FROM authors
    INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
    INNER JOIN titles ON titleauthor.title_id = titles.title_id
    INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY [AUTHOR ID], [PUBLISHER]
ORDER BY [AUTHOR ID] DESC

--- Challenge 3:

SELECT authors.au_id AS [AUTHOR ID], au_lname AS [LAST NAME], au_fname AS [FIRST NAME], SUM(qty) AS [TOTAL]
FROM authors
    INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
    INNER JOIN titles ON titleauthor.title_id = titles.title_id
    INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY [AUTHOR ID]
ORDER BY [TOTAL] DESC
LIMIT 3

--- Challenge 4:

SELECT authors.au_id AS [AUTHOR ID], au_lname AS [LAST NAME], au_fname AS [FIRST NAME], SUM(qty) AS [TOTAL]
FROM authors
    INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
    INNER JOIN titles ON titleauthor.title_id = titles.title_id
    INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY [AUTHOR ID]
ORDER BY [TOTAL] DESC
LIMIT 23