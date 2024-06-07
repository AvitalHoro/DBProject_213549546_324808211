-- count the number of copies and orders for each book
SELECT 
    b.bookID,
    b.BookName,
    COUNT(DISTINCT c.copycode) AS number_of_copies,
    COUNT(DISTINCT bo.readerorderid) AS number_of_orders
FROM 
    book b
LEFT JOIN 
    bookCopyInStock c ON b.bookID = c.bookID
LEFT JOIN 
    bookOrdering bo ON b.bookID = bo.bookID
GROUP BY 
    b.bookID, b.BookName

-- count the number of books and the number of unique book titles for each department
SELECT 
    c.classID,
    c.className,
    c.locationC,
    COUNT(bc.bookID) AS TotalBooks,  -- Total number of book copies
    COUNT(DISTINCT b.bookID) AS NetNumberOfBooks  -- Unique book titles with at least one copy
FROM 
    bookClass c
LEFT JOIN 
    book b ON c.classID = b.classID
JOIN 
    bookcopyinstock bc ON b.bookid = bc.bookid
GROUP BY 
    c.classID, c.className, c.locationC
ORDER BY
    TotalBooks DESC;

--The books that are found more than 5 times in the bookOrdering table or in the "borrowed" status
SELECT 
    b.BookName,
    b.BookID,
    (SELECT COUNT(*)
     FROM bookOrdering bo
     WHERE bo.BookID = b.BookID) AS NumberOfOrders,
    (SELECT COUNT(*)
     FROM bookCopyInStock bc
     WHERE bc.BookID = b.BookID AND bc.status = 'Borrowed') AS NumberOfAvailableCopies,
    (SELECT COUNT(*)
     FROM bookCopyInStock bc
     WHERE bc.BookID = b.BookID AND bc.status = 'Available') AS NumberOfBorrowedCopies
FROM 
    book b
WHERE 
    (SELECT COUNT(*)
     FROM bookOrdering bo
     WHERE bo.BookID = b.BookID) +
    (SELECT COUNT(*)
     FROM bookCopyInStock bc
     WHERE bc.BookID = b.BookID AND bc.status = 'borrowed') > 5;

--The suppliers who have all their orders from the last month in "delivered" status
SELECT 
    s.supName,
    s.Sphone,
    EXTRACT(MONTH FROM MAX(o.orderDate)) AS LastOrderMonth,
    EXTRACT(DAY FROM MAX(o.orderDate)) AS LastOrderDay,
    EXTRACT(YEAR FROM MAX(o.orderDate)) AS LastOrderYear
FROM 
    supplier s
JOIN 
    ordering o ON s.supId = o.supId
WHERE 
    o.orderDate >= ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -1)
    AND o.orderDate <= TRUNC(SYSDATE, 'MM')
    AND NOT EXISTS (
        SELECT 1
        FROM ordering o2
        WHERE o2.supId = s.supId
        AND o2.orderDate >= ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -1)
        AND o2.orderDate <= TRUNC(SYSDATE, 'MM')
        AND o2.status != 'Delivered'
    )
GROUP BY 
    s.supName,
    s.Sphone
ORDER BY 
    LastOrderYear DESC,
    LastOrderMonth DESC,
    LastOrderDay DESC;

-- Deletes all book orders for which the number of copies of the book in the library in the "available" state is greater than 2.
Delete from bookOrdering
WHERE orderid is null and 2 > (SELECT COUNT(*)
           FROM bookCopyInStock
           WHERE bookOrdering.BookID = bookCopyInStock.BookID
             AND status = 'available');


-- Deletes all librarians who have not made any orders since 2020.
delete from librarian
WHERE NOT EXISTS (SELECT *
                  FROM ordering
                  WHERE librarian.LuserName = ordering.LuserName);

-- update the terms of the supplier
UPDATE supplier
SET terms = terms || ' (Ordered last year)'
WHERE supId IN (SELECT supId
                FROM ordering
                WHERE orderDate > ADD_MONTHS(SYSDATE, -12));

-- update the match order to book order duplication
UPDATE bookordering bo
SET bo.OrderID = (
    SELECT bo1.OrderID
    FROM bookordering bo1
    JOIN ordering o ON bo1.OrderID = o.OrderID
    WHERE o.orderDate = TRUNC(SYSDATE)
      AND bo1.BookID = bo.BookID
)
WHERE EXISTS (
    SELECT 1
    FROM bookordering bo1
    JOIN ordering o ON bo1.OrderID = o.OrderID
    WHERE o.orderDate = TRUNC(SYSDATE)
      AND bo1.BookID = bo.BookID
)
AND bo.OrderID IS NULL;
