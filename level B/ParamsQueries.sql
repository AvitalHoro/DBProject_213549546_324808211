--The books have a specific minimum number of copies
SELECT 
    b.BookName,
    b.BookID,
    COUNT(bc.copyCode) AS NumberOfCopies
FROM 
    book b
JOIN 
    bookCopyInStock bc ON b.BookID = bc.BookID
GROUP BY 
    b.BookName,
    b.BookID
HAVING 
    COUNT(bc.copyCode) > &<name="numOFcopies" type=integer default=1
    required=true hint="enter a minimum number of copies">
ORDER BY 
    NumberOfCopies &<name="sort accoring to" checkbox="desc, ">;
