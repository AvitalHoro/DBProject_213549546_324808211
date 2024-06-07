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

--Which books were specifically ordered
SELECT
  bo.orderid,
  ord.orderdate AS OrderDate,
  b.bookname AS BookName,
  b.bookpublisher,
  r.readerName
FROM
  bookordering bo  
JOIN
  ordering ord ON bo.orderid = ord.orderid
JOIN
  book b ON bo.bookid = b.bookid
JOIN
  reader r ON bo.readerNumber=r.readerNumber
WHERE
  bo.orderid = &<name="order number" hint="what your order number?">
ORDER BY
  b.bookname;

--Number of orders that suppliers delivered in a specific date range
SELECT
  s.supName,
  s.supphone,
  COUNT(o.orderid) AS number_of_delivered_orders
FROM
  ordering o
JOIN
  supplier s ON o.supid = s.supid
WHERE
  o.orderdate BETWEEN TO_DATE('&startDate', 'DD-MM-YYYY') AND TO_DATE('&endDate', 'DD-MM-YYYY')
  AND o.status = 'Delivered'
GROUP BY
  s.supName, s.sphone
ORDER BY
  number_of_delivered_orders DESC;
  
--Update book orders under a specific order number
UPDATE bookOrdering
SET orderID = &<name="order_number" hint="The order in which the books you selected were ordered">
WHERE bookID IN (
    &<name="books_name" 
      list="SELECT bor.bookID, b.bookName 
            FROM bookOrdering bor 
            JOIN book b ON bor.bookID = b.bookID 
            WHERE bor.orderID IS NULL" 
      multiselect="yes">
);
