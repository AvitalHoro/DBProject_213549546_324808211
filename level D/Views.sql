--View to return details for each order: 
--name of the orderer, name of the supplier, number of books ordered and price.
CREATE OR REPLACE VIEW LibrarianOrderDetails AS
SELECT 
    P.Pname AS LibrarianName,
    O.orderId AS OrderNumber,
    O.orderDate AS OrderDate,
    SP.Pname AS SupplierName,
    COUNT(BO.BookID) AS NumberOfBooksOrdered,
    O.totalPrice AS PriceCharged
FROM 
    Librarian L
JOIN 
    Person P ON L.personId = P.personId
JOIN 
    Ordering O ON L.personId = O.personId
JOIN 
    Supplier S ON O.supid = S.supid
JOIN 
    Person SP ON S.supid = SP.personId
JOIN 
    BookOrdering BO ON O.orderId = BO.orderId
GROUP BY 
    P.Pname, O.orderId, O.orderDate, SP.Pname, O.totalPrice;


--Returns the 10 most expensive orders placed
SELECT *
FROM LibrarianOrderDetails
ORDER BY PriceCharged DESC
FETCH FIRST 10 ROWS ONLY;

--Returns how much money the library owes to each supplier
SELECT 
    SupplierName,
    SUM(PriceCharged) AS TotalAmountPaid
FROM 
    LibrarianOrderDetails
GROUP BY 
    SupplierName;


--To update the order prices (if they are still not updated)
UPDATE Ordering O
SET O.TOTALPRICE = (
    SELECT SUM(B.BOOKPRICE)
    FROM BookOrdering BO
    JOIN Book B ON BO.BookID = B.BookID
    WHERE BO.orderId = O.orderId
);
