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
